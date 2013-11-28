(require 'flymake)
(defun flymake-jslint-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    ;; nodeのjslintを使う.
    ;; npm install -g jslint
    (list "/usr/local/bin/jslint" (list "--terse" local-file))))

;; node v0.11でinstallされるjslintはformatが微妙に変わっているので修正が必要．
(setq flymake-err-line-patterns
    (cons '("^\\(.*\\)(\\([[:digit:]]+\\)):\\(.*\\)$"
              1 2 nil 3)
            flymake-err-line-patterns))

(setq flymake-allowed-file-name-masks
      (cons '(".+\\.js$"
              flymake-jslint-init
              flymake-simple-cleanup
              flymake-get-real-file-name)
            flymake-allowed-file-name-masks))
(provide 'flymake-jslint)
