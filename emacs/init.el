(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; install "use-package" if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;; move autosave-files to /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(set-frame-font "Hack Nerd Font Mono-14" nil t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq column-number-mode t)
(global-display-fill-column-indicator-mode t)
(setq-default display-fill-column-indicator-column 79)

(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq ediff-keep-variants nil)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

(use-package counsel
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

(use-package vimrc-mode)
(use-package dockerfile-mode)
(use-package cmake-mode)
(use-package dts-mode)
(use-package systemd)

(use-package magit)
(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

(use-package bitbake)
(use-package buffer-move)

(use-package tree-sitter)
(use-package tree-sitter-langs)

(global-tree-sitter-mode)

(add-hook 'c-mode-hook #'tree-sitter-hl-mode)
(add-hook 'c++-mode-hook #'tree-sitter-hl-mode)
(add-hook 'sh-mode-hook #'tree-sitter-hl-mode)
(add-hook 'dockerfile-mode-hook #'tree-sitter-hl-mode)

(add-to-list 'auto-mode-alist '("\\.fragment\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("defconfig\\'" . conf-unix-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
