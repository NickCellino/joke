(module joke.treesitter
  {autoload {dbgm joke.dbg
             nvim joke.aniseed.nvim
             ts-utils nvim-treesitter.ts_utils}})

(def dbg dbgm.dbg)

(defn has-ts-parser? []
  (let [(ok? parser) (pcall vim.treesitter.get_parser)]
    (and ok? parser)))

; For debugging...
(var traversed-nodes [])

(defn strip-first-and-last-chars [s]
  (let [len-str (string.len s)]
    (string.sub s 2 (- len-str 1))))

(defn test-name-from-call-exp [exp]
  (let [arguments (exp:child 1)
        first-arg (arguments:child 1)
        bufnr (vim.api.nvim_get_current_buf)
        test-name-w-quotes (vim.treesitter.query.get_node_text first-arg bufnr)]
   (strip-first-and-last-chars test-name-w-quotes)))

(defn call-expression-name [call-exp-node]
  (let [member-expression (call-exp-node:child 0)
        identifier (member-expression:child 0)
        bufnr (vim.api.nvim_get_current_buf)]
    (vim.treesitter.query.get_node_text member-expression bufnr)))

; Climb the tree until we find a "call_expression" where the function is named
; 'it' or 'test'
(defn get-enclosing-test [node]
  (let [node-type (node:type)]
    (table.insert traversed-nodes node)
    (if (and (= node-type "call_expression")
             (let [func-name (call-expression-name node)]
               (dbg "FUNC NAME" func-name)
               (or (= func-name "it") (= func-name "test"))))
      (do
        (dbg "FOUND IT" node)
        node)
      (let [parent (node:parent)]
        (if parent
          (get-enclosing-test (node:parent))
          (do
            (dbg "Found root!")
            nil))))))

(defn get-enclosing-test-at-cursor []
  (let [node (get-enclosing-test (ts-utils.get_node_at_cursor))]
    (test-name-from-call-exp node)))

(var kept-node nil) 

(defn keep-test-node []
  (let [node (get-enclosing-test (ts-utils.get_node_at_cursor))]
    (set kept-node node)))

(defn get-kept-node []
  kept-node)

(comment
  (def node (get-kept-node))
  (test-name-from-call-exp node)

  ; child 1 is arguments
  ; child 1 of args is string 
  ; this is the test name 
  (let [arguments (node:child 1)
        first-arg (arguments:child 1)
        test-name (vim.treesitter.query.get_node_text first-arg 1)]
    (strip-first-and-last-chars test-name)))
    
