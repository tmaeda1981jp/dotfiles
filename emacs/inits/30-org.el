;;; 
;;; org-mode
;;;
(require 'org)
(add-to-list 'auto-mode-alist '("¥¥.org$" . org-mode))
(setq org-default-notes-file "~/todo/mytodo.org")
(setq org-agenda-files '("~/todo/mytodo.org"))
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

;; TODO設定
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

;; CLOSEの時にtimestamp
(setq org-log-done 'time)

;; S-upの設定
(define-key input-decode-map "\e[1;2A" [S-up])
