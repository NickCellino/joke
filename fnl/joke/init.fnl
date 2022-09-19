(module joke.init
  {autoload {a aniseed.core}})

(var config nil)

(defn default-jest-cmd [test-name]
  ["npm"
   "test"
   "--"
   "--testNamePattern"
   test-name])

(def defaults {:jest-cmd default-jest-cmd
               :cfg-test (fn [] (a.println "USING DEFAULT CONFIG"))})

(defn get-config []
  config)

(defn setup [cfg]
  (set config (a.merge defaults cfg))
  config)

