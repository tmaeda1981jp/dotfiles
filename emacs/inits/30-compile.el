;; -------------------------------------------------
;; mode-compile
;; refs; http://emacswiki.org/emacs/ModeCompile
;; -------------------------------------------------
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

(setq mode-compile-always-save-buffer-p t)
(setq mode-compile-never-edit-command-p t)
(setq mode-compile-expert-p t)
(setq mode-compile-reading-time 0)

;; TODO
;; tput: unknown terminal "emacs"
