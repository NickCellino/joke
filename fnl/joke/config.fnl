(module joke.config
  {autoload {a joke.aniseed.core}})

(defn default-jest-cmd [test-name]
  ["npm"
   "test"
   "--"
   "--testNamePattern"
   test-name])

(def defaults {:jest-cmd default-jest-cmd})

(var config nil)

(defn init-config [user-cfg]
  (set config (a.merge defaults user-cfg)))

(defn get-in [ks]
  (a.get-in config ks))

