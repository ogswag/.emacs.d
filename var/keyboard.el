;;; keyboard.el --- keybindings -*- no-byte-compile: t; lexical-binding: t; -*-

;;; CODE:

;;;; PLATFORM DETECTION
;; Define primary modifier for this OS
(defconst my/leader-key (if my/is-mac "s" "C-s"))  ;; Cmd on macOS, Ctrl+Alt on Linux
(defconst my/alt-key (if my/is-mac "M" "M"))

(defun my/select-leader (key)
  "Build a keybinding string with OS-aware leader KEY.
Example: (my/select-leader \"f\") → \"s-f\" on macOS, \"C-M-f\" on Linux"
  (replace-regexp-in-string "LEADER" my/leader-key key t))  ;; The 't' argument prevents function from capitalizing "s" to "S"

(require 'viper)

;;;; UNBINDS
(keymap-global-unset "C-M-<wheel-down>") ; mouse-wheel-global-text-scale
(keymap-global-unset "C-M-<wheel-up>")   ; mouse-wheel-global-text-scale
(keymap-global-unset "C-<wheel-down>")   ; mouse-wheel-text-scale
(keymap-global-unset "C-<wheel-up>")     ; mouse-wheel-text-scale
(keymap-global-unset "C-<mouse-5>")      ; mouse-wheel-text-scale down
(keymap-global-unset "C-<mouse-4>")      ; mouse-wheel-text-scale up
(keymap-global-unset "C-M-<mouse-5>")    ; mouse-wheel-global-text-scale down
(keymap-global-unset "C-M-<mouse-4>")    ; mouse-wheel-global-text-scale up

(keymap-global-unset "M-l")  ; downcase-word
(keymap-global-unset "M-u")  ; upcase-word
(keymap-global-unset "M-c")  ; capitalize-word

;; Disable secondary selection mouse bindings
(keymap-global-unset "<mouse-2>")   ; middle mouse button secondary yank
(keymap-global-unset "M-<mouse-1>") ; set secondary selection start
(keymap-global-unset "M-<mouse-3>") ; set secondary selection end

(keymap-global-unset "C-M-<down-mouse-1>")
(keymap-global-unset "C-s" t)
(keymap-global-unset "C-x b")
(keymap-global-unset "C-z")
(keymap-global-unset "M-<drag-mouse-1>")
(keymap-global-unset "M-<mouse-1>")
(keymap-global-unset "M-i" t)
(keymap-global-unset "M-j")
(keymap-global-unset "M-m")
(keymap-global-unset "M-o" t)
(keymap-global-unset "M-{") ; backward-paragraph
(keymap-global-unset "M-}") ; forward-paragraph
(keymap-global-unset "s--")
(keymap-global-unset "s-0")
(keymap-global-unset "s-<left>")
(keymap-global-unset "s-<right>")
(keymap-global-unset "s-=")
(keymap-global-unset "s-Z")
(keymap-global-unset "s-l")
(keymap-global-unset "s-q")
(keymap-global-unset "s-z")
(keymap-global-unset (my/select-leader "LEADER-j"))
(keymap-global-unset (my/select-leader "LEADER-k"))


;;;; GENERAL
(keymap-global-set (my/select-leader "LEADER-f") #'toggle-frame-fullscreen)

(when my/is-mac
  (keymap-global-set "s-z" #'undo-fu-only-undo)
  (keymap-global-set "s-Z" #'undo-fu-only-redo)
  (keymap-global-set "s-q" #'ns-do-hide-emacs))

(when my/is-linux
  (keymap-global-unset "C-z" t)
  (keymap-global-unset "C-Z" t)
  (keymap-global-set "C-z" #'undo-fu-only-undo)
  (keymap-global-set "C-r" #'undo-fu-only-redo))

(keymap-global-set "C-=" #'text-scale-increase)
(keymap-global-set "C--" #'text-scale-decrease)
(keymap-global-set "C-0" #'text-scale-adjust)

(keymap-global-set (my/select-leader "LEADER-r") #'recentf)

(keymap-global-set "M-[" #'backward-paragraph)
(keymap-global-set "M-]" #'forward-paragraph)
(keymap-global-unset "M-f")
(keymap-global-unset "M-b")
(keymap-global-unset "C-<left>")
(keymap-global-unset "C-<right>")
(keymap-global-unset "C-M-/")
(keymap-global-set "C-M-/")

(keymap-global-set "C-<left>" #'viper-backward-word)
(keymap-global-set "C-<right>" #'viper-forward-word)

(keymap-global-set (my/select-leader "LEADER-k") #'meow-beginning-of-thing)
;; (keymap-global-set (my/select-leader "LEADER-<down>") (lambda () (interactive) (meow-end-of-thing ?d))) ; <- this is for an immeadiate selection of THING
(keymap-global-set (my/select-leader "LEADER-j") #'meow-end-of-thing)
(my/select-leader "LEADER-j")
(keymap-global-set (my/select-leader "LEADER-b") #'consult-buffer)

(keymap-global-set "C-s-W" #'kill-buffer-and-window)
(keymap-global-set "C-s-k" #'kill-current-buffer)
(keymap-global-set "C-s-w" #'delete-window)

(keymap-global-set "C-s-," #'previous-buffer)
(keymap-global-set "C-s-." #'next-buffer)

(keymap-global-set "M-c l" #'consult-line)
(keymap-global-set "M-c i" #'consult-imenu)
(keymap-global-set "M-c o" #'consult-outline)

;;;; EDITING
(keymap-global-set "M-s-<down-mouse-1>" #'mouse-drag-region-rectangle)

(keymap-global-set "M-<down-mouse-1>" #'mc/add-cursor-on-click)
;; (keymap-global-unset "C-M-n" t)
(keymap-global-set "C-M-n" #'mc/mark-next-like-this)
(keymap-global-set "C-M-m" #'mc/mark-all-dwim)
(keymap-global-set "C-M-e" #'mc/edit-ends-of-lines)
(keymap-global-set "C-M-b" #'mc/edit-beginnings-of-lines)

(keymap-global-set "M-j" #'join-line)

(keymap-global-set (my/select-leader "LEADER-<backspace>") #'my/nuke-line-backwards)

(keymap-global-set (my/select-leader "LEADER-u") #'my/move-bol-or-prev-eol)
(keymap-global-set (my/select-leader "LEADER-o") #'my/move-eol-or-next-bol)

(keymap-global-set (my/select-leader "LEADER-l") #'meow-line)
(keymap-global-set (my/select-leader "LEADER-;") #'meow-reverse)

(keymap-global-set (my/select-leader "LEADER-/") #'comment-line)

(keymap-global-set "C-s" #'set-mark-command)

(keymap-global-set "C-M-'" #'my/mark-inside-quotes-seeking-visible)
(keymap-global-set "M-i [" #'er/mark-inside-pairs)
(keymap-global-set "M-i t" #'er/mark-inner-tag)
(keymap-global-set "M-i d" #'er/mark-defun)
(keymap-global-set "M-i p" #'er/mark-text-paragraph)

(keymap-global-set "M-o q" #'my/mark-outside-quotes-seeking-visible)
(keymap-global-set "M-o [" #'er/mark-outside-pairs)
(keymap-global-set "M-o t" #'er/mark-outer-tag)
(keymap-global-set "M-o d" #'er/mark-defun)
(keymap-global-set "M-o p" #'er/mark-text-paragraph)

(keymap-global-unset "M-<up>" t)
(keymap-global-unset "M-<left>" t)
(keymap-global-unset "M-<right>" t)
(keymap-global-unset "M-<down>" t)

(keymap-global-set "M-<up>" #'move-text-region-up)
(keymap-global-set "M-<down>" #'move-text-region-down)

(keymap-global-set "C-M-<up>" #'move-dup-duplicate-up)
(keymap-global-set "C-M-<down>" #'move-dup-duplicate-down)

(keymap-global-set "C-c c" #'compile)
(keymap-global-set "C-c r" #'recompile)
(keymap-global-set "C-c i" #'my/run-python-new-frame)

(keymap-global-set "C-c e b" #'eval-buffer)
(keymap-global-set "C-c e r" #'eval-region)

(keymap-global-set "M-1" #'shell-command)
(keymap-global-set "M-2" #'async-shell-command)
(keymap-global-set "M-3" #'my/open-curdir)

(keymap-global-set "C-," #'goto-last-change)
(keymap-global-set "C-<" #'goto-last-change-reverse)
(keymap-global-set "C-'" #'goto-last-point)

;;; keyboard.el ends here
