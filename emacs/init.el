;; refs: http://stackoverflow.com/questions/11127109/emacs-24-package-system-initialization-problems
(package-initialize)
(when (> emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d"))

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
;; (ex) (add-to-load-path "xxx" "yyy" "zzz")
(add-to-load-path "site-lisp")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-full-name "tmaeda1981jp")
 '(add-log-mailing-address "tmaeda1981jp@gmail.com")
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en")
 '(haskell-notify-p t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(rst-level-face-base-light 50)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6))))
 '(rst-level-1-face ((t (:foreground "LightSkyBlue"))) t)
 '(rst-level-2-face ((t (:foreground "LightGoldenrod"))) t)
 '(rst-level-3-face ((t (:foreground "Cyan1"))) t)
 '(rst-level-4-face ((t (:foreground "chocolate1"))) t)
 '(rst-level-5-face ((t (:foreground "PaleGreen"))) t)
 '(rst-level-6-face ((t (:foreground "Aquamarine"))) t)
 '(whitespace-space-after-tab ((t (:background "color-234" :foreground "yellow"))))
 '(whitespace-space-before-tab ((t (:background "color-234" :foreground "yellow")))))
(put 'downcase-region 'disabled nil)

(setq magit-last-seen-setup-instructions "1.4.0")
