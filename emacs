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
  (require 'color-theme)
  (color-theme-initialize))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-hook 'go-mode-hook (lambda ()
                          (setq indent-tabs-mode nil)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
;;(require 'minimap)


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
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#d6d6d6")
 '(minimap-hide-scroll-bar nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00") (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829") (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f") (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f") (340 . "#eab700") (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
