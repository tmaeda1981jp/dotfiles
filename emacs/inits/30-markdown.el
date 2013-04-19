;; brew install markdownしておく．
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; C-tがtmuxと重なるのでC-sに変更する
(define-key markdown-mode-map "\C-c\C-sh" 'markdown-insert-header-dwim)
(define-key markdown-mode-map "\C-c\C-sH" 'markdown-insert-header-setext-dwim)
(define-key markdown-mode-map "\C-c\C-s1" 'markdown-insert-header-atx-1)
(define-key markdown-mode-map "\C-c\C-s2" 'markdown-insert-header-atx-2)
(define-key markdown-mode-map "\C-c\C-s3" 'markdown-insert-header-atx-3)
(define-key markdown-mode-map "\C-c\C-s4" 'markdown-insert-header-atx-4)
(define-key markdown-mode-map "\C-c\C-s5" 'markdown-insert-header-atx-5)
(define-key markdown-mode-map "\C-c\C-s6" 'markdown-insert-header-atx-6)
(define-key markdown-mode-map "\C-c\C-s!" 'markdown-insert-header-setext-1)
(define-key markdown-mode-map "\C-c\C-s@" 'markdown-insert-header-setext-2)
(define-key markdown-mode-map "\C-c\C-st" 'markdown-insert-header-setext-1)
(define-key markdown-mode-map "\C-c\C-ss" 'markdown-insert-header-setext-2)
