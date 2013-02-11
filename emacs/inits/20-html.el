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
(add-hook 'web-mode-hook ' zencoding-mode)
