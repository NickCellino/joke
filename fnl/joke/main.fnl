(module joke.main
  {autoload {a joke.aniseed.core
             buffer joke.buffer
             core joke
             dbgm joke.dbg
             jest joke.jest
             mapping joke.mapping
             nvim joke.aniseed.nvim
             ts-utils nvim-treesitter.ts_utils
             ts joke.treesitter}})

(def dbg dbgm.dbg)

(defn execute-test-at-cursor []
  (let [test (ts.get-enclosing-test-at-cursor)]
    (jest.execute-test test)))

(defn init-mappings []
  (vim.keymap.set
   :n
   "<leader>jt"
   execute-test-at-cursor
   {:noremap true})

  (vim.keymap.set
   :n
   "<leader>ob"
   buffer.open-log-buffer)

  (vim.keymap.set
   :n
   "<leader>kn"
   ts.keep-test-node
   {:noremap true})

  (vim.keymap.set
   :n
   "<leader>dc"
   (fn [] ((a.get (core.get-config) :cfg-test)))))

(defn init []
  (init-mappings))

