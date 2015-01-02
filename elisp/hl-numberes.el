(defun hl-numbers ()
  "Highlight numbers in code."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("[-+]?\\b[0-9]*\\.?[0-9]+\\(?:[eE][-+]?[0-9]+\\)?\\b"
      . 'font-lock-constant-face)))
  (font-lock-fontify-buffer))
