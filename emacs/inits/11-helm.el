(use-package helm
  :init
  (require 'helm-config)
  (setq helm-for-files-preferred-list
        '(helm-source-buffers-list
          helm-source-recentf
          helm-source-file-cache
          helm-source-files-in-current-dir
          ;;helm-source-locate
          ))
  (setq helm-truncate-lines t)
  (setq helm-split-window-in-side-p t)
  :bind
  (
   ("M-x" . helm-M-x)
   ("C-l" . helm-for-files)
   ("C-s" . helm-occur)
   ("M-l" . helm-buffers-list))
  :config
  ;; --------------------------------------------------------------
  ;; minibufferでCtrl-H
  ;; ref: http://emacs.rubikitch.com/backward-delete-char/
  ;; --------------------------------------------------------------
  (bind-key "C-h" nil helm-map)

  ;; ---------------------------------------------------------------
  ;; mini-bufferでC-kを押すと先頭から削除される問題の対処
  ;; refs: http://d.hatena.ne.jp/a_bicky/20140104/1388822688
  ;; ---------------------------------------------------------------
  (setq helm-delete-minibuffer-contents-from-point t)
  ;; (setq helm-display-function 'helm-display-buffer-in-own-frame
  ;;       helm-display-buffer-reuse-frame t
  ;;       helm-use-undecorated-frame-option t)

  (setq helm-display-function (lambda (buf &optional resume)
                                (split-window-vertically)
                                (other-window 1)
                                (switch-to-buffer buf)
                                ))

  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))
  )


;; (use-package helm-swoop
;;   :bind
;;   (("C-s" . helm-swoop))
;;   :config
;;   (setq helm-swoop-split-with-multiple-windows t))

(use-package helm-ag
  :bind
  (("C-c C-s" . helm-do-ag)))

(use-package all-ext
  :bind
  (("C-c C-a" . all-from-helm-occur)))
