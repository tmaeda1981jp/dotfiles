;; ------------------------------------------------
;; yasnippet
;; ref: https://github.com/capitaomorte/yasnippet
;; ref: http://fukuyama.co/yasnippet
;; ------------------------------------------------
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; personal collection
        "~/.emacs.d/elpa/yasnippet-20121225.430/snippets" ;; default collection
        ))
(yas-global-mode 1)
(custom-set-variables '(yas-trigger-key "TAB"))