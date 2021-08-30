(global-unset-key "\C-x\C-c")
(global-set-key "\C-c\C-\\" 'save-buffers-kill-emacs)
(global-set-key "\C-c\C-c" 'compile)
(global-unset-key "\C-x5o")
(global-set-key "\C-xpp" 'other-frame)
(global-unset-key "\C-w")
(global-set-key "\C-w" 'kill-ring-save)
(global-unset-key "\M-w")
(global-set-key "\C-e" 'kill)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(column-number-mode)
(desktop-save-mode)
(setq-default c-default-style "bsd")
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default rust-indent-offset 2)
(setq-default js-indent-level 2)

;;(require 'go-autocomplete)
;;(require 'auto-complete-config)
;; (define-key ac-mode-map ([backtab]) 'auto-complete)

;;(define-key read-expression-map [(tab)] 'hippie-expand)

;;(add-hook 'write-contents-hooks (lambda () (tabify (point-min) (point-max))))

;;(global-set-key (kbd "<C-tab>") 'company-complete)

(when (eq window-system 'x)
  (scroll-bar-mode -1))

(menu-bar-mode -1)
(tool-bar-mode -1)
;;(add-hook 'go-mode-hook (lambda ()
;;                          (setq indent-tabs-mode nil)))

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'ruby-mode-hook 'ruby-electric-mode)
;;(add-hook 'php-mode-hook 'whitespace-mode)
;; (add-hook 'c++-mode-hook 'column-highlight-mode)
;;(add-hook 'c++-mode-hook 'column-enforce-mode)
;; (require 'minimap)

(eval-when-compile
  (require 'use-package))

;;(use-package whitespace-mode :ensure t)
(use-package web-mode :ensure t)
(use-package lsp-mode :ensure t)
(use-package lsp-ui :ensure t)
(use-package markdown-mode :ensure t)
(use-package monokai-theme :ensure t)
(use-package lua-mode :ensure t)
(use-package go-mode :ensure t)
(use-package rust-mode :ensure t)
(use-package magit :ensure t)
(use-package treemacs :ensure t)

(whitespace-mode)

;;(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.css'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js'" . web-mode))
(setq web-mode-enable-css-colorization t)
(add-to-list 'default-frame-alist
           '(font . "Inconsolata-18:width=condensed:weight=light"))

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)
(toggle-fullscreen)

(set-frame-parameter (selected-frame) 'alpha '(95 . 80))
(add-to-list 'default-frame-alist '(alpha . (95 . 80)))

(add-hook 'c++-mode-hook #'lsp-deferred)

;; (add-hook 'before-save-hook #'gofmt-before-save)
(global-set-key [f10] 'minimap-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" "d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "8b58ef2d23b6d164988a607ee153fd2fa35ee33efc394281b1028c2797ddeebb" "f3ab34b145c3b2a0f3a570ddff8fabb92dafc7679ac19444c31058ac305275e1" default))
 '(package-selected-packages
   '(luarocks activity-watch-mode treemacs-magit lsp-mode yaml-mode kotlin-mode protobuf-mode deno-fmt use-package treemacs lua-mode hl-indent hl-todo rust-mode groovy-mode dockerfile-mode go-mode company-lsp lsp-ui yasnippet dart-mode lsp-dart flutter markdown-mode+ qml-mode cmake-mode jinja2-mode typescript-mode magit-gh-pulls magit-lfs magit gradle-mode jsonnet-mode lsp-treemacs monokai-theme))
 '(safe-local-variable-values
   '((eval message "Project directory set to `%s'." my-project-path)
     (eval setenv "GOPATH" my-project-path)
     (eval set
           (make-local-variable 'my-project-path)
           (file-name-directory
            (let
                ((d
                  (dir-locals-find-file ".")))
              (if
                  (stringp d)
                  d
                (car d)))))
     (eval add-hook 'before-save-hook #'clang-format-buffer nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (treemacs
;;(global-activity-watch-mode)
