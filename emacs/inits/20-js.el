;; ------------------------------------------------------------------------------
;; js2-mode
;; ref: https://github.com/mooz/js2-mode/tree/emacs24
;; ------------------------------------------------------------------------------
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(eval-after-load 'js2-mode
  '(progn
     (require 'js2-imenu-extras)
     (js2-imenu-extras-setup)))

;; ;; ------------------------------------------------------------------------------
;; ;; jslint
;; ;; ------------------------------------------------------------------------------
;; (require 'flymake)
;; (add-to-list 'load-path "~/.emacs.d/lang/js/jslint")
;; (require 'flymake-jslint)
;; (add-hook 'javascript-mode-hook
;;           (lambda () (flymake-mode t)))
;; (global-set-key "\M-e" 'flymake-goto-next-error)
;; (global-set-key "\M-E" 'flymake-goto-prev-error)
;; (global-set-key "\C-c\C-j" 'flymake-start-syntax-check)

;; (defun display-error-message ()
;;   (message (get-char-property (point) 'help-echo)))
;; (defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
;;   (display-error-message))
;; (defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
;;   (display-error-message))
;; (ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
;; (ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)


;; setting for js
;; http://www.emacswiki.org/emacs/Flycheck
(require 'flycheck)
(flycheck-define-checker javascript-jslint-reporter
  "A JavaScript syntax and style checker based on JSLint Reporter.

See URL `https://github.com/FND/jslint-reporter'."
  :command ("~/.emacs.d/lang/js/jslint-reporter/jslint-reporter" source)
  :error-patterns ((error line-start
                          (1+ nonl) ":" line ":" column ":" (message)
                          line-end))
  :modes (js-mode js2-mode js3-mode))

(add-hook 'js2-mode-hook
          (lambda ()
            ;; (local-set-key "\C-cr" 'js-console-execute-region)
            (local-set-key "\C-ci" 'js-doc-insert-function-doc)
            (imenu-add-menubar-index)
            (setq js2-basic-offset 2)
            ;; (flycheck-select-checker 'javascript-jslint-reporter)
            (flycheck-add-next-checker 'javascript-jslint-reporter 'javascript-jshint)
            (flycheck-mode)
            (hs-minor-mode 1)))

(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'js2-jsx-mode-hook 'flycheck-mode)
