(defun toro-mark-whole-line ()
  (interactive)
  (progn 
    (beginning-of-line)
    (set-mark-command nil)
    (next-line)))


(defun toro-xwindow-p ()
  (string= "x" window-system))


(defun toro-insert-single-quotes ()
  (interactive)
  (insert-pair nil ?' ?'))

(defun toro-insert-double-quotes ()
  (interactive)
  (insert-pair nil ?" ?"))

(defun toro-insert-brackets ()
  (interactive)
  (insert-pair nil ?[ ?]))

(defun toro-insert-braces ()
  (interactive)
  (insert-pair nil ?{ ?}))
