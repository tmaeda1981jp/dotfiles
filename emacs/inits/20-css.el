;; css

(require 'helm-css-scss)
(setq helm-css-scss-insert-close-comment-depth 2)

(add-hook 'css-mode-hook
          (lambda ()
            (local-set-key "\C-r" 'helm-css-scss)))

;; sass

;; refs: http://qiita.com/sawamur@github/items/bb50d84af4d01a2eb5c2

(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   (local-set-key "\C-r" 'helm-css-scss)
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))

