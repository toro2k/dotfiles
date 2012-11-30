(add-to-list 'load-path "~/.elisp")
(require 'toro-functions)

;; autosave and backup
(setq-default backup-inhibited t)


;; smart tabs
(require 'smart-indent)
(smart-tabs-advice ruby-indent-line ruby-indent-level)
(setq ruby-indent-tabs-mode t)


;; modes settings
(setq-default major-mode 'text-mode)
(add-hook 'text-mode 'auto-fill-mode)

(setq ruby-indent-tabs-mode t)
(setq-default ruby-insert-encoding-magic-comment nil)

(load "~/.elisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(require 'java-mode-indent-annotations)
(add-hook 'java-mode-hook 'java-mode-indent-annotations-setup)

(add-to-list 'auto-mode-alist '("psql.edit" . sql-mode))


;; hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; UI
(setq inhibit-startup-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode nil)

(if (toro-xwindow-p)
    (progn
      (scroll-bar-mode nil)
      (tool-bar-mode nil)
      (load "~/.elisp/theme.el")
      ))


;; keys
(define-prefix-command 'toro-map)
(global-set-key (kbd "C-t") 'toro-map)

(global-set-key (kbd "C-t ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-t C-n") 'toro-mark-whole-line)
(global-set-key (kbd "C-t n") 'toro-mark-whole-line)
(global-set-key (kbd "C-t \\") 'toro-squeeze-spaces)

(global-set-key (kbd "M-'") 'toro-insert-single-quotes)
(global-set-key (kbd "M-\"") 'toro-insert-double-quotes)
(global-set-key (kbd "M-[") 'toro-insert-brackets)
(global-set-key (kbd "M-{") 'toro-insert-braces)


;; misc
(setq-default parens-require-spaces nil)
(put 'narrow-to-region 'disabled nil)

(setq-default tab-width 2)
