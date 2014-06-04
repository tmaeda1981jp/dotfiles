(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(global-set-key "\M-e" 'flycheck-next-error)
(global-set-key "\M-E" 'flycheck-prev-error)
(global-set-key "\C-c\C-y" 'list-flycheck-errors)

(setq flycheck-display-errors-delay 0.3)
