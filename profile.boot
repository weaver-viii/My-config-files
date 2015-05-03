(swap! boot.repl/*default-dependencies*
       concat '[[lein-light-nrepl "0.1.0"]
                [org.clojure/clojurescript "0.0-2816"]])
(swap! boot.repl/*default-middleware*
       conj 'lighttable.nrepl.handler/lighttable-ops)
