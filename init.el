;;
;; settings
;;

;; display
(modify-all-frames-parameters '((menu-bar-lines . 0)))
(set-face-background 'mode-line nil)
(set-face-background 'mode-line-inactive nil)

;; turn on useful features
(ido-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(advice-add 'browse-url-of-buffer :before
	    (lambda ()
	      (interactive)
	      (save-buffer)))

;; enable disabled functions
(put 'erase-buffer 'disabled nil)

;;
;; elisp files to load
;;

(add-to-list 'load-path "~/.emacs.d/elisp")

(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
(add-hook 'css-mode-hook 'css-syntax-color-hex)
(add-hook 'web-mode-hook 'css-syntax-color-hex)

(autoload 'eval-and-replace "eval-and-replace" nil t)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-and-replace)
(define-key lisp-interaction-mode-map (kbd "C-c C-e") 'eval-and-replace)

(autoload 'byte-compile-current-buffer "byte-compile-current-buffer" nil t)
(add-hook 'after-save-hook 'byte-compile-current-buffer)

;;
;; packages
;;

(package-initialize)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; ace-jump-mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; auto-complete-mode
(global-auto-complete-mode 1)
(add-hook 'inferior-js-mode-hook 'ac-capf-setup) ;; ac-capf
(add-hook 'js2-mode-hook 'ac-capf-setup)
(add-hook 'lisp-interaction-mode-hook 'ac-capf-setup)
(add-hook 'emacs-lisp-mode-hook 'ac-capf-setup)

;; ess
(add-hook 'R-mode-hook 'subword-mode)
(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . r-mode))
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
(setq ess-history-file nil)
(setq ess-tab-complete-in-script t)

;; expand-region
(global-set-key (kbd "M-@") 'er/expand-region)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'subword-mode)
(add-hook 'js2-mode-hook 'tern-mode) ;; tern

;; js-comint
(setq inferior-js-program-command "/usr/local/bin/node")
(setenv "NODE_NO_READLINE" "1")
(defvar js2-mode-map)
(eval-after-load 'js2-mode
  '(progn (define-key js2-mode-map (kbd "C-c j j") 'js-send-last-sexp-and-go)
	  (define-key js2-mode-map (kbd "C-c j r") 'js-send-region-and-go)
	  (define-key js2-mode-map (kbd "C-c j b") 'js-send-buffer-and-go)))

;; litable
(add-hook 'lisp-interaction-mode-hook 'litable-mode)

;; multiple-cursors
(global-set-key (kbd "C-c m l") 'mc/edit-lines)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)

;; visual-regexp
(global-set-key (kbd "C-c r") 'vr/replace)
(global-set-key (kbd "C-c m r") 'vr/mc-mark)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-hook 'web-mode-hook 'zencoding-mode) ;; zencoding-mode

;; web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(defvar web-mode-map)
(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
(defvar css-mode-map)
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; yasnippet
(declare-function yas-reload-all "yasnippet")
(add-hook 'js2-mode-hook '(lambda ()
			    (yas-minor-mode 1)))
(add-hook 'web-mode-hook '(lambda ()
			    (yas-minor-mode 1)))
