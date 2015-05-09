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

(add-to-list 'org-agenda-custom-commands
             '("D" agenda ""
               (;; 1日分だけ表示する
                (org-agenda-span 1)
                ;; agenda各行の行頭のスペースをなくす
                (org-agenda-prefix-format '((agenda . "%?-12t% s")))
                ;; グリッドを表示しない
                (org-agenda-use-time-grid nil)
                ;; clockを表示する
                (org-agenda-start-with-log-mode t)
                (org-agenda-show-log 'clockcheck)
                ;; clockの総計を表でまとめる
                (org-agenda-start-with-clockreport-mode t)
                (org-agenda-clockreport-mode t))))


(defvar org-review-diary-file "~/Dropbox/org/review-diary.org")
(defvar org-review-diary-use-follow-mode nil)
(defun org-review-diary ()
  (interactive)
  (find-file org-review-diary-file)     ; ファイルを開き
  (goto-char (point-max))               ; 末尾に移動し
  (recenter 0)                          ; 画面最上部に持っていき
  (when org-review-diary-use-follow-mode ;後述
    (follow-mode-setup))
  (insert "* ")                         ;新しい見出し作成
  (save-excursion
    (org-insert-time-stamp (current-time) t t) ;現在時刻
    (insert "\n#+BEGIN_QUOTE\n")        ;QUOTEブロックで
    (let (org-agenda-sticky)            ;agendaを囲む
      (insert (save-window-excursion    ;裏でagenda (D)を
                (org-agenda nil "D")    ;起動して
                (unwind-protect
                    (buffer-string)     ;*Org Agenda*バッファの内容を
                  (kill-this-buffer))))) ;挿入してからバッファを削除
    (insert "#+END_QUOTE\n\n")))

(setq org-review-diary-use-follow-mode t)
(defun follow-mode-setup ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (follow-mode 1))
