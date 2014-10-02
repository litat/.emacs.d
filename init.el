;;
;; settings
;;

;; display
(modify-all-frames-parameters '((menu-bar-lines . 0)))

;; editing mode
(show-paren-mode 1)
(electric-pair-mode 1)

;; shell PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))

;;
;; packages
;;

;; ispell
(setq-default ispell-program-name "/usr/local/bin/ispell")

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
