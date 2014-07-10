(require 'ox-html)

(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")

(defun org-add-blog-entry ()
  (interactive)
  (let* ((basedir "~/blog/")
         (date (read-string "DATE: " (format-time-string "%Y/%m/%d")))
         (file-name (read-string "FILE_NAME: "))
         (file (format "%s/%s/%s.%s.org" basedir date file-name (format-time-string "%Y%m%d%H%M%S"))))
    (shell-command-to-string (format "mkdir -p %s/%s" basedir date))
    (find-file-other-window file)
    (unless (save-excursion
              (goto-char 1)
              (search-forward "* test\n" nil t))
      (insert (format "#+TITLE: %s\n#+AUTHOR: tmaeda1981jp\n\n* test :blog:\n" file-name)))))

;; refs: http://orgmode.org/worg/org-tutorials/org-jekyll.html
;;
;; '|blog
;; '|   |org
;; '|      |_posts
;; '|      |-- 2009-11-26-my-first-post.org
;; '|   |index.org
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
      '(("org"
         ;; Path to my org files
         :base-directory "~/blog/org/"
         :base-extension "org"

         ;; Path to my jekyll project
         :publishing-directory "~/blog/jekyll/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-extension "html"
         :body-only t
         )
        ("static"
         :base-directory "~/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("myblog" :components ("org" "static"))))
