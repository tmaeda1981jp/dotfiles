(use-package org
  :defer t
  :init
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)"  "WAIT(w)" "|" "DONE(d)" "CANCELED(c)")))
  ;; CLOSEの時にtimestamp
  (setq org-log-done 'time)
  ;; コードブロックをその言語のモードでハイライトする
  (setq org-src-fontify-natively t)
  (define-key input-decode-map "\e[1;2A" [S-up])

  (defun my:create-new-note ()
    (let ((file-name (read-string "File Name: ")))
      (expand-file-name (format "%s_%s.org" (format-time-string "%s") file-name) "~/docs/posts/notes/")))

  (defun my:create-new-diary ()
    (expand-file-name (format "%s.org" (format-time-string "%Y%m")) "~/docs/posts/diary/"))
  
  (setq org-capture-templates
        '(
          ("i" "Inbox" entry (file "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/inbox.org")
           "* TODO %?\n%U")
          ("w" "Wish Books" entry (file "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/wish_books.org")
           "* SOMEDAY %? :book:\n%U\n")
          ("r" "Reading Books" entry (file "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/reading_books.org")
           "* READING %? :book:\n%U\n")
          ("b" "Buy" entry (file "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/buy.org")
           "* TODO %? :buy:\n%U")
          ("n" "Note" plain (file my:create-new-note)
           "#+TITLE: %^{title}\n#+DATE: %U\n#+AUTHOR: tmaeda1981jp\n* %?\n")
          ("d" "Diary" entry (file my:create-new-diary)
           "* %<%Y年%m月%d日 %H:%M:%S>\n%?" :prepend t)
          ))

  (setq org-refile-use-outline-path 'file)
  (setq org-refile-targets '(("~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/gtd.org" :maxlevel . 3)
                             ("~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/wish_books.org" :maxlevel . 3)
                             ("~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/reading_books.org" :maxlevel . 3)
                             ("~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/buy.org" :maxlevel . 3)
                             ("~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/someday.org" :level . 1)))

  (setq org-agenda-files '("~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/gtd.org"
                           "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/wish_books.org"
                           "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/reading_books.org"
                           "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/buy.org"
                           ))

  (setq org-archive-location (concat "~/Library/Mobile Documents/iCloud\~com\~appsonthemove\~beorg/Documents/org/"
                                     (format-time-string "%Y%m" (current-time))
                                     ".org_archive::"))


  ;; short-cut for #+BEGIN_SRC #+BEGIN_END
  (use-package org-tempo :straight nil)

  (use-package ox-publish :straight nil
    :init
    ;; unset validation link
    (setq org-html-validation-link nil)
    ;; unset table of contents
    (setq org-export-with-toc nil)
    (setq org-export-with-sub-superscripts '{})


    (setq org-export-global-macros
          '(("div" . "@@html:<div style=\"color:blue;\">$1</div>@@")))

    (defun org-sitemap-custom-entry-format (entry style project)
      "Custom sitemap entry formatting: add date"
      (cond ((not (directory-name-p entry))
             (format "[[file:%s][[%s] %s]]\n"
                     entry
                     (format-time-string "%Y-%m-%d"
                                         (org-publish-find-date entry project))
                     (org-publish-find-title entry project)
                     (format-time-string "%Y-%m-%d"
                                         (org-publish-find-date entry project))))
            ((eq style 'tree)
             ;; Return only last subdir.
             (file-name-nondirectory (directory-file-name entry)))
            (t entry)))
    
    (setq org-publish-project-alist
          (quote (("notes"
                   :base-directory "~/docs/posts"
                   :publishing-directory "~/docs/public"
                   :recursive t
                   :table-of-contents nil
                   :base-extension "org"
                   :publishing-function org-html-publish-to-html
                   :style-include-default nil
                   :section-numbers nil
                   :table-of-contents nil
                   :html-head "<link rel=\"stylesheet\" href=\"../assets/css/note.css\" type=\"text/css\" />"
                   :author-info nil
                   :creator-info nil
                   :auto-sitemap t
                   :sitemap-filename "sitemap.org"
                   :sitemap-title "tmaeda1981jp"
                   :sitemap-sort-files anti-chronologically
                   :sitemap-format-entry org-sitemap-custom-entry-format
                   )
                  ;; ("diary"
                  ;;  :base-directory "~/docs/posts/diary"
                  ;;  :publishing-directory "~/docs/public/diary"
                  ;;  :recursive t
                  ;;  :table-of-contents nil
                  ;;  :base-extension "org"
                  ;;  :publishing-function org-html-publish-to-html
                  ;;  :style-include-default nil
                  ;;  :section-numbers nil
                  ;;  :table-of-contents nil
                  ;;  :html-head "<link rel=\"stylesheet\" href=\"../note.css\" type=\"text/css\" />"
                  ;;  :author-info nil
                  ;;  :creator-info nil
                  ;;  :auto-sitemap t  ; generate sitemap.org automagically
                  ;;  :sitemap-filename "sitemap.org"
                  ;;  :sitemap-title "tmaeda1981jp")
                  ;; )
                  )))

    (setq org-html-preamble-format '(("en" "
<div align=right>
最終更新日: %C
</div>

<div align=right>
<a href=\"https://www.google.com\">ホーム</a> |
<a href=\"index.html\">文書トップ</a> | <a href=\"sitemap.html\">目次</a>
</div>
")))

    (defun toggle-org-html-export-on-save ()
      (interactive)
      (if (memq 'org-publish-current-project after-save-hook)
          (progn
            (remove-hook 'after-save-hook 'org-publish-current-project t)
            (message "Disabled org html export on save for current buffer..."))
        (add-hook 'after-save-hook 'org-publish-current-project nil t)
        (message "Enabled org html export on save for current buffer...")))
    (toggle-org-html-export-on-save))
  
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda))
  :mode (("\\.org?\\'" . org-mode)))

