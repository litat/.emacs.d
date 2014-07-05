(defun my-bell-function()
  (unless (memq this-command
		'(mwheel-scroll))
    (ding)))

(setq ring-bell-function 'my-bell-function)
