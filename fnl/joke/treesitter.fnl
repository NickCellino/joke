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
  (get-enclosing-test (ts-utils.get_node_at_cursor)))


