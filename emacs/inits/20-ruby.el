;; Rakefileもruby-modeで起動
;; (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(setq auto-mode-alist
      (append (list
               '("Rakefile$" . ruby-mode)
               '("Gemfile$" . ruby-mode)
               '("Guardfile$" . ruby-mode)
               '("gemspec$" . ruby-mode)
               ) auto-mode-alist))

;; ruby-block.el
;; endに対応する行のハイライト
(when (require 'ruby-block nil t)
  (setq ruby-block-highlight-toggle t))

;; inf-ruby.el
;; M-x run-rubyでirbをemcasから使える
;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)

(defun my-ruby-mode-hooks ()
  (inf-ruby-minor-mode)
  (ruby-electric-mode t)
  (ruby-block-mode t))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hooks)

;; rspec-mode
(require 'rspec-mode)
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;; ;; rsense
;; (setq rsense-home "/Users/tmaeda/.emacs.d/lang/ruby/rsense-0.3")
;; (add-to-list 'load-path (concat rsense-home "/etc"))
;; (require 'rsense)
;; (define-key ruby-mode-map "\C-ci" 'ac-complete-rsense)
;; (define-key ruby-mode-map "\C-ct" 'rsense-type-help)
;; (define-key ruby-mode-map "\C-cj" 'rsense-jump-to-definition)
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             ;; .や::を入力直後から補完開始
;;             (add-to-list 'ac-sources 'ac-source-rsense-method)
;;             (add-to-list 'ac-sources 'ac-source-rsense-constant)
;;             ;; C-c .で補完出来るようキーを設定
;;             (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

;; (setq rsense-rurema-home (concat rsense-home "/doc/ruby-refm-1.9.2-dynamic-20110629"))
;; (setq rsense-rurema-refe "refe-1_9_2")

;; Fix indent
;; refs: http://willnet.in/13
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-d") 'xmp)

;; rhtml
(require 'rhtml-mode)

;;
;; https://groups.google.com/forum/#!topic/emacs-on-rails/Cuh_x5eCK_M
;;
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

