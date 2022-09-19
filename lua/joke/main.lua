local _2afile_2a = "fnl/joke/main.fnl"
local _2amodule_name_2a = "joke.main"
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
local a, buffer, dbgm, jest, mapping, nvim, ts, ts_utils = autoload("joke.aniseed.core"), autoload("joke.buffer"), autoload("joke.dbg"), autoload("joke.jest"), autoload("joke.mapping"), autoload("joke.aniseed.nvim"), autoload("joke.treesitter"), autoload("nvim-treesitter.ts_utils")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["buffer"] = buffer
_2amodule_locals_2a["dbgm"] = dbgm
_2amodule_locals_2a["jest"] = jest
_2amodule_locals_2a["mapping"] = mapping
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["ts"] = ts
_2amodule_locals_2a["ts-utils"] = ts_utils
local dbg = dbgm.dbg
_2amodule_2a["dbg"] = dbg
local function execute_test_at_cursor()
  local test = ts["get-enclosing-test-at-cursor"]()
  return jest["execute-test"](test)
end
_2amodule_2a["execute-test-at-cursor"] = execute_test_at_cursor
local function init_mappings()
  vim.keymap.set("n", "<leader>jt", execute_test_at_cursor, {noremap = true})
  vim.keymap.set("n", "<leader>ob", buffer["open-log-buffer"])
  return vim.keymap.set("n", "<leader>kn", ts["keep-test-node"], {noremap = true})
end
_2amodule_2a["init-mappings"] = init_mappings
local function init()
  return init_mappings()
end
_2amodule_2a["init"] = init
return _2amodule_2a