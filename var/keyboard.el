;;; keyboard.el --- keybindings -*- no-byte-compile: t; lexical-binding: t; -*-

(keymap-global-unset "C-M-<wheel-down>") ; mouse-wheel-global-text-scale
(keymap-global-unset "C-M-<wheel-up>") ; mouse-wheel-global-text-scale
(keymap-global-unset "C-<wheel-down>") ; mouse-wheel-text-scale
(keymap-global-unset "C-<wheel-up>") ; mouse-wheel-text-scale

(keymap-global-unset "M-l") ; downcase-word
(keymap-global-unset "M-u") ; upcase-word

;; Disable secondary selection mouse bindings
(keymap-global-unset "<mouse-2>") ;; middle mouse button secondary yank
(keymap-global-unset "M-<mouse-1>") ;; set secondary selection start
(keymap-global-unset "M-<mouse-3>") ;; set secondary selection end

(keymap-global-unset "<mouse-2>") ; upcase-word


;;; GENERAL
(keymap-global-set "C-s-f" #'toggle-frame-fullscreen)

(keymap-global-unset "s-q")
(keymap-global-set "s-q" #'ns-do-hide-emacs)

(keymap-global-set "C-=" #'text-scale-increase)
(keymap-global-set "C--" #'text-scale-decrease)
(keymap-global-set "C-0" #'text-scale-adjust)

(keymap-global-set "s-r" #'recentf)

(keymap-global-unset "s-0")
(keymap-global-unset "s--")
(keymap-global-unset "s-=")
(keymap-global-set "s-0" #'beginning-of-buffer)
(keymap-global-set "s-9" #'end-of-buffer)

(keymap-global-unset "M-{")
(keymap-global-unset "M-}")
(keymap-global-set "M-[" #'backward-paragraph)
(keymap-global-set "M-]" #'forward-paragraph)
(keymap-global-set "s-<up>" #'beginning-of-defun)
(keymap-global-set "s-<down>" #'end-of-defun)

(keymap-global-set "s-b" #'consult-buffer)
(keymap-global-unset "C-x b")
(keymap-global-set "C-x b" #'consult-buffer)

(keymap-global-unset "s-k") ;; was kill-current-buffer
(keymap-global-set "C-s-W" #'kill-buffer-and-window)
(keymap-global-set "C-s-k" #'kill-current-buffer)
(keymap-global-set "C-s-w" #'delete-window)

(keymap-global-set "C-s-," #'previous-buffer)
(keymap-global-set "C-s-." #'next-buffer)


;;; EDITING
(keymap-global-unset "C-M-<down-mouse-1>")
(keymap-global-set "M-s-<down-mouse-1>" #'mouse-drag-region-rectangle)

(defun my-delete-line-backwards ()
  (interactive)
  (cond
   ;; If at beginning of line, delete previous newline (join lines)
   ((= (point) (line-beginning-position))
    (delete-char -1))

   ;; Otherwise delete to beginning of line
   (t
    (delete-region (point) (line-beginning-position)))))

(keymap-global-set "s-<backspace>" #'my-delete-line-backwards)

(defun my-move-bol-or-prev-eol ()
  "Move to beginning of line, or to end of previous line if already at bol."
  (interactive)
  (if (bolp)
      (progn
        (forward-line -1)
        (end-of-line))
    (beginning-of-line)))

(defun my-move-eol-or-next-bol ()
  "Move to beginning of line, or to end of previous line if already at bol."
  (interactive)
  (if (eolp)
      (progn
        (forward-line 1)
        (beginning-of-line))
    (end-of-line)))

(keymap-global-unset "s-<left>")
(keymap-global-unset "s-<right>")
(keymap-global-set "s-<right>" #'my-move-eol-or-next-bol)
(keymap-global-set "s-<left>" #'my-move-bol-or-prev-eol)


(keymap-global-unset "s-l")
(keymap-global-set "s-l" #'meow-line)
(keymap-global-unset "s-j")
(keymap-global-set "s-;" #'meow-reverse)

(keymap-global-set "s-/" #'comment-line)
