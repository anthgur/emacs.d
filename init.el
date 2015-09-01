(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(load-theme   'ample t t)
(load-theme   'ample-flat t t)
(load-theme   'ample-light t t)
(load-theme   'zenburn t t)
(enable-theme 'ample-flat)

(require 'helm)
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)

(require 'helm-projectile)
(projectile-global-mode t)
(helm-projectile-on)

(defun gsk (key fn)
  (global-set-key (kbd key) fn))

(gsk "C-S-d C-m C-m" 'discover-my-major)
(gsk "C-S-x C-f"     'helm-projectile-find-file)
(gsk "C-x p"         'projectile-switch-project)
; have to explicitly bind these for fuzzy matching
(gsk "C-S-x C-l"     'helm-locate)
(gsk "C-c C-s"       'helm-semantic-or-imenu)
(gsk "M-x"           'helm-M-x)
(gsk "M-)"           'sp-forward-slurp-sexp)
(gsk "M-]"           'sp-raise-sexp)
(gsk "C-x C-f"       'helm-find-files)
(gsk "C-x C-b"       'helm-buffers-list)

(require 'smartparens-config)

(require 'multiple-cursors)
(gsk "C-x C-l"     'mc/edit-lines)

(require 'undo-tree)
(global-undo-tree-mode 1)

(require 'powerline)
(powerline-default-theme)

(global-git-gutter-mode 1)
(global-company-mode 1)

;; smartparens
(smartparens-global-mode 1)
; prevent pairing of quote
(sp-pair "'" nil :actions :rem)

;; clojure hooks/config
(require 'clojure-mode)
(add-hook 'cider-hook-mode #'eldoc-mode)

      ; remove buffer clutter
(setq nrepl-hide-special-buffers t
      ; show the port associated with the repl connection
      nrepl-buffer-name-show-port t
      ; prevent file save prompt on `C-c C-k`
      cider-prompt-save-file-on-load nil)

(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

;; elisp hooks/config
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

;; prevent headaches
(setq visible-bell 1)

; prevent opening of graphic toolbar
(custom-set-variables '(tool-bar-mode nil))
