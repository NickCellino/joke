(module joke.init
  {autoload {a aniseed.core
             config joke.config}})

(defn setup [cfg]
  (print "in setup")
  (config.init-config cfg))

