local _2afile_2a = "/Users/nicholas/Code/nvim-plugins/joke/dev/.lnvim.fnl"
local _2amodule_name_2a = "lnvim"
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
local autoload = (require("nvim-local-fennel.aniseed.autoload")).autoload
local jk = autoload("joke.main")
do end (_2amodule_locals_2a)["jk"] = jk
jk["print-cwd"]()
return _2amodule_2a