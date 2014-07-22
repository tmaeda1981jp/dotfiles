(require 'htmlize)
(setq org-export-htmlize-output-type 'css)

(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")

(defun myblog:post ()
  (interactive)
  (let* ((basedir "~/blog/org/_posts")
         (date (read-string "DATE: " (format-time-string "%Y-%m-%d")))
         (title (read-string "TITLE: "))
         (file-name (read-string "FILE_NAME: "))
         (file (format "%s/%s-%s.org" basedir date file-name)))
    (shell-command-to-string (format "mkdir -p %s" basedir))
    (find-file-other-window file)
    (unless (save-excursion
              (goto-char 1)
              (search-forward "* " nil t))
      (insert (myblog:blog-header title)))))

;; TODO
;; ----
;; (defun myblog:draft ()
;;   (interactive)
;;   (let* ((basedir "~/blog/org/_drafts")
;;          (date (read-string "DATE: " (format-time-string "%Y-%m-%d")))
;;          (file-name (read-string "FILE_NAME: "))
;;          (file (format "%s/%s-%s.org" basedir date file-name)))
;;     (shell-command-to-string (format "mkdir -p %s" basedir))
;;     (find-file-other-window file)
;;     (unless (save-excursion
;;               (goto-char 1)
;;               (search-forward "* test\n" nil t))
;;       (insert (myblog:blog-header file-name)))))

;; TODO
;; ----
;; (defun myblog:draft-to-post ()
;;   (interactive))

(defun myblog:blog-header (title)
  (mapconcat 'identity (list
                        "#+OPTIONS: toc:nil"
                        "#+BEGIN_HTML"
                        "---"
                        "layout: post"
                        (format "title: %s" title)
                        (format "date: %s" (format-time-string "%Y-%m-%d"))
                        "tags: []"
                        "---"
                        "#+END_HTML"
                        ""
                        "* "
                        ) "\n"))

;; refs: http://orgmode.org/worg/org-tutorials/org-jekyll.html
;;
;; '|blog
;; '|   |org
;; '|      |_posts
;; '|      |-- 2009-11-26-my-first-post.org
;; '|      |_drafts
;; '|      |-- my-draft.org
;; '|   |jekyll
;; '|   -- _config.yml
;; '|   -- _layouts
;; '|      |-- default.html
;; '|      `-- post.html
;; '|   -- _posts
;; '|      |-- 2009-11-26-my-first-post.html
;; '|
;; '|   -- |_site
;; '|   -- |_includes
;; `    -- index.html

;; http://orgmode.org/manual/Publishing.html#Publishing
(setq org-publish-project-alist
      '(("post"
         ;; Path to my org files
         :base-directory "~/blog/org/_posts/"
         :base-extension "org"
         :publishing-directory "~/blog/jekyll/_posts/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-extension "html"
         :body-only t
         :completion-function myblog:run-build-command
         :section-numbers nil
         )
        ;; TODO
        ;; ----
        ;; ("draft"
        ;;  :base-directory "~/blog/org/_posts/"
        ;;  :base-extension "org"
        ;;  :publishing-directory "~/blog/jekyll/_drafts/"
        ;;  :recursive t
        ;;  :publishing-function org-html-publish-to-html
        ;;  :html-extension "html"
        ;;  :body-only t
        ;;  :completion-function myblog:run-build-command-with-draft-option
        ;;  )
        ("static"
         :base-directory "~/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("myblog" :components ("post" "static"))))

(defun myblog:run-build-command ()
  "Run jekyll command"
  (shell-command-to-string "cd ~/blog/jekyll && jekyll build"))

;; TODO
;; ----
;; (defun myblog:run-build-command-with-draft-option ()
;;   "Run jekyll command with draft option"
;;   (shell-command-to-string "cd ~/blog/jekyll && jekyll build --draft"))
