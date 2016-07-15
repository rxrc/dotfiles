{
  :user {
    :plugins [
      [lein-bikeshed "0.2.0"]
      [lein-cljfmt "0.3.0"]
      [lein-gen "0.2.1"]
      [lein-kibit "0.1.2"]
      [lein-pprint "1.1.2"]
      [com.jakemccrary/lein-test-refresh "0.11.0"]
      [cider/cider-nrepl "0.10.0"]
      [jonase/eastwood "0.2.2"]
      [venantius/ultra "0.4.0"]
      [venantius/yagni "0.1.4"]
    ]
    :dependencies [
      [cljfmt "0.3.0"]
      [com.cemerick/piggieback "0.2.1"]
      [org.clojure/tools.nrepl "0.2.12"]
      [jonase/eastwood "0.2.2"
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
