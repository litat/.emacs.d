(defun ac-capf-setup-maybe ()
  "Run `ac-capf-setup' unless it's in minibuffer."
  (unless (minibufferp (current-buffer))
    (ac-capf-setup)))
