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
  
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda))
  :mode (("\\.org?\\'" . org-mode)))

