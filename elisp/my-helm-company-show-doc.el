(defun my-helm-company-show-doc ()
  "Show the documentation of the current selection."
  (interactive)
  (let ((symbol (intern (car (helm-marked-candidates)))))
    (setq doc-string (describe-function-or-variable symbol))
    (with-current-buffer (get-buffer-create "*company-documentation*")
      (erase-buffer)
      (when doc-string
	(save-excursion
	  (insert doc-string)))
      (current-buffer))))

(define-key helm-company-map (kbd "C-h") 'my-helm-company-show-doc)
