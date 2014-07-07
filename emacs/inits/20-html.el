;; ----------------------------------------
;; web-mode.el
;; http://web-mode.org/
;; ----------------------------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.\\(html\\|xhtml\\|ctp\\|php\\)\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for web mode."

  (setq web-mode-markup-indent-offset 2) ;; html
  (setq web-mode-css-indent-offset 2)    ;; css
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)

  (setq web-mode-disable-autocompletion t)
  (setq web-mode-disable-css-colorization t))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; 現在のファイルをブラウザでopenする
(define-key web-mode-map "\C-co" 'open-current-file-on-browser) ;; 11-chrome.el

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
