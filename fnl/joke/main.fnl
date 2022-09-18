(module joke.main
  {autoload {a joke.aniseed.core
             dbgm joke.dbg
             mapping joke.mapping
             nvim joke.aniseed.nvim
             ts joke.treesitter
             ts-utils nvim-treesitter.ts_utils}})

(def dbg dbgm.dbg)

(defn init-mappings []
  (vim.keymap.set
   :n
   "<leader>asdf"
   ts.get-enclosing-test-at-cursor
   {:noremap true}))

(defn init []
  (init-mappings))

