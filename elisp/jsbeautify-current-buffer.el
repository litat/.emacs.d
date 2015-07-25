(defun jsbeautify-current-buffer ()
  "run `web-beautify-js-buffer' before save"
  (interactive)
  (when (and (or (eq major-mode 'js2-mode)
		 (eq major-mode 'js-mode))
	     (buffer-file-name))
    (web-beautify-js-buffer)))
