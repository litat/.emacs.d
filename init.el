;; display
(when window-system
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)
  (menu-bar-mode -1)
  (set-fringe-style 0)
  (tooltip-mode -1)

  ;; color theme
  (add-to-list 'custom-theme-load-path "~/.emacs.d/solarized")
  (load-theme 'solarized-light t)

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
