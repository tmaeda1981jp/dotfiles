;; ---------------------------------------------------------------------------------------------------------------
;; typescript-mode
;; refs: http://blogs.msdn.com/b/interoperability/archive/2012/10/01/sublime-text-vi-emacs-typescript-enabled.aspx
;; ---------------------------------------------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(autoload 'typescript-mode "TypeScript" "Major mode for editing typescript." t)
