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
local a, buffer, core, dbg, str = autoload("joke.aniseed.core"), autoload("joke.buffer"), autoload("joke"), autoload("joke.dbg"), autoload("joke.aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["buffer"] = buffer
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["dbg"] = dbg
_2amodule_locals_2a["str"] = str
local function log_msgs(_, msgs)
  if msgs then
    for _0, value in pairs(msgs) do
      dbg.dbg(value)
    end
    return nil
  else
    return nil
  end
end
_2amodule_2a["log-msgs"] = log_msgs
local function log_to_buffer(_, msgs)
  if msgs then
    log_msgs(_, msgs)
    return buffer["append-to-buf"](msgs)
  else
    return nil
  end
end
_2amodule_2a["log-to-buffer"] = log_to_buffer
local function handle_execute_done(_, code, _0)
  if (code == 0) then
    return print("Test(s) passed. Press <leader>ob to view results")
  else
    return print("Some tests failed. Press <leader>ob to view results")
  end
end
_2amodule_2a["handle-execute-done"] = handle_execute_done
local function execute_cmd(cmd)
  return vim.fn.jobstart(cmd, {stdout_buffered = true, stderr_buffered = true, on_stdout = log_to_buffer, on_stderr = log_to_buffer, on_exit = handle_execute_done})
end
_2amodule_2a["execute-cmd"] = execute_cmd
local function execute_test(test)
  local get_cmd = a.get(core["get-config"](), "jest-cmd")
  local cmd = get_cmd(test)
  return execute_cmd(cmd)
end
_2amodule_2a["execute-test"] = execute_test
--[[ (render-cmd "should divide numbers") (execute-cmd ["npm" "test" "--" "--testNamePattern" "should divide numbers"]) (execute-cmd ["npm" "test"]) ]]--
return _2amodule_2a