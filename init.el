;;
;; settings
;;

;; display
(modify-all-frames-parameters '((border-width . 0)
				(internal-border-width . 0)
				(vertical-scroll-bars . nil)
				(left-fringe . 0)
				(right-fringe . 0)
				(menu-bar-lines . 0)
				(tool-bar-lines . 0)))
(tooltip-mode -1)
(setq use-dialog-box nil)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; editing mode
(show-paren-mode 1)
(electric-pair-mode 1)

;; Mac specific
(setq mac-command-modifier 'control)

;; shell PATH
(setenv "PATH"
	(concat (getenv "PATH") ":" "/usr/local/bin/"))

;;
;; packages
;;

;; ispell
(setq-default ispell-program-name "/usr/local/bin/ispell")

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")
(load "ring-bell-ignore")
(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
