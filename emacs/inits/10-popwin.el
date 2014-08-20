;;
;; popwin.el
;; ref: http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;
(setq pop-up-windows nil)

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '("*quickrun*") popwin:special-display-config)
(push '("*Backtrace*") popwin:special-display-config)
(push '("*markdown-output*") popwin:special-display-config)
(push '("*magit-edit-log*") popwin:special-display-config)
(push '("^\*magit: .+\*$" :regexp t) popwin:special-display-config)
(push '("*Inf-Haskell*") popwin:special-display-config)
(push '("*Flycheck errors*") popwin:special-display-config)
(push '("*Codic Result*") popwin:special-display-config)
(push '("*ert*") popwin:special-display-config)
