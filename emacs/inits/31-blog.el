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
      (insert (format "#+TITLE: %s\n#+AUTHOR: tmaeda1981jp\n\n* test :blog:\n" file-name))
      )))

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
         :with-toc nil
         :html-head "<link rel=\"stylesheet\" href=\"/Users/tmaeda/.emacs.d/lang/css/github.css\" type=\"text/css\" />"
         :html-preamble t
         :auto-sitemap t
         :sitemap-title "Sitemap"
         ;; :export-creater-info nil ;; 動いていない？
         ;; :export-author-info nil;; 動いていない？
         )
        ("website" :components ("orgfiles"))))

