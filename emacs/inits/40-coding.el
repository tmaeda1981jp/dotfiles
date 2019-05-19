;; editorcofing
(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; elisp
(use-package lispxmp
  :init
  (define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp))

(use-package dash)
(use-package s)
(use-package f)
(use-package ht)

(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (lisp-interaction-mod . enable-paredit-mode)
         (list-mode . enable-paredit-mode)
         (ielm-mode . enable-paredit-mode)))

(find-function-setup-keys)

(use-package rjsx-mode
  :mode (("\\.js\\'" . rjsx-mode))
  :interpreter (("node" . rjsx-mode)))

(use-package php-mode
  :mode (("\\.php\\'" . php-mode))
  :interpreter (("php" . php-mode)))

(use-package csv-mode
  :mode ("\\.csv$" . csv-mode))

(use-package json-mode
  :mode (("\\.json\\'" . json-mode)))

(use-package yaml-mode
  :mode (("\\.yml\\'" . yaml-mode)))

(use-package flycheck
  :init (global-flycheck-mode))
