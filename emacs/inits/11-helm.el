(require 'helm-config)
(require 'helm-ls-git)

(defun my:helm ()
  (interactive)
  (helm :sources '(helm-c-source-files-in-current-dir
                   helm-c-source-recentf
                   helm-c-source-buffers-list
                   helm-source-locate)
        :buffer "*helm*"))
  ;; (helm-other-buffer
  ;;  '(
  ;;    helm-c-source-files-in-current-dir
  ;;    helm-c-source-recentf
  ;;    helm-c-source-buffers-list
  ;;    )
  ;;  " *helm*"))
(global-set-key (kbd "C-l") 'my:helm)
(setq recentf-max-saved-items 15)

(require 'helm-anything)
(helm-anything-set-keys)

;; ---------------------------------------------------------------
;; helm-imenu
;; ---------------------------------------------------------------
(require 'helm-imenu)
(global-set-key (kbd "C-r") 'helm-imenu)

;; ---------------------------------------------------------------
;; helm-ls-git
;; ---------------------------------------------------------------
(global-set-key (kbd "C-c C-l") 'helm-ls-git-ls)

;; ---------------------------------------------------------------
;; helm-M-x
;; ---------------------------------------------------------------
(global-set-key (kbd "M-x") 'helm-M-x)

;; ---------------------------------------------------------------
;; bufferを常に画面右側に表示させる為の設定
;; refs: http://stackoverflow.com/questions/9992475/how-to-show-anything-buffers-always-in-new-window
;; ---------------------------------------------------------------
(setq helm-display-function (lambda (buf)
                              (split-window-horizontally)
                              (other-window 1)
                              (switch-to-buffer buf)
                              ))

;; ---------------------------------------------------------------
;; mini-bufferでもC-hが使えるようにする設定
;; refs: http://mikio.github.io/article/2013/01/31_helmc-h.html
;; refs: http://blog.handlena.me/entry/2013/02/21/110818
;; ---------------------------------------------------------------
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))

;; ---------------------------------------------------------------
;; mini-bufferでC-kを押すと先頭から削除される問題の対処
;; refs: http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;; ---------------------------------------------------------------
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

;; ---------------------------------------------------------------
;; google
;; ---------------------------------------------------------------
(setq helm-google-suggest-use-curl-p (executable-find "curl"))
(setq helm-google-suggest-search-url
      "http://www.google.co.jp/search?hl=ja&num=100&as_qdr=y5&lr=lang_ja&ie=utf-8&oe=utf-8&q=")
(setq helm-google-suggest-url
      "http://google.co.jp/complete/search?ie=utf-8&oe=utf-8&hl=ja&output=toolbar&q=")

;; ---------------------------------------------------------------
;; migemo
;; ---------------------------------------------------------------
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\g"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;; TODO helm-migemoをrequireするとoccurで絞込みができない．候補が出てこなくなる．
;; (require 'helm-migemo)
;; (define-key global-map [(control ?:)] 'helm-migemo)
(global-set-key (kbd "C-s") 'helm-occur)

(require 'helm-ag-r)
;; Specify your favorite ag's configuration
;; You can change below option by pushing C-o on helm-ag-r's minibuffer.
(setq helm-ag-r-option-list '("-S -U --hidden" "-S -U -g")
      ;; start searching from 2 character
      helm-ag-r-requires-pattern 2
      ;; Display candidate only you specified number
      helm-ag-r-candidate-limit 100  ; <- default is helm-candidate-number-limit
      ;; delay searching from input
      helm-ag-r-input-idle-delay 0.5)

(global-set-key (kbd "C-c C-s") 'helm-ag-r)


(defun helm-ag-r-shell-history ()
  "Search shell history(I don't make sure without zsh)"
  (interactive)
  (helm-ag-r-pype
   "cat ~/.zsh_history | sed 's/^: [0-9]*:[0-9];//'"
   '((action . (lambda (line)
                 (case major-mode
                   (term-mode (term-send-raw-string line))
                   (t (insert line))))))))

;;; helm-c-ysanippet
;;; (from mail magazine vol134)
(setq 'helm-c-yasnippet)
(setq helm-yas-display-key-on-candidte t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(yas-global-mode 1)

;; markdownの見出し一覧(TODO あとで消す)
(defun helm-markdown-headlines ()
  "Display headlines for the current markdown file."
  (interactive)
  (helm :sources '(((name . "Markdown Headlines")
                    (volatile)
                    (headline "^#")))))

