;;
;; settings
;;

;; display
(modify-all-frames-parameters '((menu-bar-lines . 0)))
(set-face-background 'mode-line nil)
(set-face-background 'mode-line-inactive nil)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

;;
;; packages
;;

;; installed packages:
;;   ace-jump-mode
;;   auto-complete
;;   csv-mode
;;   js2-mode
;;   markdown-mode
;;   multiple-cursors
;;   popup
;;   web-mode
;;   yasnippet

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; multiple-cursors
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; other elisp files to load
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'css-syntax-color-hex "css-syntax-color-hex" nil t)

