(defun css-syntax-color-hex ()
  "Syntax color hex color spec such as #ff1100 in current buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[[:xdigit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))

(add-hook 'css-mode-hook 'css-syntax-color-hex)
(add-hook 'html-mode-hook 'css-syntax-color-hex)
