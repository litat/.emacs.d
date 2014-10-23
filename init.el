;;
;; settings
;;

;; display
(modify-all-frames-parameters '((menu-bar-lines . 0)))
(set-face-background 'mode-line nil)
(set-face-background 'mode-line-inactive nil)

;; turn on useful features
(ido-mode 1)      

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

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
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; ess
(autoload 'r-mode "ess-site" nil t)
(add-to-list 'auto-mode-alist '("\\.[rR]\\'" . r-mode))
(setq ess-eval-visibly nil)
(setq ess-ask-for-ess-directory nil)
(setq ess-history-file nil)
(setq ess-tab-complete-in-script t)

;; idomenu
(global-set-key (kbd "C-c i") 'idomenu)

;; js3-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))

;; multiple-cursors
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c r") 'mc/mark-all-in-region)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

;; web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; yasnippet
(add-hook 'js3-mode-hook 'yas-minor-mode)
(add-hook 'yas-minor-mode-hook 'yas-reload-all)

;; zencoding-mode
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'web-mode-hook 'zencoding-mode)

;;
;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)
(autoload 'eval-and-replace "eval-and-replace" nil t)
(add-hook 'lisp-interaction-mode 'eval-and-replace)
(define-key lisp-interaction-mode-map (kbd "C-x C-e") 'eval-and-replace)
