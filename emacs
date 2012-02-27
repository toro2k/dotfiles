(add-to-list 'load-path "~/.elisp/")
(load "functions.el")

;; autosave and backup
(setq-default backup-inhibited t)


;; modes settings
(setq-default major-mode 'text-mode)
(add-hook 'text-mode 'auto-fill-mode)

(load "~/.elisp/haskell-mode/haskell-site-file")


;; UI
(setq inhibit-startup-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode nil)

(if (toro-xwindow-p)
    (progn
      (scroll-bar-mode nil)
      (tool-bar-mode nil)
      (load "theme.el")
      ))


;; keys
(define-prefix-command 'toro-map)
(global-set-key (kbd "C-t") 'toro-map)

(global-set-key (kbd "C-t ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-t C-n") 'toro-mark-whole-line)
(global-set-key (kbd "C-t n") 'toro-mark-whole-line)


