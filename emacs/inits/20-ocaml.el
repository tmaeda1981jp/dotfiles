;; https://github.com/ocaml/tuareg
;; Indent `=' like a standard keyword.
(setq tuareg-lazy-= t)
;; Indent [({ like standard keywords.
(setq tuareg-lazy-paren t)
;; No indentation after `in' keywords.
(setq tuareg-in-indent 0)

(add-hook 'tuareg-mode-hook
          ;; Turn on auto-fill minor mode.
          (lambda () (auto-fill-mode 1)))
