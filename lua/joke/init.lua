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
local a = autoload("joke.aniseed.core")
do end (_2amodule_locals_2a)["a"] = a
local config = nil
local function default_jest_cmd(test_name)
  return {"npm", "test", "--", "--testNamePattern", test_name}
end
_2amodule_2a["default-jest-cmd"] = default_jest_cmd
local defaults
local function _1_()
  return a.println("USING DEFAULT CONFIG")
end
defaults = {["jest-cmd"] = default_jest_cmd, ["cfg-test"] = _1_}
_2amodule_2a["defaults"] = defaults
local function get_config()
  return config
end
_2amodule_2a["get-config"] = get_config
local function setup(cfg)
  config = a.merge(defaults, cfg)
  return config
end
_2amodule_2a["setup"] = setup
return _2amodule_2a