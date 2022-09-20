local _2afile_2a = "fnl/joke/init.fnl"
local _2amodule_name_2a = "joke.init"
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
local a, config = autoload("joke.aniseed.core"), autoload("joke.config")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["config"] = config
local function setup(cfg)
  print("in setup")
  return config["init-config"](cfg)
end
_2amodule_2a["setup"] = setup
return _2amodule_2a