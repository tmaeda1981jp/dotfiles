;; color
(load-theme 'monokai t)

(eval-after-load 'whitespace
  '(progn
     (set-face-attribute 'whitespace-trailing nil
                         :foreground "#1B1E1C"
                         :background "Grey"
                         :underline t)
     (set-face-attribute 'whitespace-tab nil
                         :foreground "Grey"
                         :background 'unspecified
                         :underline nil)
     (set-face-attribute 'whitespace-space nil
                         :foreground "white"
                         :background 'unspecified
                         :weight 'bold)))

(eval-after-load 'flycheck
  '(progn
     (set-face-attribute 'flycheck-warning nil
                         :foreground "#FFFF87"
                         :background "#878700"
                         :weight 'bold
                         :underline nil)
     (set-face-attribute 'flycheck-fringe-warning nil
                         :background 'unspecified
                         :underline nil)
     (set-face-attribute 'flycheck-fringe-error nil
                         :background 'unspecified
                         :underline nil)
     (set-face-attribute 'whitespace-space-after-tab nil
                         :foreground "#1B1E1C"
                         :background "Yellow"
                         :underline nil)))
