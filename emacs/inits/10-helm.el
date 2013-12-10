(require 'helm-config)
(require 'helm-ls-git)

(defun my:helm ()
  (interactive)
  (helm-other-buffer
   '(
     helm-c-source-recentf
     helm-c-source-buffers-list
     helm-c-source-files-in-current-dir
     )
   " *helm*"))
(global-set-key (kbd "C-l") 'my:helm)
(setq recentf-max-saved-items 15)

(require 'helm-anything)
(helm-anything-set-keys)

;; ---------------------------------------------------------------
;; helm-imenu
;; ---------------------------------------------------------------
(require 'helm-imenu)
(global-set-key (kbd "C-r") 'helm-imenu)

;; ---------------------------------------------------------------
;; helm-ls-git
;; ---------------------------------------------------------------
(global-set-key (kbd "C-c C-l") 'helm-ls-git-ls)

;; ---------------------------------------------------------------
;; helm-M-x
;; ---------------------------------------------------------------
(global-set-key (kbd "M-x") 'helm-M-x)

;; ---------------------------------------------------------------
;; bufferを常に画面右側に表示させる為の設定
;; refs: http://stackoverflow.com/questions/9992475/how-to-show-anything-buffers-always-in-new-window
;; ---------------------------------------------------------------
(setq helm-display-function (lambda (buf)
                              (split-window-horizontally)
                              (other-window 1)
                              (switch-to-buffer buf)
                              ))

;; ---------------------------------------------------------------
;; mini-bufferでもC-hが使えるようにする設定
;; refs: http://mikio.github.io/article/2013/01/31_helmc-h.html
;; refs: http://blog.handlena.me/entry/2013/02/21/110818
;; ---------------------------------------------------------------
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

;; ---------------------------------------------------------------
;; google
;; ---------------------------------------------------------------
(setq helm-google-suggest-use-curl-p (executable-find "curl"))
(setq helm-google-suggest-search-url
      "http://www.google.co.jp/search?hl=ja&num=100&as_qdr=y5&lr=lang_ja&ie=utf-8&oe=utf-8&q=")
(setq helm-google-suggest-url
      "http://google.co.jp/complete/search?ie=utf-8&oe=utf-8&hl=ja&output=toolbar&q=")

;; ---------------------------------------------------------------
;; migemo
;; ---------------------------------------------------------------
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\g"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;; TODO helm-migemoをrequireするとoccurで絞込みができない．候補が出てこなくなる．
;; (require 'helm-migemo)
;; (define-key global-map [(control ?:)] 'helm-migemo)
(global-set-key (kbd "C-s") 'helm-occur)


;; ---------------------------------------------------------------
;; 半角スペース，全角スペース，タブの見える化
;; refs: http://qiita.com/catatsuy/items/55d50d13ebc965e5f31e
;; ---------------------------------------------------------------
(require 'whitespace)

(setq whitespace-style '(face tabs tab-mark spaces space-mark lines-tail trailing space-before-tab space-after-tab::space))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
;;      '((space-mark ?\x3000 [?\□])
      '((space-mark ?\x3000 [?\❏])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(global-whitespace-mode t)

(set-face-attribute 'whitespace-trailing nil
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :foreground "red"
                    :weight 'bold)
