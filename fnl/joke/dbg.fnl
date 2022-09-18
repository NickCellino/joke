(module joke.dbg
  {autoload {a joke.aniseed.core
             str joke.aniseed.string}})

(defn dbg [...]
  (when vim.g.joke-dbg
    (print (str.join " " (a.concat
                           ["[DEBUG]:"]
                           [...])))))

