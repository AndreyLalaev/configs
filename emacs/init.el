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

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

(use-package vimrc-mode)
(use-package magit)
(use-package git-gutter
  :config
  (global-git-gutter-mode +1))
(add-to-list 'auto-mode-alist '("\\.fragment\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("defconfig\\'" . conf-unix-mode))
