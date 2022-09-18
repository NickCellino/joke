(module joke.jest
  {autoload {a joke.aniseed.core
             str joke.aniseed.string}})

(defn get-cmd [test]
  ["npm" "test" "--" "--testNamePattern" test])

(defn log-msgs [_ msgs]
  (when msgs
    (each [_ value (pairs msgs)]
      (print value))))

(defn log-to-buffer [_ msgs]
  (let [bufnr (vim.api.nvim_get_current_buf)]
    (when msgs
      (vim.api.nvim_buf_set_lines bufnr -1 -1 false (a.map #(.. "// " $1) msgs)))))

(defn execute-cmd [cmd]
  (vim.fn.jobstart
    cmd
    {:stdout_buffered true
     :stderr_buffered true
     :on_stdout log-to-buffer
     :on_stderr log-to-buffer}))
;     :on_stdout log-msgs
;     :on_stderr log-msgs}))

(defn execute-test [test]
  (let [cmd (get-cmd test)]
    (execute-cmd cmd)))

(comment
  (render-cmd "should divide numbers")
  (execute-cmd ["npm" "test" "--" "--testNamePattern" "should divide numbers"])
  (execute-cmd ["npm" "test"]))
