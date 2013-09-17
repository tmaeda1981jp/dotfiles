;;; 30-translate.el --- 

(require 'google-translate)

(global-set-key "\C-xt" 'google-translate-query-translate)
(global-set-key "\C-xT" 'google-translate-query-translate-reverse)

(custom-set-variables
  '(google-translate-default-source-language "ja")
  '(google-translate-default-target-language "en"))
