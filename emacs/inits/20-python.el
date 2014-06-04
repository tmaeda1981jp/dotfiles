;; --------------------------------------------------
;; tab, indent
;; --------------------------------------------------
(add-hook 'python-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil) ;; tabを使用しない
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))

;; --------------------------------------------------
;; flymake + pyflakes + pep8
;; refs: http://d.hatena.ne.jp/CortYuming/20120118/p1
;; --------------------------------------------------
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list (expand-file-name "/Users/tmaeda/.emacs.d/lang/python/lintrunner.py")  (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;; (load-library "flymake-cursor")
;; (global-set-key "\M-e" 'flymake-goto-next-error)
;; (global-set-key "\M-E" 'flymake-goto-prev-error)
;; (global-set-key (kbd "C-c C-j") 'flymake-start-syntax-check)
