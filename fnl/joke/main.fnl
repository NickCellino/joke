(module joke.main
  {autoload {a joke.aniseed.core
             dbgm joke.dbg
             mapping joke.mapping
             nvim joke.aniseed.nvim
             ts-utils nvim-treesitter.ts_utils
             ts joke.treesitter}})

(def dbg dbgm.dbg)

(def foo "BAR")
(var hello "world")

(defn init-mappings []
  (vim.keymap.set
   :n
   "<leader>asdf"
   ts.get-enclosing-test-at-cursor
   {:noremap true})

  (vim.keymap.set
   :n
   "<leader>kn"
   ts.keep-test-node
   {:noremap true}))


(defn init []
  (init-mappings))

