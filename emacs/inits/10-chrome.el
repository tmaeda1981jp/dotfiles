;; 現在のファイルをchromeでopenする
(defun open-current-file-on-browser ()
  "Open current file on browser."
  (interactive)
  (shell-command-to-string (concatenate 'string "open -a Google\\ Chrome " (buffer-file-name))))

;; 現在chromeで開いているタブをreloadする
(defun reload-current-tab-on-browser ()
  "Reload current tab on browser."
  (interactive)
  (when is_mac ;; 00-misc.elで定義
    (shell-command-to-string
     (format "%s%s%s"
             "osascript -e "
             (mapconcat 'identity
                        '("\'tell application \"Google Chrome\"\'"
                          "\'tell active tab of first window\'"
                          "\'execute javascript \"window.location.reload()\"\'"
                          "\'end tell\'"
                          "\'end tell\'") " -e ")
             " &"))))

;; 現在chromeで開いているタブのURLをクリップボードにコピーする
(defun copy-current-url-on-browser ()
  "Copy current URL on browser"
  (interactive)
  (when is_mac
    (shell-command-to-string
     (format "%s%s%s"
             "osascript -e "
             (mapconcat 'identity
                        '("\'tell application \"Google Chrome\"\'"
                          "\'get URL of active tab of first window\'"
                          "\'end tell\'") " -e ")
             " | pbcopy"))))


(global-set-key (kbd "C-c r") 'reload-current-tab-on-browser)
(global-set-key (kbd "C-c u") 'copy-current-url-on-browser)
