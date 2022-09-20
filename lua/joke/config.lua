local _2afile_2a = "fnl/joke/config.fnl"
local _2amodule_name_2a = "joke.config"
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
local function default_jest_cmd(test_name)
  return {"npm", "test", "--", "--testNamePattern", test_name}
end
_2amodule_2a["default-jest-cmd"] = default_jest_cmd
local defaults = {["jest-cmd"] = default_jest_cmd}
_2amodule_2a["defaults"] = defaults
local config = nil
local function init_config(user_cfg)
  config = a.merge(defaults, user_cfg)
  return nil
end
_2amodule_2a["init-config"] = init_config
local function get_in(ks)
  return a["get-in"](config, ks)
end
_2amodule_2a["get-in"] = get_in
return _2amodule_2a