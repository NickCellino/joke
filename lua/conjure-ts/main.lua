local _2afile_2a = "fnl/conjure-ts/main.fnl"
local _2amodule_name_2a = "conjure-ts.main"
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
local autoload = (require("conjure-ts.aniseed.autoload")).autoload
local a, nvim, str, ts_utils = autoload("conjure-ts.aniseed.core"), autoload("conjure-ts.aniseed.nvim"), autoload("conjure-ts.aniseed.string"), autoload("nvim-treesitter.ts_utils")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["ts-utils"] = ts_utils
local function print_cwd()
  return print(vim.fn.getcwd())
end
_2amodule_2a["print-cwd"] = print_cwd
local function has_ts_parser_3f()
  local ok_3f, parser = pcall(vim.treesitter.get_parser)
  return (ok_3f and parser)
end
_2amodule_2a["has-ts-parser?"] = has_ts_parser_3f
local function dbg(...)
  return print(str.join("", a.concat({"[DEBUG]: "}, {...})))
end
_2amodule_2a["dbg"] = dbg
local traversed_nodes = {}
--[[ (my-node:named_child 0) ]]--
local function call_expression_name(call_exp_node)
  local member_expression = call_exp_node:child(0)
  local identifier = member_expression:child(0)
  dbg("member-expression", member_expression)
  dbg("identifier", identifier)
  return a.get(ts_utils.get_node_text(member_expression), 1)
end
_2amodule_2a["call-expression-name"] = call_expression_name
local function dbg_node(node)
  dbg("NODE", node)
  for child_node in node:named_child(0) do
    dbg("named child", child_node)
  end
  return nil
end
_2amodule_2a["dbg-node"] = dbg_node
local function get_enclosing_test(node)
  local node_type = node:type()
  table.insert(traversed_nodes, node)
  local function _1_()
    local func_name = call_expression_name(node)
    dbg("FUNC NAME", func_name)
    return ((func_name == "it") or (func_name == "test"))
  end
  if ((node_type == "call_expression") and _1_()) then
    dbg("FOUND IT", node)
    return node
  else
    local parent = node:parent()
    if parent then
      return get_enclosing_test(node:parent())
    else
      dbg("Found root!")
      return nil
    end
  end
end
_2amodule_2a["get-enclosing-test"] = get_enclosing_test
local function get_enclosing_test_at_cursor()
  return get_enclosing_test(ts_utils.get_node_at_cursor())
end
_2amodule_2a["get-enclosing-test-at-cursor"] = get_enclosing_test_at_cursor
local function print_node_info()
  if not has_ts_parser_3f() then
    return print("Typescript treesitter parser is required in order for this plugin to work.")
  else
    local current_node = ts_utils.get_node_at_cursor()
    print(current_node)
    return print(current_node:type())
  end
end
_2amodule_2a["print-node-info"] = print_node_info
vim.keymap.set("n", "<leader>asdf", get_enclosing_test_at_cursor, {noremap = true})
local function init()
  return nil
end
_2amodule_2a["init"] = init
return _2amodule_2a