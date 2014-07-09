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
        ;; ("d" "Diary" entry (file+headline "~/wiki/notes/diary.org" "Dialy")
        ;;  "**** %U - %^{Title} :Diary:\n" :prepend t :empty-lines 1)
        ("k" "Book" entry (file+headline "~/wiki/notes/books.org" "Books")
         "**** %U - %^{Title} :Books:\n" :prepend t :empty-lines 1)
        ("v" "Movie" entry (file+headline "~/wiki/notes/movies.org" "Movies")
         "**** %U - %^{Title} :Movies:\n" :prepend t :empty-lines 1)

        ;; TODO
        ;; blogはorg-captureでやる必要ないかも？
        ;; template選択なしに1keyですぐに起動させたいのと，
        ;; #+TITLEなどのヘッダをファイルの先頭に挿入したい為
        ;; (org-captureは1file=1記事の前提がない)
        ("b" "Blog" entry (file ((lambda ()
                                   (let ((basedir "~/blog/")
                                         (date (read-string "DATE: " (format-time-string "%Y/%m/%d")))
                                         (title (read-string "FILE_NAME: ")))
                                     (shell-command-to-string (format "mkdir -p %s/%s" basedir date))
                                     (format "%s/%s/%s.%s.org" basedir date title (format-time-string "%Y%m%d%H%M%S"))))) "Blog")
         "* :Blog:\n\n%U" :append t :empty-lines 1)
        ))

;; http://orgmode.org/manual/Publishing.html#Publishing
;; 1. org-modeで書く
;; 2. C-c C-e P x(or p or f)
(setq org-publish-project-alist
      '(("blog"
        :base-directory "~/blog/"
        :base-extension "org"
        :publishing-directory "~/tmp/html/"
        :recursive t
        :publishing-function org-html-publish-to-html
        ;; :exclude "PrivatePage.org"
        :headline-levels 3
        :section-numbers nil
        :with-toc t
        :html-head "<link rel=\"stylesheet\" href=\"/Users/tmaeda/.emacs.d/lang/css/github.css\" type=\"text/css\" />"
        :html-preamble t
        :auto-sitemap t
        :sitemap-title "Sitemap"
        :export-creater-info nil ;; 動いていない？
        :export-author-info nil) ;; 動いていない？
        ("website" :components ("orgfiles"))))

;; CLOSEの時にtimestamp
(setq org-log-done 'time)

;; 優先度の設定はC-c , [a,b,c]

;; S-upの設定
(define-key input-decode-map "\e[1;2A" [S-up])

;; コードブロックをその言語のモードでハイライトする
(setq org-src-fontify-natively t)
