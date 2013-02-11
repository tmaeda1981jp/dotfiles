(require 'helm-config)
(require 'helm-ls-git)
;; (require 'helm-projectile) ;; 遅いので使わない

(defun my:helm ()
  (interactive)
  (helm-other-buffer
   '(
     helm-c-source-files-in-current-dir
     helm-c-source-recentf
     helm-c-source-buffers-list
;;     helm-c-source-ls-git
;;     helm-c-source-imenu
;;     helm-c-source-ls-git-status
;;     helm-c-source-projectile-files-list
     )
   " *helm*"))
(global-set-key (kbd "C-l") 'my:helm)
(setq recentf-max-saved-items 10)
(setq recentf-max-saved-items 100)

;; ---------------------------------------------------------------
;; helm-c-color-moccur
;; ref: http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
;; ---------------------------------------------------------------
(require 'color-moccur)
;; 複数の検索語や、特定のフェイスのみマッチなどの機能を有効にする
(setq moccur-split-word t)
;; helm-c-moccurの設定
(require 'helm-c-moccur)

(global-set-key (kbd "C-s") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-s") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))

;; ---------------------------------------------------------------
;; helm-imenu
;; ---------------------------------------------------------------
(require 'helm-imenu)
(global-set-key (kbd "C-r") 'helm-imenu)

;; ---------------------------------------------------------------
;; helm-ls-git
;; ---------------------------------------------------------------
(global-set-key (kbd "C-c C-l") 'helm-ls-git-ls)

;; mini-bufferでもC-hが使えるようにする設定
;; refs: https://github.com/emacs-helm/helm/issues/24#issuecomment-4686806
(define-key key-translation-map [?\C-h] [?\C-?])
