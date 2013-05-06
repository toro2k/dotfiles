(add-to-list 'load-path "~/.elisp")
(require 'toro-functions)
(require 'yaml-mode)
(require 'java-mode-indent-annotations)

(byte-recompile-directory "~/.elisp" 0)


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


;; autosave and backup
(setq-default backup-inhibited t)


;; modes settings
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

(add-to-list 'auto-mode-alist '("psql.edit" . sql-mode))
(add-to-list 'auto-mode-alist '("emacs" . lisp-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(setq-default ruby-insert-encoding-magic-comment nil)
(when (getenv "IXENIA")
  (progn
    (require 'smart-indent)
    (smart-tabs-advice ruby-indent-line ruby-indent-level)
    (setq ruby-indent-tabs-mode t)
    (add-hook 'ruby-mode-hook (lambda () (set-default 'tab-width 2)))))

(add-hook 'java-mode-hook 'java-mode-indent-annotations-setup)


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
      (set-cursor-color "#ffff00")
      (if (member "terminus" (font-family-list))
	  (set-face-attribute 'default nil :font "-*-terminus-bold-*-*-*-14-*-*-*-*-*-*-*"))))


;; misc
(setq-default parens-require-spaces nil)
(put 'narrow-to-region 'disabled nil)
