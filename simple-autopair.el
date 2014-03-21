(global-set-key [?\M-\"] 'simple-autopair-\")

(defun simple-autopair-\" (&optional arg)
  (interactive "P")
  (insert-pair arg ?\"))
