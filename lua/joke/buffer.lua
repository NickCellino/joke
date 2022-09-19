local _2afile_2a = "fnl/joke/buffer.fnl"
local _2amodule_name_2a = "joke.buffer"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("joke.aniseed.autoload")).autoload
local dbg, nvim = autoload("joke.dbg"), autoload("joke.aniseed.nvim")
do end (_2amodule_locals_2a)["dbg"] = dbg
_2amodule_locals_2a["nvim"] = nvim
local output_buffer = "joke-output-buf"
_2amodule_2a["output-buffer"] = output_buffer
local function upsert_buffer(buf_name)
  local buf = nvim.fn.bufadd(buf_name)
  nvim.fn.bufload(buf)
  nvim.buf_set_option(buf, "buftype", "nofile")
  return buf
end
_2amodule_2a["upsert-buffer"] = upsert_buffer
local function append_to_buf(lines)
  local buf = upsert_buffer(output_buffer)
  return nvim.buf_set_lines(buf, -1, -1, false, lines)
end
_2amodule_2a["append-to-buf"] = append_to_buf
local function open_log_buffer()
  local buf = upsert_buffer(output_buffer)
  dbg.dbg("Output buffer", buf)
  vim.api.nvim_command(("buf" .. buf))
  return nvim.win_set_cursor(0, {nvim.buf_line_count(buf), 0})
end
_2amodule_2a["open-log-buffer"] = open_log_buffer
return _2amodule_2a