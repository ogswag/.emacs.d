;;; keyboard.el --- keybindings -*- no-byte-compile: t; lexical-binding: t; -*-

;;; CODE:

;;;; PLATFORM DETECTION
;; Define primary modifier for this OS
(defconst my/leader-key (if my/is-mac "s" "C-M"))  ;; Cmd on macOS, Ctrl+Alt on Linux
(defconst my/alt-key (if my/is-mac "M" "M"))

(defun my/select-leader (key)
  "Build a keybinding string with OS-aware leader KEY.
Example: (my/select-leader \"f\") → \"s-f\" on macOS, \"C-M-f\" on Linux"
  (replace-regexp-in-string "LEADER" my/leader-key key t))  ;; The 't' argument prevents function from capitalizing "s" to "S"

;;;; UNBINDS
(keymap-global-unset "C-M-<wheel-down>") ; mouse-wheel-global-text-scale
(keymap-global-unset "C-M-<wheel-up>") ; mouse-wheel-global-text-scale
(keymap-global-unset "C-<wheel-down>") ; mouse-wheel-text-scale
(keymap-global-unset "C-<wheel-up>") ; mouse-wheel-text-scale
(keymap-global-unset "C-<mouse-5>")   ;; mouse-wheel-text-scale down
(keymap-global-unset "C-<mouse-4>")   ;; mouse-wheel-text-scale up
(keymap-global-unset "C-M-<mouse-5>") ;; mouse-wheel-global-text-scale down
(keymap-global-unset "C-M-<mouse-4>") ;; mouse-wheel-global-text-scale up

(keymap-global-unset "M-l")  ;; downcase-word
(keymap-global-unset "M-u")  ;; upcase-word
(keymap-global-unset "M-c")  ;; capitalize-word

;; Disable secondary selection mouse bindings
(keymap-global-unset "<mouse-2>") ;; middle mouse button secondary yank
(keymap-global-unset "M-<mouse-1>") ;; set secondary selection start
(keymap-global-unset "M-<mouse-3>") ;; set secondary selection end

;;;; GENERAL
(keymap-global-set (my/select-leader "LEADER-f") #'toggle-frame-fullscreen)

(keymap-global-unset "s-q")
(keymap-global-set "s-q" #'ns-do-hide-emacs)

(keymap-global-set "C-=" #'text-scale-increase)
(keymap-global-set "C--" #'text-scale-decrease)
(keymap-global-set "C-0" #'text-scale-adjust)

(keymap-global-set (my/select-leader "LEADER-r") #'recentf)

(keymap-global-unset "s-0")
(keymap-global-unset "s--")
(keymap-global-unset "s-=")
(when my/is-mac
  (keymap-global-set "s-0" #'beginning-of-buffer)
  (keymap-global-set "s-9" #'end-of-buffer))

(when my/is-linux
  (keymap-global-set "C-<home>" #'beginning-of-buffer)
  (keymap-global-set "C-<end>" #'end-of-buffer))

(keymap-global-unset "M-{") ;; backward-paragraph
(keymap-global-unset "M-}") ;; forward-paragraph
(keymap-global-set "M-[" #'backward-paragraph)
(keymap-global-set "M-]" #'forward-paragraph)

(keymap-global-unset (my/select-leader "LEADER-k"))
(keymap-global-unset (my/select-leader "LEADER-j"))
(keymap-global-set (my/select-leader "LEADER-k") #'meow-beginning-of-thing)
;; (keymap-global-set (my/select-leader "LEADER-<down>") (lambda () (interactive) (meow-end-of-thing ?d))) ; <- this is for an immeadiate selection of THING
(keymap-global-set (my/select-leader "LEADER-j") #'meow-end-of-thing)
(my/select-leader "LEADER-j")
(keymap-global-set (my/select-leader "LEADER-b") #'consult-buffer)
(keymap-global-unset "C-x b")
(use-package consult
  :ensure nil
  :bind (;; C-c bindings in `mode-specific-map'
         ("M-c M-x" . consult-mode-command)
         ("M-c h" . consult-history)
         ("M-c k" . consult-kmacro)
         ("M-c m" . consult-man)
         ("M-c i" . consult-info)
         ("M-c r" . consult-recent-file)
         ("M-c b" . consult-buffer)
         ("M-c l" . consult-line)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)
         ("C-x b" . consult-buffer)
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o" . consult-outline)
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)
         ("M-s e" . consult-isearch-history)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)
         ("M-r" . consult-history)))

(keymap-global-set "C-s-W" #'kill-buffer-and-window)
(keymap-global-set "C-s-k" #'kill-current-buffer)
(keymap-global-set "C-s-w" #'delete-window)

(keymap-global-set "C-s-," #'previous-buffer)
(keymap-global-set "C-s-." #'next-buffer)


;;;; EDITING
(keymap-global-unset "C-M-<down-mouse-1>")
(keymap-global-set "M-s-<down-mouse-1>" #'mouse-drag-region-rectangle)

(keymap-global-unset "M-<mouse-1>")
(keymap-global-unset "M-<drag-mouse-1>")
(keymap-global-set "M-<down-mouse-1>" #'mc/add-cursor-on-click)
(keymap-global-unset "M-m")
(keymap-global-set "M-m" #'mc/mark-all-dwim)

(keymap-global-unset "M-j")
(keymap-global-set "M-j" #'join-line)

(defun my/nuke-line-backwards ()
  "Nuke, as in delete without saving to register, line backwards."
  (interactive)
  (cond
   ;; If at beginning of line, delete previous newline (join lines)
   ((= (point) (line-beginning-position))
    (delete-char -1))

   ;; Otherwise delete to beginning of line
   (t
    (delete-region (point) (line-beginning-position)))))

(keymap-global-set "s-<backspace>" #'my/nuke-line-backwards)

(defun my/move-bol-or-prev-eol ()
  "Move to beginning of line, or to end of previous line if already at bol."
  (interactive)
  (if (bolp)
      (progn
        (forward-line -1)
        (end-of-line))
    (beginning-of-line)))

(defun my/move-eol-or-next-bol ()
  "Move to beginning of line, or to end of previous line if already at bol."
  (interactive)
  (if (eolp)
      (progn
        (forward-line 1)
        (beginning-of-line))
    (end-of-line)))

(keymap-global-unset "s-<left>")
(keymap-global-unset "s-<right>")
(keymap-global-set "s-<right>" #'my/move-eol-or-next-bol)
(keymap-global-set "s-<left>" #'my/move-bol-or-prev-eol)

(keymap-global-unset "s-l")
(keymap-global-set "s-l" #'meow-line)
(keymap-global-set "s-;" #'meow-reverse)

(keymap-global-set "s-/" #'comment-line)

;;; keyboard.el ends here
