;;
;; popwin.el
;; ref: http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;
(setq pop-up-windows nil)
(use-package popwin
  :init
  (setq display-buffer-function 'popwin:display-buffer)
  :config
  (setq popwin:special-display-config
        '(("*complitation*" :noselect t)
          )))
