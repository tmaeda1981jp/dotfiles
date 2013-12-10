;;;
;;; org-mode
;;;
(require 'org)
(add-to-list 'auto-mode-alist '("¥¥.org$" . org-mode))
;; ~/todoが存在しない場合は以下を評価
;; (mkdir "~/todo" t)
(setq org-default-notes-file "~/notes/mytodo.org")
;(setq org-agenda-files '("~/todo/mytodo.org"))
(setq org-directory "~/notes")
(setq org-agenda-files (list org-directory))
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

;; TODO設定
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/mytodo.org" "Tasks")
         "** TODO %?\n   %i\n  %t\n")
        ("m" "Memo" entry (file+datetree "~/notes/memo.org" "Memo")
         "** %?\n  %i\n  %t\n")
        ("d" "Diary" entry (file+datetree "~/notes/diary.org" "Dialy")
         "** %U - %^{Activity}  :Diary:")))

;; CLOSEの時にtimestamp
(setq org-log-done 'time)

;; 優先度の設定はC-c , [a,b,c]

;; S-upの設定
(define-key input-decode-map "\e[1;2A" [S-up])
