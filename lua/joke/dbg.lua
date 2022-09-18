local _2afile_2a = "fnl/joke/dbg.fnl"
local _2amodule_name_2a = "joke.dbg"
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
local function dbg(...)
  if vim.g["joke-dbg"] then
    return print(str.join(" ", a.concat({"[DEBUG]:"}, {...})))
  else
    return nil
  end
end
_2amodule_2a["dbg"] = dbg
return _2amodule_2a