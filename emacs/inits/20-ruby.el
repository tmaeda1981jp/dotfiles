;; Rakefileもruby-modeで起動
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;; ruby-electric.el
;; refs: https://raw.github.com/ruby/ruby/trunk/misc/ruby-electric.el
(require 'ruby-electric nil t)
;; end の自動挿入
;; refs: https://groups.google.com/forum/?fromgroups#!msg/emacs-on-rails/Cuh_x5eCK_M/KDwjY4K6X1YJ
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

;; ruby-block.el
;; endに対応する行のハイライト
(when (require 'ruby-block nil t)
  (setq ruby-block-highlight-toggle t))

;; inf-ruby.el
;; M-x run-rubyでirbをemcasから使える
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")

(defun my-ruby-mode-hooks ()
  (inf-ruby-keys)
  (ruby-electric-mode t)
  (ruby-block-mode t))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hooks)

;; auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130209.651")
(require 'auto-complete-config)
(ac-config-default)

;; flymake
(require 'flymake)
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(defun ruby-mode-hook-flymake-init ()
  "Don't want flymake mode for ruby regions in rhtml files and also on read only files"
  (if (and (not (null buffer-file-name))
           (file-writable-p buffer-file-name))
      (flymake-mode-on)))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-flymake-init)

;; rspec-mode
(require 'rspec-mode)
(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;; rvm
(require 'rvm)
(defadvice ido-completing-read (around invaild-ido-completing-read activate)
  "ido-completing-read -> completing-read"
  (complete-read))
(rvm-use-default)

;; rsense
(setq rsense-home "/Users/tmaeda/.emacs.d/lang/ruby/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(define-key ruby-mode-map "\C-ci" 'ac-complete-rsense)
(define-key ruby-mode-map "\C-ct" 'rsense-type-help)
(define-key ruby-mode-map "\C-cj" 'rsense-jump-to-definition)
(add-hook 'ruby-mode-hook
          (lambda ()
            ;; .や::を入力直後から補完開始
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)
            ;; C-c .で補完出来るようキーを設定
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

(setq rsense-rurema-home (concat rsense-home "/doc/ruby-refm-1.9.2-dynamic-20110629"))
(setq rsense-rurema-refe "refe-1_9_2")

;; cucumber
;; https://github.com/michaelklishin/cucumber.el
(setq feature-default-language "ja")
(setq feature-default-i18n-file "~/.emacs.d/site-lisp/cucumber.el/i18n.yml")

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
