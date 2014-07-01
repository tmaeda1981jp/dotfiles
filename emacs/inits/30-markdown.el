(defvar css-file-path "~/.emacs.d/lang/css/github.css")

(defun gfm-to-html ()
  "Convert GFM(Github Flavored Markdown) to HTML."
  (if (and (string-match (rx-to-string `(: ,"md" eos) t)
                         buffer-file-name) t)
      (let* ((gfm buffer-file-name)
             (html (replace-regexp-in-string "\.md$" ".html" buffer-file-name)))

        (shell-command-to-string
         (mapconcat 'identity
                    (list "pandoc" "-s" "-t" "html5" "-c" css-file-path "-o" html gfm) " ")))
    ))


(add-hook 'markdown-mode-hook
          '(lambda ()
             (add-hook 'after-save-hook 'gfm-to-html)))
