;; cucumber
;; https://github.com/michaelklishin/cucumber.el
(setq feature-default-language "ja")
(setq feature-default-i18n-file "~/.emacs.d/lang/gherkin/i18n.yml")

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
