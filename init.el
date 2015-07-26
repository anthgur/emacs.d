(require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
(load-theme 'zenburn t t)
(enable-theme 'ample-flat)

(require 'helm)
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-M-x-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)

(require 'helm-projectile)
(projectile-global-mode t)
(helm-projectile-on)
(global-set-key (kbd "C-S-x C-f") 'helm-projectile-find-file)
(global-set-key (kbd "C-S-x C-b") 'projectile-switch-project)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(require 'undo-tree)
(global-undo-tree-mode 1)

(require 'powerline)
(powerline-default-theme)

(global-git-gutter-mode 1)
(global-company-mode 1)
(smartparens-global-mode 1)

;; clojure hooks/config
(add-hook 'cider-hook-mode #'eldoc-mode)
; remove buffer clutter
(setq nrepl-hide-special-buffers t)
; show the port associated with the repl connection
(setq nrepl-buffer-name-show-port t)
; prevent file save prompt on `C-c C-k`
(setq cider-prompt-save-file-on-load nil)

(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; elisp hooks/config
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

;; prevent headaches
(setq visible-bell 1)

; prevent opening of graphic toolbar
(custom-set-variables '(tool-bar-mode nil))
