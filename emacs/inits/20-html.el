;; ----------------------------------------
;; web-mode.el
;; http://web-mode.org/
;; ----------------------------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-disable-autocompletion t)
  (setq web-mode-disable-css-colorization t)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)
;; 保存時にwhitespaceを自動削除
(add-hook 'local-write-file-hooks (lambda () (delete-trailing-whitespace) nil))

;; ----------------------------------------
;; zencoding-mode
;; ref: https://github.com/rooney/zencoding
;; ----------------------------------------
(require 'zencoding-mode)
(define-key zencoding-mode-keymap (kbd "C-c C-a") 'zencoding-expand-yas)
(setq zencoding-block-tags
      (append (list
               "article" "section" "aside" "nav"
               "figure" "address" "header" "footer")
              zencoding-block-tags))
(setq zencoding-inline-tags
      (append (list
               "textarea" "small" "time" "del" "ins" "sub" "sup"
               "i" "s" "b" "bdo" "iframe" "canvas" "audio" "video"
               "object" "embed" "map")
              zencoding-inline-tags))
(setq zencoding-self-closing-tags
      (append (list
               "wbr" "object" "source" "area" "param" "option")
              zencoding-self-closing-tags))
(add-hook 'web-mode-hook ' zencoding-mode)
