;;
;; popwin.el
;; ref: http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '("*quickrun*") popwin:special-display-config)
(push '("*Backtrace*") popwin:special-display-config)
(push '("*markdown-output*") popwin:special-display-config)
