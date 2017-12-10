(global-unset-key "\C-x\C-c")
(global-set-key "\C-c\C-\\" 'save-buffers-kill-emacs)
(global-set-key "\C-c\C-c" 'compile)
(global-unset-key "\C-x5o")
(global-set-key "\C-xpp" 'other-frame)
(global-unset-key "\C-w")
(global-set-key "\C-w" 'kill-ring-save)
(global-unset-key "\M-w")
(global-set-key "\C-e" 'kill)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(column-number-mode)
(desktop-save-mode)
(setq-default c-default-style "linux")
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default rust-indent-offset 2)
(setq-default js-indent-level 2)

;;(require 'go-autocomplete)
;;(require 'auto-complete-config)
;; (define-key ac-mode-map [(backtab)] 'auto-complete)

;;(define-key read-expression-map [(tab)] 'hippie-expand)
;;(global-set-key (kbd "TAB") 'fancy-tab)

;;(add-hook 'write-contents-hooks (lambda () (tabify (point-min) (point-max))))

(when (eq window-system 'x)
  (scroll-bar-mode -1))

(menu-bar-mode -1)
(tool-bar-mode -1)

(add-hook 'go-mode-hook (lambda ()
                          (setq tab-width 2)))

;;(add-hook 'go-mode-hook (lambda ()
;;                          (setq indent-tabs-mode nil)))

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'ruby-mode-hook 'ruby-electric-mode)
;;(add-hook 'php-mode-hook 'whitespace-mode)
;;(add-hook 'c++-mode-hook 'column-highlight-mode)
;;(add-hook 'c++-mode-hook 'column-enforce-mode)
;;(require 'minimap)
(whitespace-mode)

;;(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.css'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js'" . web-mode))
(setq web-mode-enable-css-colorization t)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(add-to-list 'default-frame-alist
             '(font . "Inconsolata-10:width=condensed:weight=light"))
(global-set-key [f11] 'toggle-fullscreen)
(toggle-fullscreen)

(add-hook 'before-save-hook 'gofmt-before-save)

(global-set-key [f10] 'minimap-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-indent-comment-alist
   (quote
    ((anchored-comment column . 0)
     (end-block space . 2)
     (cpp-end-block space . 2))))
 '(c-indent-comments-syntactically-p (quote set-from-style))
 '(custom-safe-themes
   (quote
    ("b9cc6c94e60926efca4f4a45bbe5e7df21af1e45aa302b461b9bc6452089f7e5" "97ccd1982746a3298dc6edebbff275736deae002b37bf1797ebaaa42f947bf57" "be496fbe7e6acac40415e02fecaaf636de2cdc18a8237898654ec328f1a97dc9" "93806c69a5d53bdab5bb6cbb6a1ef2eee1474dca4bdab59141a3e3e7efd97e69" "5c2218b2054663054736edddccee54e947ff619387b4e25d4b251e71c7b8b5c0" "d01b7ba4f6f479ff76594894e20d92c8f067809196a161c3351668e8f158fce5" "d3a840caf1d00924035d2989928cf7b52dddfecd1cb54c6120916c0f4ae3d44c" "61698d4777ce41ac2b13aafe5cd1dfbeebfa823915331e4203782b9f8e2c2565" default)))
 '(electric-indent-mode t)
 '(global-auto-complete-mode t)
 '(indent-tabs-mode nil)
 '(jdee-server-dir "/home/jeff/git/jdee-server/jdee-server/")
 '(js-indent-level 2 t)
 '(package-selected-packages
   (quote
    (company company-c-headers company-go molokai-theme systemd web-beautify web-completion-data cmake-mode clang-format haskell-mode alchemist elixir-mode yaml-mode go-autocomplete govet markdown-mode go-mode color-theme-molokai color-theme jdee web-mode)))
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (eval message "Project directory set to `%s'." my-project-path)
     (eval setenv "GOPATH" my-project-path)
     (eval set
           (make-local-variable
            (quote my-project-path))
           (file-name-directory
            (let
                ((d
                  (dir-locals-find-file ".")))
              (if
                  (stringp d)
                  d
                (car d)))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(require 'jdee)
