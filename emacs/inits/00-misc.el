(require 'server)
(unless (server-running-p)
  (server-start))

;; -----------------------------------------------
;; encoding
;; -----------------------------------------------
(prefer-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(setq system-uses-terminfo nil)

;; 起動時の画面は非表示
(setq inhibit-startup-message t)

;; ¥をバックスラッシュに変更する
(define-key global-map [?¥] "\\")

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; GCを減らして動作を軽くする(デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; タブ幅を2に設定
(setq-default tab-width 4)

;; タブ幅の倍数を設定
(setq tab-stop-list
      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; C-hを後退に割り当てる
(global-set-key (kbd "C-h") 'delete-backward-char)

;; スクロールバーを無効にする
(scroll-bar-mode -1)

;; メニューバーを無効にする
(menu-bar-mode -1)

;; yes -> y / no -> n
(defalias 'yes-or-no-p 'y-or-n-p)

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
(use-package redo)
(use-package mac-key-mode
  :init
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier nil)
  :config
  (mac-key-mode 1)

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
(global-set-key "\C-x9" 'window-toggle-division))


;; 自動バックアップを無効にする
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-linum-mode t)


;; ATOM風theme
(use-package atom-one-dark-theme
  :init
  (load-theme 'atom-one-dark t)
)


;; C-v C-M-vによるスクロール操作の微調整
(setq scroll-error-top-bottom 'true)
