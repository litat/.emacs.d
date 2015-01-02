(defun pin-window ()
  "Fix a window in place."
  (interactive)
  (set-window-dedicated-p (selected-window) t))
