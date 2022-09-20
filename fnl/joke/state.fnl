(module joke.state
  {autoload {a aniseed.core}})

(defonce- state {:count 0})

(defn inc-count []
  (a.update state :count a.inc))

(defn get-count []
  (a.get state :count))

