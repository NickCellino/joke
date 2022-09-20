(module joke.init
  {autoload {a joke.aniseed.core
             config joke.config}})

(defn setup [cfg]
  (config.init-config cfg))

