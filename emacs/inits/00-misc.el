(require 'server)
(unless (server-running-p)
  (server-start))

(defvar is_emacs24 (equal emacs-major-version 24))
(defvar is_window-sys (not (eq (symbol-value 'window-system) nil)))
(defvar is_mac (or (eq window-system 'mac) (featurep 'ns)))
(defvar is_cocoa (and is_mac is_emacs24 is_window-sys))
(defvar is_linux (equal system-configuration 'i686-pc-linux-gnu))

;; -----------------------------------------------
;; encoding
;; -----------------------------------------------
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq system-uses-terminfo nil)

;; -----------------------------------------------
;; font settings
;; -----------------------------------------------
(when is_cocoa
  (set-face-attribute 'default nil
                      :family "Consolas"
                      :height 120)
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("Osaka" . "iso10646-1"))
  (set-fontset-font "fontset-default"
                    'katakana-jisx0201
                    '("Osaka" . "iso10646-1"))
  (setq face-font-rescale-alist
        '((".*Courier-bold.*" . 1.0)
          (".*Courier-medium.*" . 1.0)
          (".*Osaka-bold.*" . 1.0)
          (".*Osaka-medium.*" . 1.0)
          ("-cdac$" . 1.4)))

  (setq initial-frame-alist
        (append (list
                 '(width . 220)
                 '(height . 90)
                 )
                initial-frame-alist))
  (setq default-frame-alist initial-frame-alist))


;; 起動時の画面は非表示
(setq inhibit-startup-message t)

;; ¥をバックスラッシュに変更する
(define-key global-map [?¥] "\\")

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; ツールバーを消す
;; Emacs.appの場合のみ有効にする(Terminalから起動の場合に以下のエラー発生のため)
;; Symbol's function definition is void: tool-bar-mode
;; ref: http://efreedom.com/Question/2-132055/Check-Emacs-GUI-Mode-Execute-Tool-Bar-Mode
(if window-system
    (tool-bar-mode 0))
(menu-bar-mode 0)

;; GCを減らして動作を軽くする(デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; タブ幅を2に設定
(setq-default tab-width 2)

;; タブ幅の倍数を設定
(setq tab-stop-list
      '(2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))

;; タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; C-hを後退に割り当てる
(global-set-key (kbd "C-h") 'delete-backward-char)

;; スクロールバーを無効にする
(scroll-bar-mode -1)

;; yes -> y / no -> n
(defalias 'yes-or-no-p 'y-or-n-p)

;; cua-modeで複数行入力する時にcua-modeが解除されてしまって不便なのでとりあえずコメントアウト．
;; カッコの補完
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;;(setq skeleton-pair 1)

;; ログの記録行数を増やす
(setq message-log-max 10000)

;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; タイトルバーにファイル名を表示する
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; モードラインに時間を表示する
(display-time)

;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;; terminalから使う分には関係ないので無効化
;; 85%で透明化
;;(set-frame-parameter nil 'alpha 85)

;; ;;; 背景色
;; (set-background-color "black")
;; (set-foreground-color "white")

;; ;; モードラインの文字の色と背景色
;; (set-face-foreground 'modeline "White")
;; (set-face-background 'modeline "DodgerBlue4")

;; 現在行に色を付ける
;; ref: http://www.bookshelf.jp/soft/meadow_31.html#SEC444
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "gray7"))
    (((class color)
      (background light))
     (:background "gray19"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;; bufferを自動で再読み込みする
(global-auto-revert-mode 1)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 補完可能なものを随時表示
(icomplete-mode 1)

;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; optionをメタキーにする
(when is_mac
  (require 'mac-key-mode)
  (mac-key-mode 1)
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier nil))

(define-key function-key-map (kbd "<f8>") 'event-apply-hyper-modifier)

;;;;; emacs 24.4ではfind-fileの挙動が変わったので使わなくてもよさそうな感じ
;; C-x C-fの時にzshライクに候補を表示する
;; ref: http://d.hatena.ne.jp/mooz/20101003/p1
;;(require 'zlc)

;; 行番号を表示
(require 'linum)
(global-linum-mode t)
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; Ctrl-x oをShift+矢印で移動
;; ref: http://murakan.cocolog-nifty.com/blog/2009/01/emacs-tips-3e2b.html
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; copy
;; Emacsでcopy(M-w)したものをclickboardに送る
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)

;; paste
;; clipboardの内容をC-x C-yでyankする．
(defun pt-pbpaste ()
  "Paste data from pasteboard."
  (interactive)
  (shell-command-on-region
   (point)
   (if mark-active (mark) (point))
   "pbpaste" nil t))
(global-set-key (kbd "C-x C-y") 'pt-pbpaste)

(global-set-key "\M-n" 'next-buffer)
(global-set-key "\M-p" 'previous-buffer)

;; 画面分割の際に上下を入れ替える
;; ref: http://www.bookshelf.jp/soft/meadow_30.html#SEC402
(defun swap-screen()
  "Swap two screen, leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen, with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key "\C-x7" 'swap-screen)

;; frame switch
(defun window-toggle-division ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let (before-height (other-buf (window-buffer (next-window))))
    (setq before-height (window-height))
    (delete-other-windows)

    (if (= (window-height) before-height)
        (split-window-vertically)
      (split-window-horizontally)
      )

    (switch-to-buffer-other-window other-buf)
    (other-window -1)))
(global-set-key "\C-x9" 'window-toggle-division)

;;
;; color-theme
;;
(when (require 'color-theme)
  (color-theme-initialize)
  ;; color-theme-molokai
  ;; http://qiita.com/items/17464754663936cb7895
  (when (require 'color-theme-molokai)
    (color-theme-molokai)))


;; 同名ファイルを識別しやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key [?\C-c ?\C-@] 'cua-set-rectangle-mark)

;; multiple-cursol
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-b") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-r") 'mc/mark-all-in-region)

;; key-chord
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.05)

(key-chord-define-global "gl" 'goto-line)
(key-chord-define-global "rt" 'replace-string)

(global-set-key (kbd "C-c l") 'recenter)

;; 行の入れ替え
;; refs: http://qiita.com/ShingoFukuyama/items/fc51a32e84fd84261565
(defun move-line (arg)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines arg))
    (when (> arg 0)
      (forward-line arg))
    (move-to-column col)))

(global-set-key (kbd "M-N") (lambda () (interactive) (move-line 1)))
(global-set-key (kbd "M-P") (lambda () (interactive) (move-line -1)))


(require 'wrap-region)
(wrap-region-global-mode t)
(wrap-region-add-wrappers
 '(("`" "`" nil '(markdown-mode))
   ("```" "```" "#" '(markdown-mode))))

;; 自動バックアップを無効にする
(setq make-backup-files nil)
(setq auto-save-default nil)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; ---------------------------------------------------------------
;; 半角スペース，全角スペース，タブの見える化
;; refs: http://qiita.com/catatsuy/items/55d50d13ebc965e5f31e
;; ---------------------------------------------------------------
(require 'whitespace)

(setq whitespace-style '(face tabs tab-mark spaces space-mark lines-tail trailing space-before-tab space-after-tab::space))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      ;;      '((space-mark ?\x3000 [?\□])
      '((space-mark ?\x3000 [?\❏])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(global-whitespace-mode t)

(set-face-attribute 'whitespace-trailing nil
                    :foreground "DeepPink"
                    :background 'unspecified
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :foreground "Grey"
                    :background 'unspecified
                    :underline nil)
(set-face-attribute 'whitespace-space nil
                    :foreground "red"
                    :background 'unspecified
                    :weight 'bold)

;; indent修正
(defun reindent-whole-buffer ()
  "Reindent the whole buffer."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max)))

(global-set-key (kbd "C-x j") 'reindent-whole-buffer)

;; Carriage Retrun 一括置換
(defun remove-all-cr ()
  "Remove all carriage return."
  (interactive)
    (save-excursion
      (beginning-of-buffer)
      (while (re-search-forward "" nil t)
        (replace-match "
"))))

(global-set-key (kbd "C-x w") 'remove-all-cr)

;; 他のbufferを全て削除
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(global-set-key (kbd "C-x a k") 'kill-other-buffers)

;; 指定のURLを開く
(defun open-specified-url ()
  "Open specified-url"
  ;; (interactive "sURL: ")
  (interactive)
  (let* ((url (read-string "URL: " "http://")))
    ;; (message url)
    (shell-command-to-string (format "open %s &" url))))

(global-set-key (kbd "C-x p") 'open-specified-url)

;; google search
(defun google-search ()
  "Google Search"
  (interactive)
  (let* ((keyword (read-string "Search: ")))
    (message keyword)
    (shell-command-to-string (format "open 'https://www.google.co.jp/search?q=%s'" keyword))))

(global-set-key (kbd "C-x g") 'google-search)

;; .gitignoreをconf-modeで開く
(add-to-list 'auto-mode-alist '("\\.gitignore$" . conf-mode))

;;====================================
;;; 折り返し表示ON/OFF
;;; refs: http://ubulog.blogspot.jp/2007/09/emacsonoff.html
;;====================================
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))

(global-set-key (kbd "C-c C-q") 'toggle-truncate-lines)

