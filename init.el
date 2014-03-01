;; display
(when window-system
  (set-frame-size (selected-frame) 80 44)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)
  (setq mac-command-modifier 'control)
  (set-face-background 'default "gray25")
  (set-face-background 'fringe "gray25")
  (set-face-foreground 'default "gray75")
  (set-face-background 'region "gray50"))

;; font 中文
(set-frame-font "Menlo-14" nil t)
(set-fontset-font t 'unicode '("STHeiti" . "unicode-bmp"))

;; set shell path
(add-to-list 'load-path "~/.emacs.d")
(load "path")

;; smart operator
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
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
