(module joke.jest
  {autoload {a joke.aniseed.core
             buffer joke.buffer
             dbg joke.dbg
             str joke.aniseed.string}})

(defn get-cmd [test]
  ["npm" "test" "--" "--testNamePattern" test])

(defn log-msgs [_ msgs]
  (when msgs
    (each [_ value (pairs msgs)]
      (dbg.dbg value))))

(let [b ["foo" "bar" "" "baz"]]
  (a.filter #(not (a.empty? $1)) b))

(defn log-to-buffer [_ msgs]
  (when msgs
    (let [msgs (a.filter #(not (a.empty? $1)) msgs)]
      (log-msgs _ msgs)
      (buffer.append-to-buf msgs))))

(defn handle-execute-done [_ code _]
  (if (= code 0)
    (print "Test(s) passed. Press <leader>ob to view results")
    (print "Some tests failed. Press <leader>ob to view results")))

(defn execute-cmd [cmd]
  (vim.fn.jobstart
    cmd
    {:stdout_buffered true
     :stderr_buffered true
     :on_stdout log-to-buffer
     :on_stderr log-to-buffer
     :on_exit handle-execute-done}))

(defn execute-test [test]
  (let [cmd (get-cmd test)]
    (execute-cmd cmd)))

(comment
  (render-cmd "should divide numbers")
  (execute-cmd ["npm" "test" "--" "--testNamePattern" "should divide numbers"])
  (execute-cmd ["npm" "test"]))
