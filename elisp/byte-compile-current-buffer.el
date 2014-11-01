(require 'bytecomp)

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
	     (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
