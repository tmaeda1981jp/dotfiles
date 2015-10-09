;; php-modeのコーディングスタイル設定
;; 保存時に自動整形したい場合はコメントアウト
;;(setq php-mode-coding-style (quote psr2))
(require 'php-mode)
(scroll-bar-mode -1)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(add-hook 'php-mode-hook
  (lambda ()
    (setq flycheck-phpcs-standard "PSR2")
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))


;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (setq flycheck-phpcs-standard "PSR2")
;;             (c-set-offset 'case-label 4)
;;             (c-set-offset 'arglist-intro 4)
;;             (c-set-offset 'arglist-cont-nonempty 4)
;;             (global-set-key (kbd "C-c C-l") 'helm-ls-git-ls)
;;             (c-set-offset 'arglist-close 0)))
