;;;
;;; org-mode
;;;

(require 'org)
(add-to-list 'auto-mode-alist '("¥¥.org$" . org-mode))

;; ~/todoが存在しない場合は以下を評価
;; (mkdir "~/todo" t)
(setq org-default-notes-file "~/wiki/notes/mytodo.org")
;(setq org-agenda-files '("~/todo/mytodo.org"))
(setq org-directory "~/wiki/notes")
(setq org-agenda-files (list org-directory))
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

;; TODO設定
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/wiki/notes/mytodo.org" "Tasks")
         "** TODO %?\n   %i\n  %t\n")
        ("m" "Memo" entry (file+datetree "~/wiki/notes/memo.org" "Memo")
         "** %?\n  %i\n  %t\n" :prepend t)
        ("d" "Diary" entry (file+datetree "~/wiki/notes/diary.org" "Dialy")
         "** %U - %^{Activity} :Diary:\n" :prepend t)
        ("b" "Book" entry (file+datetree "~/wiki/notes/books.org" "Dialy")
         "** %U - %^{Activity} :Books:\n" :prepend t)
        ("v" "Movie" entry (file+datetree "~/wiki/notes/movies.org" "Dialy")
         "** %U - %^{Activity} :Movies:\n" :prepend t)))

;; CLOSEの時にtimestamp
(setq org-log-done 'time)

;; 優先度の設定はC-c , [a,b,c]

;; S-upの設定
(define-key input-decode-map "\e[1;2A" [S-up])
