(global-unset-key "\C-x\C-c")
(global-set-key "\M-\C-\\" 'save-buffers-kill-emacs)
(global-set-key "\C-c\C-c" 'compile)
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


(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

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

(global-set-key [f12] 'minimap-toggle)
;;(minimap-toggle)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
