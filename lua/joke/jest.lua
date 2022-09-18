local _2afile_2a = "fnl/joke/jest.fnl"
local _2amodule_name_2a = "joke.jest"
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
local a, str = autoload("joke.aniseed.core"), autoload("joke.aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["str"] = str
local function get_cmd(test)
  return {"npm", "test", "--", "--testNamePattern", test}
end
_2amodule_2a["get-cmd"] = get_cmd
local function log_msgs(_, msgs)
  if msgs then
    for _0, value in pairs(msgs) do
      print(value)
    end
    return nil
  else
    return nil
  end
end
_2amodule_2a["log-msgs"] = log_msgs
local function log_to_buffer(_, msgs)
  local bufnr = vim.api.nvim_get_current_buf()
  if msgs then
    local function _2_(_241)
      return ("// " .. _241)
    end
    return vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, a.map(_2_, msgs))
  else
    return nil
  end
end
_2amodule_2a["log-to-buffer"] = log_to_buffer
local function execute_cmd(cmd)
  return vim.fn.jobstart(cmd, {stdout_buffered = true, stderr_buffered = true, on_stdout = log_to_buffer, on_stderr = log_to_buffer})
end
_2amodule_2a["execute-cmd"] = execute_cmd
local function execute_test(test)
  local cmd = get_cmd(test)
  return execute_cmd(cmd)
end
_2amodule_2a["execute-test"] = execute_test
--[[ (render-cmd "should divide numbers") (execute-cmd ["npm" "test" "--" "--testNamePattern" "should divide numbers"]) (execute-cmd ["npm" "test"]) ]]--
return _2amodule_2a