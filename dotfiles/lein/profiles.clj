{
  :user {
    :plugins [
      [lein-ancient "0.6.15"]
      [lein-bikeshed "0.5.1"]
      [lein-cljfmt "0.6.4"]
      [lein-gen "0.2.2"]
      [lein-kibit "0.1.6"]
      [lein-pprint "1.2.0"]
      [com.jakemccrary/lein-test-refresh "0.23.0"]
      [cider/cider-nrepl "0.21.1"]
      [jonase/eastwood "0.3.5"]
      ; [venantius/ultra "0.5.2"]
      [venantius/yagni "0.1.7"]
    ]
    :dependencies [
      [cljfmt "0.6.4"]
      [cider/piggieback "0.4.0"]
      [org.clojure/tools.nrepl "0.2.13"]
      [jonase/eastwood "0.3.5"
       :exclusions [org.clojure/clojure]]
    ]
    :middleware [
      cider-nrepl.plugin/middleware
      lein-gen.plugin/middleware
      ; ultra.plugin/middleware
    ]
    :repl-options {
      :prompt (fn [ns] (str "[" ns "](\u001b[36mλ\u001b[0m)> "))
      :nrepl-middleware [cider.piggieback/wrap-cljs-repl]
    }
    :generators [
      [lein-gen/generators "0.2.1"]
    ]
    :ultra {
      :color-scheme :solarized_dark
    }
  }
}
