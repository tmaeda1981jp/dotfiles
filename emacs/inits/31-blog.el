(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")

(require 'ox-jekyll)

(defun org-jekyll-src-block (src-block contents info)
  "override"
  (if org-jekyll-use-src-plugin
      (let ((language (org-element-property :language src-block))
            (value (org-remove-indentation
                    (org-element-property :value src-block))))
        (format "\n{%% highlight %s %%}\n%s{%% endhighlight %%}"
                language value))
    (org-export-with-backend 'html src-block contents info)))

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
      (insert (myblog:blog-header title date)))))

(defun myblog:blog-header (title date)
  (mapconcat 'identity (list
                        "#+OPTIONS: toc:nil \n:t"
                        "#+BEGIN_HTML"
                        "---"
                        "layout: post"
                        (format "title: %s" title)
                        (format "date: %s" date)
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
(setq org-jekyll-use-src-plugin t)
(setq org-publish-project-alist
      '(("post"
         ;; Path to my org files
         :base-directory "~/blog/org/_posts/"
         :base-extension "org"
         :publishing-directory "~/blog/jekyll/_posts/"
         :recursive t
         :publishing-function org-jekyll-publish-to-html
         :html-extension "html"
         :body-only t
         :completion-function myblog:run-build-command
         :section-numbers nil
         )
        ("static"
         :base-directory "~/blog/org/_posts/img/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
         :publishing-directory "~/blog/jekyll/img/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("myblog" :components ("post" "static"))))

(defun myblog:run-build-command ()
  "Run jekyll command"
  (shell-command-to-string "cd ~/blog/jekyll && jekyll build"))
