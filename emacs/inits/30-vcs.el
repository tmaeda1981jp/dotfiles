(require 'magit)

;; (eval-after-load 'magit
;;   '(progn
;;      (set-face-background 'magit-item-highlight "#202020")
;;      (set-face-foreground 'magit-diff-add "#40ff40")
;;      (set-face-foreground 'magit-diff-del "#ff4040")
;;      (set-face-foreground 'magit-diff-file-header "#4040ff")))

(global-set-key "\C-c\C-n" 'magit-blame-mode)
(global-set-key "\C-c\C-g" 'magit-status)
