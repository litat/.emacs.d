;;
;; settings
;;

;; display

(modify-all-frames-parameters
 '((vertical-scroll-bars . nil)
   (horizontal-scroll-bars . nil)
   (menu-bar-lines . 0)
   (border-width . 0)
   (internal-border-width . 0)
   (left-fringe . 0)
   (right-fringe . 0)
   (tool-bar-lines . 0)))
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(setq visible-bell t
      use-dialog-box nil
      ns-pop-up-frames nil
      inhibit-splash-screen t)
(tooltip-mode -1)
(menu-bar-mode -1)
;; some useful features
(if (display-graphic-p))
(global-unset-key (kbd "C-z"))

;; turn on useful features
(ido-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(windmove-default-keybindings)
(advice-add 'browse-url-of-buffer :before
	    (lambda ()
	      (interactive)
	      (save-buffer)))

;; enable disabled functions
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; ediff setting
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;
;; elisp files to load
;;

(add-to-list 'load-path "~/.emacs.d/elisp")

;; css-syntax-color-hex
(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
(add-hook 'css-mode-hook 'css-syntax-color-hex)
(add-hook 'web-mode-hook 'css-syntax-color-hex)

;; eval-and-replace
(autoload 'eval-and-replace "eval-and-replace" nil t)
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

;; byte-compile-current-buffer
(autoload 'byte-compile-current-buffer "byte-compile-current-buffer" nil t)
(add-hook 'after-save-hook 'byte-compile-current-buffer)

;; hl-numbers
(autoload 'hl-numbers "hl-numbers" nil t)
(add-hook 'emacs-lisp-mode-hook 'hl-numbers)
(add-hook 'lisp-interaction-mode-hook 'hl-numbers)
(add-hook 'js2-mode-hook 'hl-numbers)
(add-hook 'R-mode-hook 'hl-numbers)

;; pin-window
(autoload 'pin-window "pin-window" nil t)

;;
;; packages
;;

(package-initialize)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; ace-jump-mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; company
(global-company-mode 1)
(eval-after-load 'company
  '(progn (setq company-idle-delay 0
		company-echo-delay 0
		company-minimum-prefix-length 1)
	  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)))
;; company-ess
(add-to-list 'company-backends 'company-ess-backend)

;; ess
(autoload 'R-mode "ess-site" nil t)
(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . R-mode))
(eval-after-load 'ess-site
  '(progn (setq ess-eval-visibly nil
		ess-ask-for-ess-directory nil
		ess-history-file nil
		ess-tab-complete-in-script t)
	  (require 'cl)
	  (add-hook 'R-mode-hook 'subword-mode)))

;; expand-region
(global-set-key (kbd "M-@") 'er/expand-region)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'tern-mode)

;; multiple-cursors
(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)

;; undo-tree
(defun undo-tree-on-file ()
  (when buffer-file-name
  (undo-tree-mode 1)))
(add-hook 'after-change-major-mode-hook 'undo-tree-on-file)

;; visual-regexp
(setq vr/default-replace-preview t)
(global-set-key (kbd "C-c r") 'vr/replace)
(global-set-key (kbd "C-c m r") 'vr/mc-mark)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-hook 'web-mode-hook 'zencoding-mode) ;; zencoding-mode

;; web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))
