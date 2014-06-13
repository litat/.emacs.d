;; display
(when window-system
  ;; windows and frames
  (modify-all-frames-parameters '((border-width . 0)
				  (internal-border-width . 0)
				  (vertical-scroll-bars . nil)
				  (left-fringe . 0)
				  (right-fringe . 0)
				  (menu-bar-lines . 0)
				  (tool-bar-lines . 0)))
  (set-frame-parameter nil 'fullscreen 'fullboth)
  (tooltip-mode -1)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

  ;; color theme
  (add-to-list 'custom-theme-load-path "~/.emacs.d/solarized")
  (load-theme 'solarized-light t))

;; do not use dialog box
(setq use-dialog-box nil)

;; editing mode
(show-paren-mode 1)
(electric-pair-mode 1)

;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'css-syntax-color-hex)

;; ispell
(setq-default ispell-program-name "/usr/local/bin/ispell")

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; font 中文
(set-face-attribute 'default nil :font "Menlo-14")
(set-fontset-font t 'unicode '("STHeiti" . "unicode-bmp"))

;; Mac specific
(setq mac-command-modifier 'control)

;; shell PATH
(setenv "PATH"
	(concat (getenv "PATH") ":" "/usr/local/bin/" ":" "/usr/texbin"))

;; ESS Emacs Speaks Statistics
(add-to-list 'load-path "~/.emacs.d/ess/lisp")
(autoload 'R "ess-site" nil t)
(autoload 'r-mode "ess-site" nil t)
(autoload 'julia "ess-site" nil t)
(autoload 'julia-mode "ess-site" nil t)
