;;;
;;; org-mode
;;;

(require 'org)

(add-to-list 'auto-mode-alist '("¥¥.org$" . org-mode))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)

;; todo状態変更(org-agendaではtのみでok)
(define-key global-map "\C-ct" 'org-todo)

;; TODO設定
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))

(setq org-capture-templates
      '(("t" "inbox" entry (file+headline "~/Dropbox/inbox.org" "inbox")
         "**** TODO %?\n   %i\n  %t\n")
        ("m" "memo" entry (file+headline "~/wiki/notes/memo.org" "memo")
         "**** %U - %?\n  %i\n" :prepend t :empty-lines 1)))

;; CLOSEの時にtimestamp
(setq org-log-done 'time)

;; 優先度の設定はC-c , [a,b,c]

;; S-upの設定
(define-key input-decode-map "\e[1;2A" [S-up])
;; (define-key input-decode-map "\e[1;2B" [S-down])
;; (define-key input-decode-map "\e[1;2C" [S-right])
;; (define-key input-decode-map "\e[1;2D" [S-left])

;; コードブロックをその言語のモードでハイライトする
(setq org-src-fontify-natively t)

;; from emacsメルマガ
;;; 時刻の記録をagendaに表示させる
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-span 30)
;;(setq org-agenda-files '("~/Dropbox/org/inbox.org" "~/Dropbox/org/daily-projects.org"))
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files (list org-directory))
;;; C-c a aでagendaのメニューを表示する
;;; agendaには、習慣・スケジュール・TODOを表示させる
(setq org-agenda-custom-commands
      '(("a" "Agenda and all TODO's"
         ((tags "project-CLOCK=>\"<today>\"|repeatable") (agenda "") (alltodo)))))
;;; <f6>で直接org習慣仕事術用agendaを起動させる
(defun org-agenda-default ()
  (interactive)
  (org-agenda nil "a"))
(global-set-key (kbd "<f6>") 'org-agenda-default)
