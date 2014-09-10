;; wiki (gollum)
(prodigy-define-service
  :name "gollum"
  :cwd "~/wiki"
  :command "gollum"
  :tags '(wiki gollum)
  :port 4567)

;; blog (jekyll)
(prodigy-define-service
  :name "jekyll"
  :env '(("LANG" "ja_JP.UTF-8")
         ("LC_ALL" "ja_JP.UTF-8"))
  :cwd "~/blog/jekyll"
  :command "jekyll"
  :args '("server" "--watch")
  :tags '(blog jekyll)
  :port 4000)

;; cask
(prodigy-define-service
  :name "cask"
  :cwd "~/dotfiles/emacs"
  :command "cask"
  :tags '(emacs cask))


(global-set-key (kbd "C-c C-u") 'prodigy)
