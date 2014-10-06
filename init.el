;;
;; settings
;;

;; display
(modify-all-frames-parameters '((menu-bar-lines . 0)))

;;
;; packages
;;

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
