(defun toro-mark-whole-line ()
  (interactive)
  (progn 
    (beginning-of-line)
    (set-mark-command nil)
    (next-line)))

(defun toro-xwindow-p ()
  (string= "x" window-system))

