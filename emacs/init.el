;; Setup straight.el
;; ref: https://github.com/raxod502/straight.el#getting-started
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use use-package.el
(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(require 'subr-x)
(straight-use-package 'git)

(defun org-git-version ()
  "The Git version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (git-run "describe"
              "--match=release\*"
              "--abbrev=6"
              "HEAD"))))

(defun org-release ()
  "The release version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (string-remove-prefix
      "release_"
      (git-run "describe"
               "--match=release\*"
               "--abbrev=0"
               "HEAD")))))

(provide 'org-version)

(straight-use-package 'org) ; or org-plus-contrib if desired


;; Use init-loader
(use-package init-loader
  :config
  (init-loader-load "~/.emacs.d/inits"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-dispatch-arguments nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


                                        ; ref: https://www.emacswiki.org/emacs/iTerm2
;; TERMINAL MAPPINGS TO SUPPORT ITERM2 FOR MAC
(progn
  (let ((map (if (boundp 'input-decode-map)
                 input-decode-map
               function-key-map)))
    (define-key map "\e[1;P9"  (kbd "H-a"))
    (define-key map "\e[1;P10" (kbd "H-b"))
    (define-key map "\e[1;P11" (kbd "H-c"))
    (define-key map "\e[1;P12" (kbd "H-d"))
    (define-key map "\e[1;P13" (kbd "H-e"))
    (define-key map "\e[1;P14" (kbd "H-f"))
    (define-key map "\e[1;P15" (kbd "H-g"))
    (define-key map "\e[1;P16" (kbd "H-h"))
    (define-key map "\e[1;P17" (kbd "H-i"))
    (define-key map "\e[1;P18" (kbd "H-j"))
    (define-key map "\e[1;P19" (kbd "H-k"))
    (define-key map "\e[1;P20" (kbd "H-l"))
    (define-key map "\e[1;P21" (kbd "H-m"))
    (define-key map "\e[1;P22" (kbd "H-n"))
    (define-key map "\e[1;P23" (kbd "H-o"))
    (define-key map "\e[1;P24" (kbd "H-p"))
    (define-key map "\e[1;P25" (kbd "H-q"))
    (define-key map "\e[1;P26" (kbd "H-r"))
    (define-key map "\e[1;P27" (kbd "H-s"))
    (define-key map "\e[1;P28" (kbd "H-t"))
    (define-key map "\e[1;P29" (kbd "H-u"))
    (define-key map "\e[1;P30" (kbd "H-v"))
    (define-key map "\e[1;P31" (kbd "H-w"))
    (define-key map "\e[1;P32" (kbd "H-x"))
    (define-key map "\e[1;P33" (kbd "H-y"))
    (define-key map "\e[1;P34" (kbd "H-z"))
    (define-key map "\e[1;P35" (kbd "H-0"))
    (define-key map "\e[1;P36" (kbd "H-1"))
    (define-key map "\e[1;P37" (kbd "H-2"))
    (define-key map "\e[1;P38" (kbd "H-3"))
    (define-key map "\e[1;P39" (kbd "H-4"))
    (define-key map "\e[1;P40" (kbd "H-5"))
    (define-key map "\e[1;P41" (kbd "H-6"))
    (define-key map "\e[1;P42" (kbd "H-7"))
    (define-key map "\e[1;P43" (kbd "H-8"))
    (define-key map "\e[1;P44" (kbd "H-9"))
    (define-key map "\e[1;P45" (kbd "H-<f1>"))
    (define-key map "\e[1;P46" (kbd "H-<f2>"))
    (define-key map "\e[1;P47" (kbd "H-<f3>"))
    (define-key map "\e[1;P48" (kbd "H-<f4>"))
    (define-key map "\e[1;P49" (kbd "H-<f5>"))
    (define-key map "\e[1;P50" (kbd "H-<f6>"))
    (define-key map "\e[1;P51" (kbd "H-<f7>"))
    (define-key map "\e[1;P52" (kbd "H-<f8>"))
    (define-key map "\e[1;P53" (kbd "H-<f9>"))
    (define-key map "\e[1;P54" (kbd "H-<f10>"))
    (define-key map "\e[1;P55" (kbd "H-<f11>"))
    (define-key map "\e[1;P56" (kbd "H-<f12>"))
    ))
