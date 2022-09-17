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
local a, nvim = autoload("conjure-ts.aniseed.core"), autoload("conjure-ts.aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
local function print_cwd()
  return print(vim.fn.getcwd())
end
_2amodule_2a["print-cwd"] = print_cwd
vim.keymap.set("n", "<leader>asdf", print_cwd, {noremap = true})
local function init()
  return nil
end
_2amodule_2a["init"] = init
return _2amodule_2a