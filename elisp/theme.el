(let ((black "#2E3436")
      (white "#EEEEEC")
      (dark-grey "#555753")
      (light-grey "#BABDB6")
      (green "#73d216")
      (red "#CC0000")
      (yellow "#FCE94F")
      (blue "#729FCF")
      (orange "#FCAF3E")
      (dark-orange "#CE5C00")
      (cyan "#34E2E2"))

  (set-face-attribute 'default nil :foreground white
		      :background black)
  (if (member "DejaVu Sans Mono" (font-family-list))
      (set-face-attribute 'default nil :font "DejaVu Sans Mono-10"))


  ;; UI faces
  (set-face-attribute 'cursor nil
		      :background yellow)
  (set-face-attribute 'mode-line nil
		      :foreground white
		      :background red
		      :box nil)
  (set-face-attribute 'mode-line-inactive nil
		      :foreground white
		      :background dark-grey
		      :box nil)
  (set-face-attribute 'minibuffer-prompt nil
		      :foreground blue)
  (set-face-attribute 'fringe nil
		      :background black)


  ;; general faces
  (set-face-attribute 'region nil
		      :foreground black
		      :background yellow)
  (set-face-attribute 'isearch nil
		      :foreground black
		      :background yellow)
  (set-face-attribute 'lazy-highlight nil
		      :foreground black
		      :background light-grey)

  ;; font-lock-faces
  (set-face-attribute 'font-lock-builtin-face nil
		      :foreground blue)
  (set-face-attribute 'font-lock-comment-delimiter-face nil)
  (set-face-attribute 'font-lock-comment-face nil
		      :foreground dark-orange
		      :slant 'italic)
  (set-face-attribute 'font-lock-constant-face nil)
  (set-face-attribute 'font-lock-doc-face nil)
  (set-face-attribute 'font-lock-function-name-face nil
		      :foreground blue)
  (set-face-attribute 'font-lock-keyword-face nil
		      :foreground cyan)
  (set-face-attribute 'font-lock-negation-char-face nil)
  (set-face-attribute 'font-lock-preprocessor-face nil)
  (set-face-attribute 'font-lock-regexp-grouping-backslash nil)
  (set-face-attribute 'font-lock-regexp-grouping-construct nil)
  (set-face-attribute 'font-lock-string-face nil
		      :foreground orange)
  (set-face-attribute 'font-lock-type-face nil
		      :foreground green)
  (set-face-attribute 'font-lock-variable-name-face nil
		      :foreground yellow)
  (set-face-attribute 'font-lock-warning-face nil))
