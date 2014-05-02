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

;; todo状態変更(org-agendaではtのみでok)
(define-key global-map "\C-ct" 'org-todo)

;; TODO設定
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/wiki/notes/mytodo.org" "Tasks")
         "**** TODO %?\n   %i\n  %t\n")
        ("m" "Memo" entry (file+headline "~/wiki/notes/memo.org" "Memo")
         "**** %U - %?\n  %i\n" :prepend t :empty-lines 1)
        ("d" "Diary" entry (file+headline "~/wiki/notes/diary.org" "Dialy")
         "**** %U - %^{Title} :Diary:\n" :prepend t :empty-lines 1)
        ("b" "Book" entry (file+headline "~/wiki/notes/books.org" "Books")
         "**** %U - %^{Title} :Books:\n" :prepend t :empty-lines 1)
        ("v" "Movie" entry (file+headline "~/wiki/notes/movies.org" "Movies")
         "**** %U - %^{Title} :Movies:\n" :prepend t :empty-lines 1)))

;; CLOSEの時にtimestamp
(setq org-log-done 'time)

;; 優先度の設定はC-c , [a,b,c]

;; S-upの設定
(define-key input-decode-map "\e[1;2A" [S-up])
