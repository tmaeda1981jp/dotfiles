(defvar css-file-path "~/.emacs.d/lang/css/github.css")
(defvar tmp-file-dir "~/tmp")
(defvar tmp-file-path (format "%s/tmp.html" tmp-file-dir))

(defun gfm-to-html ()
  "Convert GFM(Github Flavored Markdown) to HTML."
  (if (and (string-match (rx-to-string `(: ,"md" eos) t)
                         buffer-file-name) t)
      (let* ((gfm buffer-file-name))
        (shell-command-to-string
         (mapconcat 'identity
                    (list "pandoc" "-s" "-t" "html5" "-c" css-file-path "-o" (f-full tmp-file-path) gfm) " ")))))

(defun preview-on-browser ()
  "Preview html on browser"
  (interactive)
  (shell-command-to-string
   (mapconcat 'identity
              (list "open" "-a" "Google\\ Chrome" (f-full tmp-file-path)) " ")))

(defun preview-on-eww ()
  "Preview html on eww browser"
  (interactive)
  (eww-open-file (f-full tmp-file-path)))

(add-hook 'markdown-mode-hook
          '(lambda ()
             (define-key markdown-mode-map (kbd "C-c p") 'preview-on-eww)
             (add-hook 'after-save-hook 'gfm-to-html)))

(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6))))
 )
