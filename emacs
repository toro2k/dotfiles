(load "~/.elisp/functions.el")

;; autosave and backup
(setq-default backup-inhibited t)


;; modes settings
(setq-default major-mode 'text-mode)
(add-hook 'text-mode 'auto-fill-mode)

(load "~/.elisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(load "~/.elisp/rinari/rinari.el")


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

(global-set-key (kbd "M-'") 'toro-insert-single-quotes)
(global-set-key (kbd "M-\"") 'toro-insert-double-quotes)
(global-set-key (kbd "M-[") 'toro-insert-brackets)
(global-set-key (kbd "M-{") 'toro-insert-braces)
