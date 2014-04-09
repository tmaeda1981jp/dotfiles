;; brew install markdownしておく．
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; C-tがtmuxと重なるのでC-sに変更する
(add-hook 'markdown-mode-hook
          (lambda()
            (local-set-key "\C-c\C-sh" 'markdown-insert-header-dwim)
            (local-set-key "\C-c\C-sH" 'markdown-insert-header-setext-dwim)
            (local-set-key "\C-c\C-s1" 'markdown-insert-header-atx-1)
            (local-set-key "\C-c\C-s2" 'markdown-insert-header-atx-2)
            (local-set-key "\C-c\C-s3" 'markdown-insert-header-atx-3)
            (local-set-key "\C-c\C-s4" 'markdown-insert-header-atx-4)
            (local-set-key "\C-c\C-s5" 'markdown-insert-header-atx-5)
            (local-set-key "\C-c\C-s6" 'markdown-insert-header-atx-6)
            (local-set-key "\C-c\C-s!" 'markdown-insert-header-setext-1)
            (local-set-key "\C-c\C-s@" 'markdown-insert-header-setext-2)
            (local-set-key "\C-c\C-st" 'markdown-insert-header-setext-1)
            (local-set-key "\C-c\C-ss" 'markdown-insert-header-setext-2)
            (local-set-key "\C-c\C-sh" 'markdown-insert-header-dwim)
            (local-set-key "\C-c," 'markdown-cycle)))

(setq markdown-css-path
      "http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css")


;; https://github.com/gongo/emacs-realtime-markdown-viewer
(require 'realtime-markdown-viewer)
