(swap! boot.repl/*default-dependencies*
       concat '[lein-light-nrepl "0.1.0-LOCA"])
(swap! boot.repl/*default-middleware*
       conj 'lighttable.nrepl.handler/lighttable-ops)
