(module joke.jest
  {autoload {str joke.aniseed.string}})

(defn get-cmd [test]
  ["npm" "test" "--" "--testNamePattern" test])

(defn log-msgs [_ msgs]
  (when msgs
    (each [_ value (pairs msgs)]
      (print value))))

(defn execute-cmd [cmd]
  (vim.fn.jobstart
    cmd
    {:stdout_buffered true
     :stderr_buffered true
     :on_stdout log-msgs
     :on_stderr log-msgs}))

(defn execute-test [test]
  (let [cmd (get-cmd test)]
    (execute-cmd cmd)))

(comment
  (render-cmd "should divide numbers")
  (execute-cmd ["npm" "test" "--" "--testNamePattern" "should divide numbers"])
  (execute-cmd ["npm" "test"]))
