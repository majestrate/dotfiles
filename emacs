(global-unset-key "\C-x\C-c")
(global-set-key "\C-c\C-\\" 'save-buffers-kill-emacs)
(global-set-key "\C-c\C-c" 'compile)
(global-unset-key "\C-x5o")
(global-set-key [s-kp-enter] 'other-frame)


(menu-bar-mode 0)
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
;;(require 'go-autocomplete)
;;(require 'auto-complete-config)
;;(define-key ac-mode-map (kbd "S-TAB") 'auto-complete)

;;(define-key read-expression-map [(tab)] 'hippie-expand)
;;(global-set-key (kbd "TAB") 'fancy-tab)

;;(add-hook 'write-contents-hooks (lambda () (tabify (point-min) (point-max))))

(when (eq window-system 'x)
  (scroll-bar-mode -1))

(menu-bar-mode -1)
(tool-bar-mode -1)

(add-hook 'go-mode-hook (lambda ()
                          (setq indent-tabs-mode nil)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'php-mode-hook 'whitespace-mode)
(add-hook 'c++-mode-hook 'whitespace-mode)

;;(require 'minimap)
;;(whitespace-mode)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)
(toggle-fullscreen)

(global-set-key [f10] 'minimap-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("be496fbe7e6acac40415e02fecaaf636de2cdc18a8237898654ec328f1a97dc9" "93806c69a5d53bdab5bb6cbb6a1ef2eee1474dca4bdab59141a3e3e7efd97e69" "5c2218b2054663054736edddccee54e947ff619387b4e25d4b251e71c7b8b5c0" "d01b7ba4f6f479ff76594894e20d92c8f067809196a161c3351668e8f158fce5" "d3a840caf1d00924035d2989928cf7b52dddfecd1cb54c6120916c0f4ae3d44c" "61698d4777ce41ac2b13aafe5cd1dfbeebfa823915331e4203782b9f8e2c2565" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'jeff)
