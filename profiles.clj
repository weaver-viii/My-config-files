{:user {:dependencies [[pjstadig/humane-test-output "0.6.0"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[com.jakemccrary/lein-test-refresh "0.5.5"]
                  [lein-autoexpect "1.4.2"]
                  [lein-ancient "0.5.5"]
                  [jonase/eastwood "0.2.1"]
                  [lein-kibit "0.0.8"]
                  [lein-pprint "1.1.2"]]
        :test-refresh {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]}}}
