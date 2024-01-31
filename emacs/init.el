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
(setq visible-bell nil
      ring-bell-function #'ignore)
(blink-cursor-mode 0)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)

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
  ;; ivy interface for standard commands
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "<f2> j") 'counsel-set-variable)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view)
  ;; ivy interface for shell and system tools
  (global-set-key (kbd "C-c c") 'counsel-compile)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c L") 'counsel-git-log)
  (global-set-key (kbd "C-c k") 'counsel-rg)
  (global-set-key (kbd "C-c m") 'counsel-linux-app)
  (global-set-key (kbd "C-c n") 'counsel-fzf)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-c J") 'counsel-file-jump)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (global-set-key (kbd "C-c w") 'counsel-wmctrl)
  ;; ivy-resume and other commands
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-c b") 'counsel-bookmark)
  (global-set-key (kbd "C-c d") 'counsel-descbinds)
  (global-set-key (kbd "C-c o") 'counsel-outline)
  (global-set-key (kbd "C-c t") 'counsel-load-theme)
  (global-set-key (kbd "C-c F") 'counsel-org-file)
  (ivy-mode 1))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package perspective
  :bind
  ("C-x C-b" . (lambda (arg)
                  (interactive "P")
                  (if (fboundp 'persp-ivy-switch-buffer)
                      (persp-ivy-switch-buffer arg)
                    (persp-ivy-switch-buffer "all"))))
  :custom
  (persp-mode-prefix-key (kbd "C-z"))
  :init
  (persp-mode))

(use-package vimrc-mode)
(use-package dockerfile-mode)
(use-package cmake-mode)

(defun dts-indent-hook()
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq tab-always-indent nil))

(use-package dts-mode
  :config
  (add-hook 'dts-mode-hook #'dts-indent-hook))
(use-package kconfig-mode)

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

(setq c-default-style "linux")

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-toggle-key "C-`")
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
