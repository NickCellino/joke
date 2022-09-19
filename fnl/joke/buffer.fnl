(module joke.buffer
  {autoload {dbg joke.dbg
             nvim joke.aniseed.nvim}})

(def output-buffer "joke-output-buf")

(defn upsert-buffer [buf-name]
  (let [buf (nvim.fn.bufadd buf-name)]
    (nvim.fn.bufload buf)
    (nvim.buf_set_option buf :buftype :nofile)
    buf))

(defn append-to-buf [lines]
  (let [buf (upsert-buffer output-buffer)]
    (nvim.buf_set_lines buf -1 -1 false lines)))

(defn open-log-buffer []
  (let [buf (upsert-buffer output-buffer)]
    (dbg.dbg "Output buffer" buf)
    (vim.api.nvim_command (.. :buf buf))
    (nvim.win_set_cursor 0 [(nvim.buf_line_count buf) 0])))
