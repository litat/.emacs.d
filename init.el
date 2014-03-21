;; display
(when window-system
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)

  ;; color
  (set-face-background 'default "gray60")
  (set-face-background 'fringe "gray60")
  (set-face-foreground 'default "black")
  (set-face-background 'region "khaki")

  ;; font 中文
  (set-frame-font "Menlo-14")
  (set-fontset-font t 'unicode '("STHeiti" . "unicode-bmp"))

  ;; Mac specific
  (setq mac-command-modifier 'control))

;; ESS Emacs Speaks Statistics
(add-to-list 'load-path "~/.emacs.d/ess/lisp")
(autoload 'R "ess-site" nil t)
(autoload 'r-mode "ess-site" nil t)
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
