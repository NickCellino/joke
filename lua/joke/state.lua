local _2afile_2a = "fnl/joke/state.fnl"
local _2amodule_name_2a = "joke.state"
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
local state = ((_2amodule_2a).state or {count = 0})
do end (_2amodule_locals_2a)["state"] = state
local function inc_count()
  return a.update(state, "count", a.inc)
end
_2amodule_2a["inc-count"] = inc_count
local function get_count()
  return a.get(state, "count")
end
_2amodule_2a["get-count"] = get_count
return _2amodule_2a