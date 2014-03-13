;; display
(when window-system
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)

  ;; color
  (set-face-background 'default "gray25")
  (set-face-foreground 'default "gray75")
  (set-face-background 'fringe "gray25")
  (set-face-background 'region "gray50")

  ;; font 中文
  (set-frame-font "Menlo-14")
  (set-fontset-font t 'unicode '("STHeiti" . "unicode-bmp"))

  ;; Mac specific
  (setq mac-command-modifier 'control))

;; set shell path
(add-to-list 'load-path "~/.emacs.d")
(load "path")

;; autopair
(require 'autopair)
(autopair-global-mode)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)
(setq ac-use-quick-help nil)

;; smart operator
(autoload 'smart-operator-mode "smart-operator" nil t)

;; ESS Emacs Speaks Statistics
(add-to-list 'load-path "~/.emacs.d/ess/lisp")
(autoload 'R "ess-site" nil t)
(autoload 'r-mode "ess-site" nil t)
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
