{:user {
        :dependencies [[cljfmt "0.1.7"]
                       [jonase/eastwood "0.2.1" :exclusions  [org.clojure/clojure]]]
        :plugins [[com.jakemccrary/lein-test-refresh "0.5.5"]
                  [lein-autoexpect "1.4.2"]
                  [lein-ancient "0.5.5"]
                  [jonase/eastwood "0.2.1"]
                  [lein-kibit "0.0.8"]
                  [lein-pprint "1.1.2"]
                  [venantius/ultra "0.3.3"]
                  [lein-cljfmt "0.1.10"]
                  [cider/cider-nrepl "0.8.2"]]
        :ultra {:color-scheme :solarized_dark}
        :test-refresh {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]}}}
