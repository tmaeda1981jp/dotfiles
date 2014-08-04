(setq org-html-html5-fancy t)
(setq org-html-doctype "html5")

(require 'ox-jekyll)

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (if (null desc)
        (setq desc ""))
    (format "<img src=\"/img/%s\" alt=\"%s\" />" path desc))))

(org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)

(defun org-jekyll-src-block (src-block contents info)
  "override"
  (if org-jekyll-use-src-plugin
      (let ((language (org-element-property :language src-block))
            (value (org-remove-indentation
                    (org-element-property :value src-block))))
        (format "\n{%% highlight %s %%}\n%s{%% endhighlight %%}"
                language value))
    (org-export-with-backend 'html src-block contents info)))

(easy-mmode-define-minor-mode myblog-mode
                              "This is My Blog Mode."
                              nil
                              " MyBlog"
                              '(("\C-ch" . myblog:move-to-draft)))

(defun myblog:move-to-draft ()
  "Move an article to draft"
  (interactive)
  (copy-file
   (buffer-file-name)
   (replace-regexp-in-string "_posts" "_drafts" (buffer-file-name)) t)
  (delete-file (buffer-file-name))
  (kill-buffer nil))

(defun myblog:move-to-post ()
  "Move an article to post"
  (interactive)
  (copy-file
   (buffer-file-name)
   (replace-regexp-in-string "_drafts" "_posts" (buffer-file-name)) t)
  (delete-file (buffer-file-name))
  (kill-buffer nil))

(defun myblog:post ()
  (interactive)
  (let* ((basedir "~/blog/org/_posts")
         (date (read-string "DATE: " (format-time-string "%Y-%m-%d")))
         (title (read-string "TITLE: "))
         (file-name (read-string "FILE_NAME: "))
         (file (format "%s/%s-%s.org" basedir date file-name)))
    (shell-command-to-string (format "mkdir -p %s" basedir))
    (find-file-other-window file)
    (myblog-mode)
    (unless (save-excursion
              (goto-char 1)
              (search-forward "* " nil t))
      (insert (myblog:blog-header title date)))))

(defun myblog:blog-header (title date)
  (mapconcat 'identity (list
                        "#+OPTIONS: toc:nil \\n:t"
                        "#+LANGUAGE: ja"
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
;; '|      |-- 2009-11-26-my-draft.org
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
        ("images"
         :base-directory "~/blog/org/_posts/img/"
         :base-extension "png\\|jpg\\|gif"
         :publishing-directory "~/blog/jekyll/img/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("myblog" :components ("post" "images"))))

(defun myblog:run-build-command ()
  "Run jekyll command"
  (shell-command-to-string "cd ~/blog/jekyll && jekyll build"))


;; blogの投稿原本を一覧表示 & 選択でファイル編集
(defvar myblog-root-path "/Users/tmaeda/blog/org/")

;; helm integration
(defun get-entry-files ()
  (remove-if-not 'file-regular-p
                 (append
                  (directory-files (format "%s_posts" myblog-root-path) t "\\.org")
                  (directory-files (format "%s_drafts" myblog-root-path) t "\\.org"))))

(defun get-title (file)
  (with-temp-buffer
    (insert-file-contents file)
    (setq content (buffer-string))
    (setq is-draft (eq (string-match "_posts/" file) nil))
    (string-match "title: \\(.*\\)\\\n.*date: \\(.*\\)" content)
    (cons
     (cond (is-draft
            (format "[%s] (DRAFT) %s" (match-string 2 content) (match-string 1 content)))
           (t
            (format "[%s] %s" (match-string 2 content) (match-string 1 content))))
     file)))

(defun get-entry-titles ()
  (mapcar (lambda (file)
           (get-title file))
          (reverse (get-entry-files))))

(defun helm-myblog-entries ()
  (interactive)
  (helm :sources '((name . "My Blog Entries")
                  (candidates . get-entry-titles)
                  (action . find-file))))
