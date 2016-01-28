(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c C-y") 'helm-flycheck))

(global-set-key "\M-e" 'flycheck-next-error)
(global-set-key "\M-E" 'flycheck-prev-error)
(setq flycheck-display-errors-delay 0.3)

;; ;; setting for js
;; ;; http://www.emacswiki.org/emacs/Flycheck
;; (require 'flycheck)
;; (flycheck-define-checker javascript-jslint-reporter
;;   "A JavaScript syntax and style checker based on JSLint Reporter.

;; See URL `https://github.com/FND/jslint-reporter'."
;;   :command ("~/.emacs.d/lang/js/jslint-reporter/jslint-reporter" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ":" line ":" column ":" (message) line-end))
;;   :modes (js-mode js2-mode js3-mode))
;; (add-hook 'js2-mode-hook (lambda ()
;;                           (flycheck-select-checker 'javascript-jslint-reporter)
;;                           (flycheck-mode)))
