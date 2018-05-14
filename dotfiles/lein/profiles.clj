{
  :user {
    :plugins [
      [lein-ancient "0.6.15"]
      [lein-bikeshed "0.5.1"]
      [lein-cljfmt "0.5.7"]
      [lein-gen "0.2.2"]
      [lein-kibit "0.1.6"]
      [lein-pprint "1.2.0"]
      [com.jakemccrary/lein-test-refresh "0.22.0"]
      [cider/cider-nrepl "0.17.0"]
      [jonase/eastwood "0.2.6"]
      [venantius/ultra "0.5.2"]
      [venantius/yagni "0.1.4"]
    ]
    :dependencies [
      [cljfmt "0.5.7"]
      [com.cemerick/piggieback "0.2.2"]
      [org.clojure/tools.nrepl "0.2.13"]
      [jonase/eastwood "0.2.6"
       :exclusions [org.clojure/clojure]]
    ]
    :repl-options {
      :prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))
      :nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]
    }
    :generators [
      [lein-gen/generators "0.2.1"]
    ]
    :ultra {
      :color-scheme :solarized_dark
    }
  }
}
