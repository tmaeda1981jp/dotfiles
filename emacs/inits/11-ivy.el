(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 40)
  (setq ivy-extra-directories nil)
  (setq ivy-re-builders-alist
        '((t . ivy--regex-plus))))

(use-package counsel
  :init
  ;; counsel設定
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; find-fileもcounsel任せ！
  (defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../"))))


(use-package swiper
  :init
  (global-set-key "\C-s" 'swiper))
