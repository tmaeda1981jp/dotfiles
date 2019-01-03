(use-package key-chord
  :init
  (setq key-chord-two-keys-delay 0.15
      key-chord-safety-interval-backward 0.1
      key-chord-safety-interval-forward  0.25)
  (key-chord-mode t)
  :config
  (key-chord-define-global ";r" 'replace-string)
  (key-chord-define-global "'r" 'replace-regexp)
  )
