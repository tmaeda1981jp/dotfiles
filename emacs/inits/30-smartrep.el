;; ref: http://sheephead.homelinux.org/2011/12/19/6930/
(require 'smartrep)
(defvar ctl-q-map (make-keymap))
;; (define-key global-map "\C-q" ctl-q-map)
;; (smartrep-define-key
;;     global-map "C-q" '(("n" . (lambda () (scroll-other-window 1)))
;;                        ("p" . (lambda () (scroll-other-window -1)))
;;                        ("N" . 'scroll-other-window)
;;                        ("P" . (lambda () (scroll-other-window '-)))
;;                        ("a" . (lambda () (beginning-of-buffer-other-window 0)))
;;                        ("e" . (lambda () (end-of-buffer-other-window 0)))
;;                        ("{" . shrink-window-horizontally)
;;                        ("}" . enlarge-window-horizontally)))
