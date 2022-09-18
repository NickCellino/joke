local _2afile_2a = "fnl/joke/treesitter.fnl"
local _2amodule_name_2a = "joke.treesitter"
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
local dbgm, nvim, ts_utils = autoload("joke.dbg"), autoload("joke.aniseed.nvim"), autoload("nvim-treesitter.ts_utils")
do end (_2amodule_locals_2a)["dbgm"] = dbgm
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["ts-utils"] = ts_utils
local dbg = dbgm.dbg
_2amodule_2a["dbg"] = dbg
local function has_ts_parser_3f()
  local ok_3f, parser = pcall(vim.treesitter.get_parser)
  return (ok_3f and parser)
end
_2amodule_2a["has-ts-parser?"] = has_ts_parser_3f
local traversed_nodes = {}
local function strip_first_and_last_chars(s)
  local len_str = string.len(s)
  return string.sub(s, 2, (len_str - 1))
end
_2amodule_2a["strip-first-and-last-chars"] = strip_first_and_last_chars
local function test_name_from_call_exp(exp)
  local arguments = exp:child(1)
  local first_arg = arguments:child(1)
  local bufnr = vim.api.nvim_get_current_buf()
  local test_name_w_quotes = vim.treesitter.query.get_node_text(first_arg, bufnr)
  return strip_first_and_last_chars(test_name_w_quotes)
end
_2amodule_2a["test-name-from-call-exp"] = test_name_from_call_exp
local function call_expression_name(call_exp_node)
  local member_expression = call_exp_node:child(0)
  local identifier = member_expression:child(0)
  local bufnr = vim.api.nvim_get_current_buf()
  return vim.treesitter.query.get_node_text(member_expression, bufnr)
end
_2amodule_2a["call-expression-name"] = call_expression_name
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
  local node = get_enclosing_test(ts_utils.get_node_at_cursor())
  return print(test_name_from_call_exp(node))
end
_2amodule_2a["get-enclosing-test-at-cursor"] = get_enclosing_test_at_cursor
local kept_node = nil
local function keep_test_node()
  local node = get_enclosing_test(ts_utils.get_node_at_cursor())
  kept_node = node
  return nil
end
_2amodule_2a["keep-test-node"] = keep_test_node
local function get_kept_node()
  return kept_node
end
_2amodule_2a["get-kept-node"] = get_kept_node
--[[ (def node (get-kept-node)) (test-name-from-call-exp node) (let [arguments
 (node:child 1)
 first-arg
 (arguments:child 1)
 test-name
 (vim.treesitter.query.get_node_text first-arg 1)] (strip-first-and-last-chars test-name)) ]]--
return _2amodule_2a