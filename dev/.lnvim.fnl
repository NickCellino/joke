(module lnvim
  {autoload {jk joke}})

(set vim.g.joke-dbg false)

(jk.setup {:jest-cmd (fn [test-name]
                       ["npm"
                        "test"
                        "--"
                        "--testNamePattern"
                        test-name])})

