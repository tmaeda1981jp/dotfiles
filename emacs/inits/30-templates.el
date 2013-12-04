;; ----------------------------------------------------------
;; autoinsert
;; refs: http://blog.kzfmix.com/entry/1267700318
;; refs: ref: http://k4zmblog.dtiblog.com/blog-entry-288.html
;; ----------------------------------------------------------
(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(setq auto-insert-alist
      (nconc '((".py$" . "python_header.txt")
               (".js$" . "js_header.txt")
               (".rb$" . "ruby_header.txt")
               (".feature$" . "feature_header.txt")
                ) auto-insert-alist))
(add-hook 'python-mode-hook 'auto-insert)
(add-hook 'js2-mode-hook 'auto-insert)
