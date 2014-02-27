;; display
(if window-system
    (progn (set-frame-height (selected-frame) 42)
	   (toggle-scroll-bar -1)
	   (tool-bar-mode -1)
	   (show-paren-mode 1)))

;; font 中文
(set-frame-font "Menlo-14" nil t)
(set-fontset-font t 'unicode '("STHeiti" . "unicode-bmp"))

;; smart operator
(add-to-list 'load-path "~/.emacs.d")
(require 'smart-operator)

;; autopair
(require 'autopair)
(autopair-global-mode)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
(setq ac-use-quick-help nil)

;; ESS Emacs Speaks Statistics
(add-to-list 'load-path "~/.emacs.d/ess/lisp")
(load "ess-site")
