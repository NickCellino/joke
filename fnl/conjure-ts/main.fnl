(module conjure-ts.main
  {autoload {a aniseed.core
             nvim aniseed.nvim}})

(defn print-cwd []
  (print (vim.fn.getcwd)))

(vim.keymap.set
  :n
  "<leader>asdf"
  print-cwd
  {:noremap true})
 
(defn init []
  nil)

