;; Install
;; (install-elisp-from-emacswiki "shell-pop.el")
;; (install-elisp "http://www.rubyist.net/~rubikitch/private/eshell-pop.el")

(require 'eshell-pop)
(global-set-key (kbd "C-x C-z") 'shell-pop)
(setq shell-pop-window-height 50)

(defun eshell/e (arg)
  (eval (read (format "%s" arg))))

;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)

;; 変更した prompt 文字列に合う形で prompt の初まりを指定 (C-a で"$ "の次にカーソルがくるようにする)
;; これの設定を上手くしとかないとタブ補完も効かなくなるっぽい
(setq eshell-prompt-regexp "^[^#$]*[$#] ")

;; 補完時にサイクルする
(setq eshell-cmpl-cycle-completions t)
;; 補完候補がこの数値以下だとサイクルせずに候補表示
(setq eshell-cmpl-cycle-cutoff-length 5)
;; 履歴で重複を無視する
(setq eshell-hist-ignoredups t)

