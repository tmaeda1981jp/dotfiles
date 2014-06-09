(load "haskell-mode-autoloads")

(custom-set-variables
 ;; Use cabal-dev for the GHCi session. Ensures our dependencies are in scope.
 ;;'(haskell-process-type 'cabal-dev)

 ;; Use notify.el (if you have it installed) at the end of running
 ;; Cabal commands or generally things worth notifying.
 '(haskell-notify-p t)

 ;; To enable tags generation on save.
 '(haskell-tags-on-save t)

 ;; To enable stylish on save.
 '(haskell-stylish-on-save t))

(autoload 'ghc-init "ghc" nil t)

(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)

            ;; Load the current file (and make a session if not already made).
            (define-key haskell-mode-map [?\C-c ?\C-l] 'haskell-process-load-file)
            (define-key haskell-mode-map [f5] 'haskell-process-load-file)

            ;; hoogle search
            (define-key haskell-mode-map "\C-ch" 'haskell-hoogle)
            ;; Switch to the REPL.
            (define-key haskell-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)

            ;; Jump to the imports. Keep tapping to jump between import
            ;; groups. C-u f8 to jump back again.
            (define-key haskell-mode-map [f8] 'haskell-navigate-imports)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(add-hook 'haskell-cabal-mode-hook
          (lambda ()
            (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
            (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
            (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
            (define-key haskell-cabal-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)))
