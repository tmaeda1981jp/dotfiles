;; ---------------------------------------------------------------------------------------------------------------
;; typescript-mode
;; old - ;; refs: http://blogs.msdn.com/b/interoperability/archive/2012/10/01/sublime-text-vi-emacs-typescript-enabled.aspx
;; refs: http://blog.shibayu36.org/entry/2015/07/30/165626
;; ---------------------------------------------------------------------------------------------------------------
(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
;;(autoload 'typescript-mode "TypeScript" "Major mode for editing typescript." t)

;; refs: https://github.com/ananthakumaran/tide
(require 'tide)
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode t)
            (flycheck-typescript-tslint-setup)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (setq typescript-indent-level 2)
            (eldoc-mode t)
            (company-mode-on)))

