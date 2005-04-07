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

(keymap-global-unset "C-z")
(keymap-global-unset "s-z")
(keymap-global-unset "s-Z")
(keymap-global-unset "s-q")
(keymap-global-unset "s-0")
(keymap-global-unset "s--")
(keymap-global-unset "s-=")
(keymap-global-unset "M-{") ;; backward-paragraph
(keymap-global-unset "M-}") ;; forward-paragraph
(keymap-global-unset (my/select-leader "LEADER-k"))
(keymap-global-unset (my/select-leader "LEADER-j"))
(keymap-global-unset "C-x b")
(keymap-global-unset "C-M-<down-mouse-1>")
(keymap-global-unset "M-<mouse-1>")
(keymap-global-unset "M-<drag-mouse-1>")
(keymap-global-unset "M-m")
(keymap-global-unset "M-j")
(keymap-global-unset "s-<left>")
(keymap-global-unset "s-<right>")
(keymap-global-unset "s-l")


;;;; GENERAL
(keymap-global-set (my/select-leader "LEADER-f") #'toggle-frame-fullscreen)

(when my/is-mac
  (keymap-global-set "s-z" #'undo-fu-only-undo)
  (keymap-global-set "s-Z" #'undo-fu-only-redo)
  (keymap-global-set "s-q" #'ns-do-hide-emacs))

(when my/is-linux
  (keymap-global-set "C-z" #'undo-fu-only-undo)
  (keymap-global-set "C-Z" #'undo-fu-only-redo))

(keymap-global-set "C-=" #'text-scale-increase)
(keymap-global-set "C--" #'text-scale-decrease)
(keymap-global-set "C-0" #'text-scale-adjust)

(keymap-global-set (my/select-leader "LEADER-r") #'recentf)

(keymap-global-set "M-[" #'backward-paragraph)
(keymap-global-set "M-]" #'forward-paragraph)

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
;; :bind (;; C-c bindings in `mode-specific-map'
;;        ("C-c M-x" . consult-mode-command)
;;        ("C-c h" . consult-history)
;;        ("C-c k" . consult-kmacro)
;;        ("C-c m" . consult-man)
;;        ("C-c i" . consult-info)
;;        ([remap Info-search] . consult-info)
;;        ;; C-x bindings in `ctl-x-map'
;;        ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
;;        ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
;;        ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
;;        ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
;;        ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
;;        ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
;;        ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
;;        ;; Custom M-# bindings for fast register access
;;        ("M-#" . consult-register-load)
;;        ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
;;        ("C-M-#" . consult-register)
;;        ;; Other custom bindings
;;        ("M-y" . consult-yank-pop)                ;; orig. yank-pop
;;        ;; M-g bindings in `goto-map'
;;        ("M-g e" . consult-compile-error)
;;        ("M-g r" . consult-grep-match)
;;        ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
;;        ("M-g g" . consult-goto-line)             ;; orig. goto-line
;;        ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
;;        ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
;;        ("M-g m" . consult-mark)
;;        ("M-g k" . consult-global-mark)
;;        ("M-g i" . consult-imenu)
;;        ("M-g I" . consult-imenu-multi)
;;        ;; M-s bindings in `search-map'
;;        ("M-s d" . consult-find)                  ;; Alternative: consult-fd
;;        ("M-s c" . consult-locate)
;;        ("M-s g" . consult-grep)
;;        ("M-s G" . consult-git-grep)
;;        ("M-s r" . consult-ripgrep)
;;        ("M-s l" . consult-line)
;;        ("M-s L" . consult-line-multi)
;;        ("M-s k" . consult-keep-lines)
;;        ("M-s u" . consult-focus-lines)
;;        ;; Isearch integration
;;        ("M-s e" . consult-isearch-history)
;;        :map isearch-mode-map
;;        ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
;;        ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
;;        ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
;;        ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
;;        ;; Minibuffer history
;;        :map minibuffer-local-map
;;        ("M-s" . consult-history)                 ;; orig. next-matching-history-element
;;        ("M-r" . consult-history))                ;; orig. previous-matching-history-element


;;;; EDITING
(keymap-global-set "M-s-<down-mouse-1>" #'mouse-drag-region-rectangle)

(keymap-global-set "M-<down-mouse-1>" #'mc/add-cursor-on-click)
(keymap-global-set "M-m" #'mc/mark-all-dwim)

(keymap-global-set "M-j" #'join-line)

(keymap-global-set (my/select-leader "LEADER-<backspace>") #'my/nuke-line-backwards)

(keymap-global-set (my/select-leader "LEADER-h") #'my/move-bol-or-prev-eol)
(keymap-global-set (my/select-leader "LEADER-l") #'my/move-eol-or-next-bol)

(keymap-global-set "s-L" #'meow-line)
(keymap-global-set "s-;" #'meow-reverse)

(keymap-global-set "s-/" #'comment-line)

;;; keyboard.el ends here
