(defvar css-file-path "~/.emacs.d/lang/css/github.css")
(defvar tmp-file-dir "$HOME/tmp")
(defvar tmp-file-path (format "%s/tmp.html" tmp-file-dir))

(defun gfm-to-html ()
  "Convert GFM(Github Flavored Markdown) to HTML."
  (if (and (string-match (rx-to-string `(: ,"md" eos) t)
                         buffer-file-name) t)
      (let* ((gfm buffer-file-name))
        (shell-command-to-string
         (mapconcat 'identity
                    (list "pandoc" "-s" "-t" "html5" "-c" css-file-path "-o" tmp-file-path gfm) " ")))))

(defun preview-on-browser ()
  "Preview html on browser"
  (interactive)
  (shell-command-to-string
   (mapconcat 'identity
              (list "open" "-a" "Google\\ Chrome" tmp-file-path) " ")))

(add-hook 'markdown-mode-hook
          '(lambda ()
             (define-key markdown-mode-map (kbd "C-c p") 'preview-on-browser)
             (add-hook 'after-save-hook 'gfm-to-html)))
