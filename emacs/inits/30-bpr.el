(require 'bpr)

(setq bpr-colorize-output t)
(setq bpr-close-after-success t)


(defun php-unit ()
  "Execute phpunit command"
  (interactive)
  (let* ((bpr-scroll-direction -1))
    (bpr-spawn "phpunit")))
