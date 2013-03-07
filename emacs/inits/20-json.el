(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 2)
            ))
