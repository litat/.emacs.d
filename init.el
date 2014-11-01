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
(toggle-debug-on-error)
(add-hook 'js2-mode-hook 'subword-mode)
(advice-add 'browse-url-of-buffer :before 
	    (lambda ()
	      (interactive)
	      (save-buffer)))

;; enable disabled functions
(put 'erase-buffer 'disabled nil)

;;
;; packages
;;

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;
;; installed packages:

;; ace-jump-mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; ess
(autoload 'r-mode "ess-site" nil t)
(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . r-mode))
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
(setq ess-history-file nil)
(setq ess-tab-complete-in-script t)

;; expand-region
(global-set-key (kbd "M-@") 'er/expand-region)

;; flycheck-mode
(add-hook 'js2-mode-hook 'flycheck-mode)

;; idomenu
(global-set-key (kbd "C-c i") 'idomenu)

;; impatient-mode
(add-hook 'impatient-mode-hook (lambda ()
				 (when (imp-buffer-enabled-p (current-buffer))
				   (httpd-start)
				   (browse-url (concat "http://localhost:8080/imp/live/" (buffer-name))))))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; js-comint
(setq inferior-js-program-command "/usr/local/bin/node")
(setenv "NODE_NO_READLINE" "1")
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-j") 'js-send-last-sexp-and-go))
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-r") 'js-send-region-and-go))
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-b") 'js-send-buffer-and-go))

;; multiple-cursors
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c r") 'mc/mark-all-in-region)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

;; tern
(add-hook 'js2-mode-hook 'tern-mode)

;; web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; yasnippet
(add-hook 'js2-mode-hook 'yas-minor-mode)
(add-hook 'html-mode-hook 'yas-minor-mode)
(eval-after-load 'yasnippet '(yas-reload-all))

;; zencoding-mode
(add-hook 'sgml-mode-hook 'zencoding-mode)

;;
;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")

(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
(add-hook 'css-mode-hook 'css-syntax-color-hex)
(add-hook 'html-mode-hook 'css-syntax-color-hex)

(autoload 'eval-and-replace "eval-and-replace" nil t)
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

(autoload 'byte-compile-current-buffer "byte-compile-current-buffer" nil t)
(add-hook 'after-save-hook 'byte-compile-current-buffer)
