;; -*- lexical-binding: t; -*-
(global-unset-key "\C-x\C-c")
(global-set-key "\C-c\C-\\" 'save-buffers-kill-emacs)
(global-set-key "\C-c\C-c" 'compile)
(global-unset-key "\C-w")
(global-set-key "\C-w" 'kill-ring-save)
(global-unset-key "\M-w")
(global-set-key "\C-e" 'kill)

;; base appearance
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/"))

(package-initialize)
(package-install 'use-package)
(require 'use-package)

;; dashboard
(use-package dashboard
  :ensure t
  :config (dashboard-setup-startup-hook))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)))
(setq dashboard-banner-logo-title "Emacs")
(setq dashboard-startup-banner "~/.emacs.d/banner.png")
(setq dashboard-center-content t)
(setq dashboard-display-icons-p t) 
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

;; completion
(use-package helm
  :ensure t)
(use-package helm-ls-git
  :ensure t
  :requires helm)
(use-package flyspell-correct-helm
  :ensure t
  :requires helm)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "\C-x\C-f") 'helm-find-files)
(global-set-key (kbd "\C-h") 'helm-apropos)
(global-set-key (kbd "\C-s") 'helm-occur)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(use-package company
  :ensure t)
(use-package helm-company
  :ensure t)
(setq company-tooltip-align-annotations t)
(setq company-tooltip-annotation-padding 1)
(setq company-tooltip-offset-display 'lines)
(setq company-tooltip-minimum 3)
(setq company-tooltip-margin 1)
(setq company-text-icons-add-background t)
(setq company-idle-delay 0
      company-tooltip-idle-delay 5
      company-require-match nil
      company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend-with-delay
        company-preview-frontend
        company-echo-metadata-frontend)
      company-backends '(company-capf))



;; lsp
(use-package helm-lsp
  :ensure t
  :requires helm)
(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
(use-package lsp-java
  :ensure t
  :hook ((java-mode . lsp)))
(use-package lsp-ui
  :ensure t
  :hook ((lsp-mode . lsp-ui)))

;; python
(use-package pyvenv
  :ensure t
  :config (setq pyvenv-workon ".venv")
  (pyvenv-tracking-mode 1))
(add-hook 'python-mode-hook (lambda() (lsp)))

;; c++
(use-package cmake-mode
  :ensure t)
(use-package conan
  :ensure t)
(use-package msvc
  :ensure t)
(add-hook 'c++-mode-hook
          (lambda()
            (lsp)
            (company-mode)))
(add-hook 'c-mode-hook
          (lambda()
            (lsp)
            (company-mode)))


(use-package rust-mode
  :ensure t)

;; gleam
(use-package tree-sitter
  :ensure t)
(use-package tree-sitter-indent
  :requires tree-sitter
  :ensure t)
(use-package gleam-mode
  :requires tree-sitter-indent
  :load-path "~/git/gleam-mode")

;; others
(use-package meson-mode
  :ensure t)
(use-package gradle-mode
  :ensure t)
(use-package elixir-mode
  :ensure t)
(use-package dockerfile-mode
  :ensure t)
(use-package markdown-preview-eww
  :ensure t)
(add-hook 'markdown-mode-hook
          (lambda () (markdown-preview-eww)))
(use-package yaml-mode
  :ensure t)

;; code style
(setq-default c-default-style "bsd")
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven))
 '(custom-safe-themes
   '("f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" default))
 '(package-selected-packages
   '(rust-mode gleam-mode company-nginx helm-tree-sitter tree-sitter-indent tree-sitter-langs ivy use-package helm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
