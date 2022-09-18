(module conjure-ts.main
  {autoload {a conjure-ts.aniseed.core
             nvim conjure-ts.aniseed.nvim
             str conjure-ts.aniseed.string
             ts-utils nvim-treesitter.ts_utils}})

(defn print-cwd []
  (print (vim.fn.getcwd)))

(defn has-ts-parser? []
  (let [(ok? parser) (pcall vim.treesitter.get_parser)]
    (and ok? parser)))

(defn dbg [...]
  (print (str.join "" (a.concat
                        ["[DEBUG]: "]
                        [...]))))

; For debugging...
(var traversed-nodes [])

(comment
  (my-node:named_child 0))

(defn call-expression-name [call-exp-node]
  (let [member-expression (call-exp-node:child 0)
        identifier (member-expression:child 0)]
    (dbg "member-expression" member-expression)
    (dbg "identifier" identifier)
    (a.get (ts-utils.get_node_text member-expression) 1)))

(defn dbg-node [node]
  (dbg "NODE" node)
  (each [child-node (node:named_child 0)]
    (dbg "named child" child-node)))

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
  (get-enclosing-test (ts-utils.get_node_at_cursor)))

(defn print-node-info []
  (if (not (has-ts-parser?))
    (print "Typescript treesitter parser is required in order for this plugin to work.")
    (let [current-node (ts-utils.get_node_at_cursor)]
      (print current-node)
      (print (current-node:type)))))

(vim.keymap.set
  :n
  "<leader>asdf"
  get-enclosing-test-at-cursor
  {:noremap true})
 
(defn init []
  nil)

