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
   (tool-bar-lines . 0)
   (width . 82)
   (height . 55)))
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(setq visible-bell t
      use-dialog-box nil
      ns-pop-up-frames nil
      inhibit-splash-screen t
      frame-resize-pixelwise t)
(tooltip-mode -1)
(menu-bar-mode -1)

(if (display-graphic-p)
    (progn (global-set-key (kbd "C-x C-c") 'ns-do-hide-emacs)
	   (global-unset-key (kbd "C-z"))
	   (global-set-key (kbd "C-x C-z") 'save-buffers-kill-terminal)
	   ;; theme related
	   (load-theme 'wombat)
	   (set-face-background 'cursor "white")
	   (set-face-background 'isearch "LightSkyBlue1")
	   (set-face-background 'lazy-highlight "Royalblue4")))

;; turn on useful features
(electric-pair-mode 1)
(show-paren-mode 1)
(windmove-default-keybindings)
(advice-add 'browse-url-of-buffer :before
	    (lambda ()
	      (interactive)
	      (save-buffer)))

;; settings
(setq eval-expression-print-length nil)

;; enable disabled functions
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

; environment variables
(setenv "PATH"
	"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin")
(setq exec-path (split-string (getenv "PATH") ":"))
(setenv "LANG" "en_US.UTF-8")

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

;; hl-tags-mode
(autoload 'hl-tags-mode "hl-tags-mode" nil t)
(add-hook 'sgml-mode-hook 'hl-tags-mode)

;; my-helm-company-show-doc
;(autoload 'my-helm-company-show-doc "my-helm-company-show-doc" nil t)

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
	  (define-key company-active-map (kbd "C-n") 'company-select-next)
	  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
	  (define-key company-active-map (kbd "C-s") 'helm-company)))
;; company-ess
(add-to-list 'company-backends 'company-ess-backend)
;; company-tern
(add-to-list 'company-backends 'company-tern)

;; ess
(autoload 'R-mode "ess-site" nil t)
(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . R-mode))
(eval-after-load 'ess-site
  '(progn (setq ess-eval-visibly nil
		ess-ask-for-ess-directory nil
		ess-history-file nil
		ess-tab-complete-in-script t)
	  (require 'cl)
	  (add-hook 'R-mode-hook 'subword-mode)
	  (define-key inferior-ess-mode-map (kbd "C-c SPC") 'ace-jump-mode)))

;; expand-region
(global-set-key (kbd "M-@") 'er/expand-region)

;; helm
(helm-mode 1)
(eval-after-load 'helm
  '(progn (require 'helm-config)
	  (require 'helm-imenu)
	  (require 'helm-company)
	  ;; keybindings
	  (global-set-key (kbd "M-x") 'helm-M-x)
	  (global-set-key (kbd "M-s o") 'helm-occur)
	  (global-set-key (kbd "M-s /") 'helm-multi-occur)
	  (global-set-key (kbd "M-g s") 'helm-do-grep)
	  (global-set-key (kbd "C-x b") 'helm-mini)
	  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
	  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
	  (global-set-key (kbd "C-h a") 'helm-apropos)
	  (global-set-key (kbd "C-h i") 'helm-info-elisp)
	  (define-key isearch-mode-map (kbd "M-s o") 'helm-occur-from-isearch)
;	  (define-key helm-company-map (kbd "C-h") 'my-helm-company-show-doc)
	  ;; settings
	  (helm-autoresize-mode 1)
	  (setq helm-split-window-in-side-p t
		helm-follow-mode-persistent t
		helm-quick-update t
		helm-display-header-line nil
		helm-autoresize-max-height 50
		helm-source-occur
		(helm-make-source "Occur" 'helm-source-multi-occur :follow 1)
		helm-source-moccur
		(helm-make-source "Moccur" 'helm-source-multi-occur :follow 1)
		helm-source-buffers-list
		(helm-make-source "Buffers" 'helm-source-buffers :follow 1)
		helm-source-imenu
		(helm-make-source "Imenu" 'helm-imenu-source :follow 1))
	  ;; display
	  (set-face-attribute 'helm-selection-line nil :underline nil)
	  (set-face-attribute 'helm-match-item nil :inherit 'lazy-highlight)
	  (set-face-attribute 'helm-source-header nil :height 1.1)
	  (set-face-background 'helm-selection "Royalblue4")
	  (set-face-background 'helm-visible-mark "Lightskyblue1")))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'tern-mode)
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-l") 'js2-display-error-list))

;; multiple-cursors
(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)

;; projectile
(projectile-global-mode 1)
(eval-after-load 'projectile
  '(progn (helm-projectile-on)
	  (setq projectile-completion-system 'helm
		projectile-enable-caching t)))

;; undo-tree
(defun undo-tree-on-file ()
  (when buffer-file-name
  (undo-tree-mode 1)))
(add-hook 'after-change-major-mode-hook 'undo-tree-on-file)

;; visual-regexp
(setq vr/default-replace-preview t)
(global-set-key (kbd "C-c r") 'vr/replace)
(global-set-key (kbd "C-c m r") 'vr/mc-mark)

;; web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key sgml-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; zencoding-mode
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'web-mode-hook 'zencoding-mode)

