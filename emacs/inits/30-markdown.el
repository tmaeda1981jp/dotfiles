<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="generator" content="pandoc">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title></title>
  <style type="text/css">code{white-space: pre;}</style>
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="/Users/tmaeda/.emacs.d/lang/css/github.css">
</head>
<body>
<p>(defvar css-file-path &quot;~/.emacs.d/lang/css/github.css&quot;) (defun gfm-to-html () &quot;Convert GFM(Github Flavored Markdown) to HTML.&quot; (let ((gfm buffer-file-name) (html (replace-regexp-in-string &quot;.md$&quot; &quot;.html&quot; buffer-file-name))) (shell-command-to-string (concat &quot;pandoc &quot; &quot;-s &quot; &quot;-t &quot; &quot;html5 &quot; &quot;-c &quot; css-file-path &quot; -o &quot; html &quot; &quot; gfm))))</p>
<p>(add-hook 'markdown-mode-hook '(lambda () (add-hook 'after-save-hook 'gfm-to-html)))</p>
</body>
</html>
