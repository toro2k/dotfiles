(defun toro-mark-whole-line ()
  (interactive)
	(beginning-of-line)
	(set-mark-command nil)
	(next-line))

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

(defun toro-squeeze-spaces ()
	(interactive)
	(delete-horizontal-space)
	(insert " "))

(defun toro-current-buffer-file-name ()
	(interactive)
	(let ((current-buffer-file-name
				 (buffer-file-name (current-buffer))))
		(if current-buffer-file-name
				(message current-buffer-file-name)
			(message "no file name"))))

(defun toro-create-etags (dir)
	(interactive "DDirectory: ")
	(shell-command
	 (format "ctags -f %s/TAGS -e -R %s &> /dev/null" dir dir)))

(provide 'toro-functions)