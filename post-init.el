;;; Post-init.el --- Post-Init -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(load custom-file 'noerror 'no-message)

;;; Emacs System Options and Packages
;;;; General System Options and Packages

(setq-default use-package-enable-imenu-support t)

;; Only use exec-path-from-shell on macOS
(use-package exec-path-from-shell
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; Optimization: Native Compilation
(use-package compile-angel
  :demand t
  :ensure t
  :custom
  (compile-angel-verbose nil)

  :config
  (push "/init.el" compile-angel-excluded-files)
  (push "/early-init.el" compile-angel-excluded-files)
  (push "/pre-init.el" compile-angel-excluded-files)
  (push "/post-init.el" compile-angel-excluded-files)
  (push "/pre-early-init.el" compile-angel-excluded-files)
  (push "/post-early-init.el" compile-angel-excluded-files)

  ;; A local mode that compiles .el files whenever the user saves them.
  ;; (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode)

  ;; A global mode that compiles .el files prior to loading them via `load' or
  ;; `require'. Additionally, it compiles all packages that were loaded before
  ;; the mode `compile-angel-on-load-mode' was activated.
  (compile-angel-on-load-mode t)
  )

(use-package rainbow-mode
  :ensure t)

(use-package golden-ratio
  :ensure t
  :custom
  (golden-ratio-auto-scale t)
  :config (golden-ratio-mode t))

;;;;; Language input config
(setq-default default-input-method 'russian-computer)
(use-package reverse-im
  :ensure t
  :demand t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t)
  ;; On Linux with Fcitx/IBus, also configure native input method
  (when (eq system-type 'gnu/linux)
    ;; Try to use IBus if available
    (if-let* ((ibus-method (getenv "IBUS_ADDRESS")))
        (message "IBus detected, using native input method")
      ;; Fall back to reverse-im
      (message "Using reverse-im for Russian input"))))

(use-package visual-line-mode
  :ensure nil
  :hook (LaTeX-mode latex-mode tex-mode eshell-mode text-mode helpful-mode help-mode))

(global-visual-wrap-prefix-mode t)
(global-goto-address-mode t)

(unless (and (eq window-system 'mac)
             (bound-and-true-p mac-carbon-version-string))
  ;; Disable creation of new frames for files opened from Finder
  (setq ns-pop-up-frames nil)
  (setq pixel-scroll-precision-use-momentum nil) ; Precise/smoother scrolling
  (pixel-scroll-precision-mode 1))

;; On Linux, be more conservative with frame creation
(when (eq system-type 'gnu/linux)
  ;; Prefer splitting existing windows over creating new frames
  (setq pop-up-frames nil)
  (setq pop-up-windows t))

(when (and (not (eq system-type 'darwin))
           (fboundp 'pixel-scroll-precision-mode))
  ;; On Linux/Windows, use less aggressive scrolling
  (pixel-scroll-precision-mode 0))

(scroll-bar-mode t)

;; Allow Emacs to upgrade built-in packages, such as Org mode
(setq package-install-upgrade-built-in t)

;; When Delete Selection mode is enabled, typed text replaces the selection
;; if the selection is active.
(delete-selection-mode 1)

;; When tooltip-mode is enabled, certain UI elements (e.g., help text,
;; mouse-hover hints) will appear as native system tooltips (pop-up windows),
;; rather than as echo area messages. This is useful in graphical Emacs sessions
;; where tooltips can appear near the cursor.
;; Adjust tooltip delays based on platform (macOS has better rendering)
(setq tooltip-hide-delay 20)
(cond
 ((eq system-type 'darwin)
  ;; macOS: Can use tighter delays due to better font rendering
  (setq tooltip-delay 0.4)
  (setq tooltip-short-delay 0.08))
 ((eq system-type 'gnu/linux)
  ;; Linux: Use slightly longer delays for readability
  (setq tooltip-delay 0.6)
  (setq tooltip-short-delay 0.12))
 (t
  ;; Windows: Even longer delays
  (setq tooltip-delay 0.8)
  (setq tooltip-short-delay 0.15)))
(tooltip-mode 1)

(setq-default cursor-type 'bar)

(context-menu-mode t)

(use-package which-key
  :ensure nil ; already builtin
  :commands which-key-mode
  :hook (after-init . which-key-mode)
  :custom
  (which-key-idle-delay 1.5)
  (which-key-idle-secondary-delay 0.25)
  (which-key-add-column-padding 1)
  (which-key-max-description-length 40))

;; Helpful is an alternative to the built-in Emacs help that provides much more
;; contextual information.
(use-package helpful
  :ensure t
  :commands (helpful-callable
             helpful-variable
             helpful-key
             helpful-command
             helpful-at-point
             helpful-function)
  :bind
  ([remap describe-command] . helpful-command)
  ([remap describe-function] . helpful-callable)
  ([remap describe-key] . helpful-key)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  :custom
  (helpful-max-buffers 7))

;;;; Emacs Window and Frame Options
;; Track changes in the window configuration, allowing undoing actions such as
;; closing windows.
(add-hook 'after-init-hook #'winner-mode)

(window-divider-mode 0)
(setq-default window-divider-default-bottom-width 0)

(setq frame-resize-pixelwise t)
(setq window-resize-pixelwise t)

;;;; Emacs Buffers Options
(use-package uniquify
  :ensure nil
  :custom
  (uniquify-buffer-name-style 'reverse)
  (uniquify-separator "•")
  (uniquify-after-kill-buffer-p t))

;; Enables visual indication of minibuffer recursion depth after initialization.
(add-hook 'after-init-hook #'minibuffer-depth-indicate-mode)

;;;; Dired
;; Constrain vertical cursor movement to lines within the buffer
(setq dired-movement-style 'bounded-files)

;; Dired buffers: Automatically hide file details (permissions, size,
;; modification date, etc.) and all the files in the `dired-omit-files' regular
;; expression for a cleaner display.
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;; Hide files from dired
(setq dired-omit-files
      (rx (or
           ;; 1. Current (.) and parent (..) directories
           (seq bos "." eos)
           (seq bos ".." eos)

           ;; 2. File extensions (compiled files, swap files, etc.)
           (seq "." (or "elc" "a" "o" "pyc" "pyo" "swp" "class") eos)

           ;; 3. Metadata files
           (seq (opt ".js") ".meta" eos)
           (seq bos ".DS_Store" eos)
           (seq bos ".project" (opt "ile") eos)

           ;; 4. Version control and cache directories
           (seq bos "." (or "svn" "git") eos)
           (seq bos ".ccls-cache" eos)
           (seq bos "__pycache__" eos)

           ;; 5. Temporary check files (Flycheck/Flymake)
           (seq bos "flycheck_")
           (seq bos "flymake_"))))
(add-hook 'dired-mode-hook #'dired-omit-mode)

;; dired: Group directories first
(defun my/setup-dired-listing ()
  "Configure Dired with OS-appropriate ls options."
  (with-eval-after-load 'dired
    (let ((args "--group-directories-first -ahlv"))
      (cond
       ;; macOS: Try to use GNU ls (gls from homebrew)
       ((eq system-type 'darwin)
        (if-let* ((gls (executable-find "gls")))
            (setq insert-directory-program gls)
          ;; Fall back to BSD ls if gls not available
          (setq args nil)))

       ;; Linux: Use native ls which is GNU ls by default
       ((eq system-type 'gnu/linux)
        ;; args is already correct for GNU ls
        )

       ;; Windows: Use different args for ls from Git Bash or similar
       ((eq system-type 'windows-nt)
        ;; Windows ls might not support all flags
        (setq args "-ahlv")))

      ;; Apply the listing switches if they were set
      (when args
        (setq dired-listing-switches args)))))

(add-hook 'after-init-hook #'my/setup-dired-listing)

;;;; EShell

;; (use-package pcmpl-args
;; :ensure t)

;; Only load macOS-specific package managers on macOS
(when (eq system-type 'darwin)
  (use-package pcmpl-homebrew
    :ensure t))

;; Linux-specific completions (apt, pacman, etc.)
(when (eq system-type 'gnu/linux)
  ;; For Debian/Ubuntu systems
  (when (or (file-exists-p "/etc/debian_version")
            (file-exists-p "/etc/ubuntu_version"))
    (use-package pcmpl-apt
      :ensure t
      :if (fboundp 'pcomplete/apt)))

  ;; For Arch/Manjaro systems
  (when (file-exists-p "/etc/arch-release")
    (use-package pcmpl-pacman
      :ensure t
      :if (fboundp 'pcomplete/pacman))))

(use-package pcmpl-pip
  :ensure t)

(use-package eshell-syntax-highlighting
  :after eshell-mode
  :ensure t ;; Install if not already installed.
  :config
  ;; Enable in all Eshell buffers.
  (eshell-syntax-highlighting-global-mode +1))

;;;; Magit

(use-package magit
  :ensure t)

;;;; Org Mode
(setq-default org-babel-load-languages '((emacs-lisp . t)
                                         (C, D, C++, and cpp . t)))

(load (expand-file-name "org.el" user-emacs-directory) t t)

;;; Emacs Appearance
;; Paren match highlighting
(add-hook 'after-init-hook #'show-paren-mode)

;;;; Set default font
(cond
 ((eq system-type 'windows-nt)
  (when (member "Consolas" (font-family-list))
    (set-frame-font "Consolas" t t)))
 ((eq system-type 'darwin) ; macOS
  (when (member "Menlo" (font-family-list))
    (set-frame-font "Menlo 14" t t)
    (set-face-attribute 'fixed-pitch nil :family "Menlo")
    (set-face-attribute 'variable-pitch nil :family "Helvetica Neue")))
 ((eq system-type 'gnu/linux)
  (when (member "DejaVu Sans Mono" (font-family-list))
    (set-frame-font "DejaVu Sans Mono 12" t t)
    (set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono")
    (set-face-attribute 'variable-pitch nil :family "Noto Sans"))))

;;;; Set Font for Unicode Symbols
;; Symbols here mean unicode characters that are math ∫ , tech symbols ⌘ , or dingbats ☭ , but excluding emoji.
;; (set-fontset-font
;;  t
;;  'symbol
;;  (cond
;;   ((eq system-type 'windows-nt)
;;    (cond
;;     ((member "Segoe UI Symbol" (font-family-list)) "Segoe UI Symbol")))
;;   ((eq system-type 'darwin)
;;    (cond
;;     ((member "IBM Plex Math" (font-family-list)) "IBM Plex Math")))
;;   ((eq system-type 'gnu/linux)
;;    (cond
;;     ((member "Symbola" (font-family-list)) "Symbola")))))

;;;; Set font for emoji
(progn

  ;; if before emacs 28, this should come after setting symbols, because emacs
  ;; 28 now has 'emoji . before, emoji is part of 'symbol
  (set-fontset-font
   t
   (if (< emacs-major-version 28)
       '(#x1f300 . #x1fad0)
     'emoji
     )
   (cond
    ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")
    ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
    ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
    ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
    ((member "Symbola" (font-family-list)) "Symbola"))))


;;;; Themes
(setq-default custom-safe-themes t)

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  (treesit-auto-langs '(awk bash bibtex blueprint c-sharp clojure cmake commonlisp css
                            dart dockerfile elixir glsl go gomod heex html janet java
                            javascript json julia kotlin latex lua magik make markdown nix
                            nu org perl proto python r ruby rust scala sql surface toml
                            tsx typescript typst verilog vhdl vue wast wat wgsl yaml))
  :config
  (global-treesit-auto-mode))

(require 'treesit)

(setq treesit-language-source-alist
      '((markdown
         "https://github.com/tree-sitter-grammars/tree-sitter-markdown"
         "split_parser"
         "tree-sitter-markdown/src")
        (markdown_inline
         "https://github.com/tree-sitter-grammars/tree-sitter-markdown"
         "split_parser"
         "tree-sitter-markdown-inline/src")))

;; (dolist (lang '(markdown markdown_inline))
;;   (unless (treesit-language-available-p lang)
;;     (treesit-install-language-grammar lang)))
;;
;; Set the maximum level of syntax highlighting for Tree-sitter modes
(setq treesit-font-lock-level 4)
;;
;; (defun my/disable-treesit-indent ()
;;   "Disable Tree-sitter indentation, fall back to smie or cc-mode."
;;   (setq-local indent-line-function #'prog-indentation-contextual)
;;   (setq-local indent-region-function nil))  ; Or #'indent-region if preferred
;;
;; (add-hook 'c-ts-mode-hook #'my/disable-treesit-indent)
;; (add-hook 'c++-ts-mode-hook #'my/disable-treesit-indent)
;; (add-hook 'prog-mode-hook #'my/disable-treesit-indent)


(use-package leuven-theme
  :ensure t)

(use-package modus-themes
  :ensure t)

(setq-default modus-themes-headings
              (quote ((0 . (bold 1.5))
                      (1 . (bold 1.5))
                      (2 . (bold 1.4))
                      (3 . (bold 1.3))
                      (4 . (bold 1.2))
                      (5 . (bold 1.1))
                      (6 . (bold 1.0))
                      (7 . (bold 1.0))
                      (8 . (bold 1.0)))))

(setq modus-vivendi-palette-user
      '((apricot "#FF9752")
        (jeans "#6181B8")))

(setq-default modus-vivendi-palette-overrides
              '((      fg-heading-1 blue-warmer)
                (      bg-heading-1 bg-blue-nuanced)
                (overline-heading-1 blue)
                (      fg-heading-2 cyan-faint)
                (      bg-heading-2 bg-cyan-nuanced)
                (overline-heading-2 cyan-faint)
                (      fg-heading-3 fg-sage)
                (      bg-heading-3 bg-sage)
                (overline-heading-3 fg-sage)
                (      fg-heading-4 green-faint)
                (      bg-heading-4 bg-green-nuanced)
                (overline-heading-4 green-faint)
                (      fg-heading-5 magenta-cooler)
                (      bg-heading-5 bg-magenta-nuanced)
                (overline-heading-5 magenta-cooler)
                (      fg-heading-6 red)
                (      bg-heading-6 bg-red-nuanced)
                (overline-heading-6 red)
                (      fg-heading-7 rust)
                (      bg-heading-7 bg-changed-faint)
                (overline-heading-7 rust)
                (      fg-heading-8 yellow)
                (      bg-heading-8 bg-yellow-nuanced)
                (overline-heading-8 yellow)
                (fringe unspecified)
                (fg-line-number-inactive "gray50")
                (fg-line-number-active fg-main)
                (bg-line-number-inactive unspecified)
                (bg-line-number-active unspecified)
                (bg-prose-block-contents bg-diff-context)
                (bg-prose-block-delimiter bg-tab-bar)
                (fg-prose-block-delimiter "gray80")
                (cursor red)
                (preprocessor fg-ochre)
                (keyword blue-faint)
                (type blue-faint)
                (fnname fg-ochre)
                (fnname-call fg-ochre)
                (number cyan-cooler)
                (variable fg-main)
                (variable-use fg-main)
                (property fg-main)
                (operator apricot)
                (string olive)
                )
              )

(setq modus-operandi-palette-user
      '((apricot "#C85100")
        (sea "#1E417C")))

(setq-default modus-operandi-palette-overrides
              '((      fg-heading-1 blue-warmer)
                (      fg-heading-2 cyan-faint)
                (      fg-heading-3 fg-sage)
                (      fg-heading-4 green-faint)
                (      fg-heading-5 magenta-cooler)
                (      fg-heading-6 red)
                (      fg-heading-7 rust)
                (      fg-heading-8 yellow)
                (bg-main "#E6E8E3")
                (bg-active "#CDD1C8")
                (bg-mode-line-active bg-active)
                (bg-completion "#CDDFB4")
                (fringe unspecified)
                (fg-line-number-inactive "gray50")
                (fg-line-number-active fg-main)
                (bg-line-number-inactive unspecified)
                (bg-line-number-active unspecified)
                (bg-prose-block-contents bg-diff-context)
                (bg-prose-block-delimiter bg-tab-bar)
                (fg-prose-block-delimiter "gray22")
                (cursor red)
                (preprocessor yellow)
                (keyword sea)
                (type sea)
                (fnname yellow)
                (fnname-call yellow)
                (number cyan-intense)
                (variable fg-main)
                (variable-use fg-main)
                (property fg-main)
                (operator apricot)
                (string green-intense)))

(setq modus-themes-italic-constructs nil
      modus-themes-bold-constructs t)

(setq calendar-latitude 55.75     ; Moscow
      calendar-longitude 37.62)

;; (defun my/fix-org-block-extend (&rest _args)
;;   "Disable :extend for org-block lines to prevent full-width background."
;;   (dolist (face '(org-block-begin-line org-block-end-line))
;;     (when (facep face)
;;       (set-face-attribute face nil :extend nil))))
;;
;; ;; 1. Apply it immediately (in case a theme is already loaded)
;; (my/fix-org-block-extend)
;;
;; ;; 2. Apply it whenever a new theme is enabled (Emacs 29+)
;; (add-hook 'circadian-after-load-theme-hook #'my/fix-org-block-extend)
;;
;;
;; ;; Install circadian from ELPA
;; (use-package circadian
;;   :ensure t
;;   :config
;;   (setq circadian-themes
;;         '((:sunrise . modus-operandi)
;;           (:sunset  . moe-dark)))
;;   (circadian-setup))

(defun my/set-theme-by-time ()
  "Load a light theme between 6:00 and 18:00, and a dark theme otherwise."
  (interactive)
  (let* ((hour (string-to-number (format-time-string "%H")))
         (light-theme 'tango)       ; Replace with your preferred light theme
         (dark-theme  'moe-dark)     ; Replace with your preferred dark theme
         (now-light?  (and (>= hour 6) (< hour 18)))
         (target-theme (if now-light? light-theme dark-theme)))

    ;; Only reload if the target theme isn't already the top active one
    (unless (eq (car custom-enabled-themes) target-theme)
      ;; Disable all currently active themes to ensure a clean switch
      (mapc #'disable-theme custom-enabled-themes)
      (load-theme target-theme t)
      (message "Switched to %s theme" target-theme))))

;; Run the check every 3600 seconds (1 hour)
(run-at-time nil 3600 #'my/set-theme-by-time)

(use-package beacon
  :ensure t
  :config (beacon-mode t))

;;;; Line numbers
;; Display the current line and column numbers in the mode line
(setq line-number-mode t)
(setq column-number-mode t)
(setq mode-line-position-column-line-format '("%l:%C"))

;; Display of line numbers in the buffer:
;; (setq-default display-line-numbers-type 'relative)
(dolist (hook '(prog-mode-hook text-mode-hook))
  (add-hook hook #'display-line-numbers-mode))
(setq-default display-line-numbers-grow-only t)
(setq-default display-line-numbers-width-start t)

;;; Text editing options and packages

;;;; General text editing packages and config
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'LaTeX-mode-hook
          (lambda () (setq-local show-trailing-whitespace t)))
(add-hook 'text-mode-hook
          (lambda () (setq-local show-trailing-whitespace t)))
(add-hook 'prog-mode-hook
          (lambda () (setq-local show-trailing-whitespace t)))

(use-package expand-region
  :ensure t)

(use-package change-inner
  :ensure t)

(use-package goto-chg
  :ensure t)

(use-package goto-last-point
  :ensure t
  :config (goto-last-point-mode))

(use-package move-dup
  :ensure t)

(use-package surround
  :ensure t
  :bind-keymap ("M-'" . surround-keymap))

(use-package diff-hl
  :ensure t)

(use-package electric-pair-local-mode
  :ensure nil
  :hook (LaTeX-mode-hook text-mode-hook prog-mode-hook))

(use-package titlecase
  :ensure t)

(keymap-global-set "M-t" #'titlecase-dwim)

(use-package multiple-cursors
  :ensure t)

;; Whitespace color corrections.
(require 'color)
(let* ((ws-lighten 50) ;; Amount in percentage to lighten up black.
       (ws-color (color-lighten-name "#000000" ws-lighten)))
  (custom-set-faces
   `(whitespace-newline                ((t (:foreground ,ws-color))))
   `(whitespace-missing-newline-at-eof ((t (:foreground ,ws-color))))
   `(whitespace-space                  ((t (:foreground ,ws-color))))
   `(whitespace-space-after-tab        ((t (:foreground ,ws-color))))
   `(whitespace-space-before-tab       ((t (:foreground ,ws-color))))
   `(whitespace-tab                    ((t (:foreground ,ws-color))))
   `(whitespace-trailing               ((t (:foreground ,ws-color))))))

;; Make these characters represent whitespace.
(setq-default whitespace-display-mappings
              '(
                ;; space -> · else .
                (space-mark 32 [183] [46])
                ;; new line -> ¬ else $
                (newline-mark ?\n [172 ?\n] [36 ?\n])
                ;; carriage return (Windows) -> ¶ else #
                (newline-mark ?\r [182] [35])
                ;; tabs -> » else >
                (tab-mark ?\t [187 ?\t] [62 ?\t])))

(global-subword-mode t)

;; Simple comment-based outline folding for Emacs
(use-package outli
  :ensure t
  ;; :after lispy ; uncomment only if you use lispy; it also sets speed keys on headers!
  :bind (:map outli-mode-map ; convenience key to get back to containing heading
	          ("C-c C-p" . (lambda () (interactive) (outline-back-to-heading))))
  :hook ((prog-mode text-mode) . outli-mode)) ; or whichever modes you prefer

;; Auto-revert in Emacs is a feature that automatically updates the
;; contents of a buffer to reflect changes made to the underlying file
;; on disk.
(use-package autorevert
  :ensure nil
  :commands (auto-revert-mode global-auto-revert-mode)
  :hook
  (after-init . global-auto-revert-mode)
  :custom
  (auto-revert-interval 3)
  (auto-revert-remote-files nil)
  (auto-revert-use-notify t)
  (auto-revert-avoid-polling nil)
  (auto-revert-verbose t))

;; Recentf is an Emacs package that maintains a list of recently
;; accessed files, making it easier to reopen files you have worked on
;; recently.
(use-package recentf
  :ensure nil
  :commands (recentf-mode recentf-cleanup)
  :hook
  (after-init . recentf-mode)

  :custom
  (recentf-auto-cleanup 'mode)
  (recentf-exclude
   (list "\\.tar$" "\\.tbz2$" "\\.tbz$" "\\.tgz$" "\\.bz2$"
         "\\.bz$" "\\.gz$" "\\.gzip$" "\\.xz$" "\\.zip$"
         "\\.7z$" "\\.rar$"
         "COMMIT_EDITMSG\\'"
         "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
         "-autoloads\\.el$" "autoload\\.el$"))

  :config
  ;; A cleanup depth of -90 ensures that `recentf-cleanup' runs before
  ;; `recentf-save-list', allowing stale entries to be removed before the list
  ;; is saved by `recentf-save-list', which is automatically added to
  ;; `kill-emacs-hook' by `recentf-mode'.
  (add-hook 'kill-emacs-hook #'recentf-cleanup -90))

;; savehist is an Emacs feature that preserves the minibuffer history between
;; sessions. It saves the history of inputs in the minibuffer, such as commands,
;; search strings, and other prompts, to a file. This allows users to retain
;; their minibuffer history across Emacs restarts.
(use-package savehist
  :ensure nil
  :commands (savehist-mode savehist-save)
  :hook
  (after-init . savehist-mode)
  :custom
  (savehist-autosave-interval 300)
  (savehist-additional-variables
   '(kill-ring                        ; clipboard
     register-alist                   ; macros
     mark-ring global-mark-ring       ; marks
     search-ring regexp-search-ring)))

;; save-place-mode enables Emacs to remember the last location within a file
;; upon reopening. This feature is particularly beneficial for resuming work at
;; the precise point where you previously left off.
(use-package saveplace
  :ensure nil
  :commands (save-place-mode save-place-local-mode)
  :hook
  (after-init . save-place-mode)
  :custom
  (save-place-limit 400))

;;;; Better completion packages
;; Corfu enhances in-buffer completion by displaying a compact popup with
;; current candidates, positioned either below or above the point. Candidates
;; can be selected by navigating up or down.

(use-package corfu
  :ensure t
  :commands (corfu-mode global-corfu-mode)

  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  :custom
  ;; Hide commands in M-x which do not apply to the current mode.
  ;; (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Disable Ispell completion function. As an alternative try `cape-dict'.
  (text-mode-ispell-word-completion nil)
  (tab-always-indent 'complete)
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-cycle t)
  ;; Enable Corfu
  :config
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (corfu-history-mode)
  )

;; Cape, or Completion At Point Extensions, extends the capabilities of
;; in-buffer completion. It integrates with Corfu or the default completion UI,
;; by providing additional backends through completion-at-point-functions.
(use-package cape
  :ensure t
  :commands (cape-dabbrev cape-file cape-elisp-block)
  :bind ("C-c p" . cape-prefix-map)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; Vertico provides a vertical completion interface, making it easier to
;; navigate and select from completion candidates (e.g., when `M-x` is pressed).
(use-package vertico
  :custom
  ;; (Note: It is recommended to also enable the savehist package.)
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 10) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :ensure t
  :config
  (vertico-mode))

;; Configure the directory extension
(use-package vertico-directory
  :after vertico
  :ensure nil  ; vertico-directory is included with vertico
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)      ; Enter directories
              ("DEL" . vertico-directory-delete-char) ; Smart backspace
              ("M-DEL" . vertico-directory-delete-word)) ; Delete whole directory
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; Vertico leverages Orderless' flexible matching capabilities, allowing users
;; to input multiple patterns separated by spaces, which Orderless then
;; matches in any order against the candidates.
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless flex))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia allows Embark to offer you preconfigured actions in more contexts.
;; In addition to that, Marginalia also enhances Vertico by adding rich
;; annotations to the completion candidates displayed in Vertico's interface.
(use-package marginalia
  :ensure t
  :commands (marginalia-mode marginalia-cycle)
  :hook (after-init . marginalia-mode))

;; Embark integrates with Consult and Vertico to provide context-sensitive
;; actions and quick access to commands based on the current selection, further
;; improving user efficiency and workflow within Emacs. Together, they create a
;; cohesive and powerful environment for managing completions and interactions.
(use-package embark
  ;; Embark is an Emacs package that acts like a context menu, allowing
  ;; users to perform context-sensitive actions on selected items
  ;; directly from the completion interface.
  :ensure t
  :commands (embark-act
             embark-dwim
             embark-export
             embark-collect
             embark-bindings
             embark-prefix-help-command)
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded by `use-package'.

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Aggressive asynchronous that yield instantaneous results. (suitable for
  ;; high-performance systems.) Note: Minad, the author of Consult, does not
  ;; recommend aggressive values.
  ;; Read: https://github.com/minad/consult/discussions/951
  ;;
  ;; However, the author of minimal-emacs.d uses these parameters to achieve
  ;; immediate feedback from Consult.
  (setq consult-async-input-debounce 0.02
        consult-async-input-throttle 0.05
        consult-async-refresh-delay 0.02)
  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key "M-.")
  ;; (setq consult-preview-key '("S-<down>" "S-<up>"))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult-source-bookmark consult-source-file-register
   consult-source-recent-file consult-source-project-recent-file
   consult-buffer :preview-key nil
   consult-recent-file :preview-key nil
   consult-project-buffer :preview-key nil
   ;; :preview-key "M-."
   ;; :preview-key '(:debounce 0.4 any)
   )

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; "C-+"

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (keymap-set consult-narrow-map (concat consult-narrow-key " ?") #'consult-narrow-help)
  )

;; The undo-fu package is a lightweight wrapper around Emacs' built-in undo
;; system, providing more convenient undo/redo functionality.
(use-package undo-fu
  :ensure t
  :commands (undo-fu-only-undo
             undo-fu-only-redo
             undo-fu-only-redo-all
             undo-fu-disable-checkpoint)
  )

;; The undo-fu-session package complements undo-fu by enabling the saving
;; and restoration of undo history across Emacs sessions, even after restarting.
(use-package undo-fu-session
  :ensure t
  :commands undo-fu-session-global-mode
  :hook (after-init . undo-fu-session-global-mode))

;; (use-package centaur-tabs
;;   :ensure t
;;   :demand
;;   :config
;;   (centaur-tabs-mode t)
;;   (setq centaur-tabs-style "bar"
;;         centaur-tabs-height 16
;;         centaur-tabs-set-icons t
;;         centaur-tabs-show-new-tab-button t
;;         centaur-tabs-set-modified-marker t
;;         ;; centaur-tabs-show-navigation-buttons t
;;         centaur-tabs-set-bar 'under
;;         x-underline-at-descent-line t))
;; (with-eval-after-load 'centaur-tabs
;;   ;; Unbind vertical wheel scrolling
;;   (keymap-unset centaur-tabs-mode-map "<tab-line> <wheel-up>")
;;   (keymap-unset centaur-tabs-mode-map "<tab-line> <wheel-down>")
;;   ;; If you see <mouse-4>/<mouse-5> too, unset them as well
;;   (keymap-unset centaur-tabs-mode-map "<tab-line> <mouse-4>")
;;   (keymap-unset centaur-tabs-mode-map "<tab-line> <mouse-5>"))

;; Skip all buffers starting with *
(setq consult-buffer-filter
      '("\\` "                           ; Hidden buffers (space prefix)
        "\\*Messages\\*"
        "\\*straight-process\\*"
        "\\*Warnings\\*"
        "\\*Compile-Log\\*"
        "\\*Async-native-compile-log\\*"
        ;; "^magit-.*:"                    ; Magit process buffers
        "\\`\\*\\(EGLOT\\|LSP\\).*\\*\\'" ; Language server buffers
        "\\`\\*tramp.*\\*\\'"))         ; Tramp buffers

;; Remove recent files completely from consult-buffer
(setq consult-buffer-sources
      '(;; consult--source-hidden-buffer     ; Hidden buffers (SPC to show)
        ;; consult--source-modified-buffer   ; Modified buffers (* to show)
        consult-source-buffer           ; Regular buffers
        ;; consult--source-bookmark         ; Bookmarks (m to show)
        ;; consult--source-file-register    ; File registers (r to show)
        consult-source-project-buffer   ; Project buffers
        ;; consult--source-recent-file   ; Remove this line
        ;; consult--source-project-recent-file ; Optionally remove this too
        ))

(straight-use-package 'prescient)
(straight-use-package 'corfu-prescient)
(straight-use-package 'company-prescient)
(straight-use-package 'vertico-prescient)

(corfu-prescient-mode 1)
(company-prescient-mode 1)
(vertico-prescient-mode 1)

;;;; LSP, formatting, etc.
;; Set up the Language Server Protocol (LSP) servers using Eglot.
(use-package eglot
  :ensure nil
  :commands (eglot-ensure
             eglot-rename
             eglot-format-buffer))

;; Package manager for LSP, DAP, linters, and more for the Emacs Operating System
(use-package mason
  :ensure t
  :config
  (mason-setup))
(mason-setup
  (dolist (pkg '("basedpyright" "ruff" "clangd" "prettier" "tex-fmt"))
    (unless (mason-installed-p pkg)
      (ignore-errors (mason-install pkg)))))

;; Apheleia is an Emacs package designed to run code formatters (e.g., Shfmt,
;; Black and Prettier) asynchronously without disrupting the cursor position.
(use-package apheleia
  :ensure t
  :hook ((prog-mode . apheleia-mode))
  :config
  ;; Configure formatters after apheleia loads
  (setf (alist-get 'python-mode apheleia-mode-alist)
        '(ruff))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist)
        '(ruff))
  (setf (alist-get 'c++-mode apheleia-mode-alist)
        '(clang-format))
  (setf (alist-get 'c++-ts-mode apheleia-mode-alist)
        '(clang-format))

  (push '(tex-fmt . ("tex-fmt" "--stdin")) apheleia-formatters)
  (dolist (mode '(LaTeX-mode latex-mode TeX-latex-mode TeX-mode))
    (setf (alist-get mode apheleia-mode-alist) 'tex-fmt))
  )

(apheleia-global-mode t)

;; Enables automatic indentation of code while typing
(use-package aggressive-indent
  :ensure t
  :commands aggressive-indent-mode
  :hook
  (emacs-lisp-mode . aggressive-indent-mode))

;; Highlights function and variable definitions in Emacs Lisp mode
(use-package highlight-defined
  :ensure t
  :commands highlight-defined-mode
  :hook
  (emacs-lisp-mode . highlight-defined-mode))

;;;; Session management
;; The easysession Emacs package is a session manager for Emacs that can persist
;; and restore file editing buffers, indirect buffers/clones, Dired buffers,
;; windows/splits, the built-in tab-bar (including tabs, their buffers, and
;; windows), and Emacs frames. It offers a convenient and effortless way to
;; manage Emacs editing sessions and utilizes built-in Emacs functions to
;; persist and restore frames.
(use-package easysession
  :ensure t
  :commands (easysession-switch-to
             easysession-save-as
             easysession-save-mode
             easysession-load-including-geometry)

  :custom
  (easysession-mode-line-misc-info t)  ; Display the session in the modeline
  (easysession-save-interval (* 10 60))  ; Save every 10 minutes

  :init
  ;; Key mappings:
  ;; C-c l for switching sessions
  ;; and C-c s for saving the current session
  (global-set-key (kbd "C-c l") 'easysession-switch-to)
  (global-set-key (kbd "C-c s") 'easysession-save-as)

  ;; The depth 102 and 103 have been added to to `add-hook' to ensure that the
  ;; session is loaded after all other packages. (Using 103/102 is particularly
  ;; useful for those using minimal-emacs.d, where some optimizations restore
  ;; `file-name-handler-alist` at depth 101 during `emacs-startup-hook`.)
  (add-hook 'emacs-startup-hook #'easysession-load-including-geometry 102)
  (add-hook 'emacs-startup-hook #'easysession-save-mode 103))

;;;; Spell check
(use-package jinx
  :ensure t
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages)))

;; Set multiple languages
(setq jinx-languages "en_US ru_RU")

;;;; Navigation while editing
(use-package avy
  :ensure t
  :commands (avy-goto-char
             avy-goto-char-2
             avy-next)
  :init
  (global-set-key (kbd "s-'") 'avy-goto-char))

(use-package meow
  :ensure t)

;;;; Cool things
;;  Draw ▶─UNICODE diagrams─◀ within ▶─your texts─◀ in Emacs
(use-package uniline
  :ensure t)

;; Fully-fledged terminal emulator inside GNU Emacs based on libvterm,
(use-package vterm
  :ensure t)

;;; Project management

;; project.el is built-in, just use it
;; Optional: set project search paths
(setq project-vc-extra-root-markers
      '(".project" "Makefile" "package.json"
        "main.c" "main.rs" "main.py" "main.go" "main.cpp" "index.html"))

;;; Programming Languages

;;;; Compile
(require 'compile)
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (if (file-exists-p "Makefile")
                     ;; If Makefile exists, use "make -k" with current filename as target
                     (let ((target (file-name-sans-extension
                                    (file-name-nondirectory buffer-file-name))))
                       (format "make -k %s" target))
                   ;; Otherwise, use the default compilation command
                   (let ((file (file-name-nondirectory buffer-file-name)))
                     (format "%s -c -o %s.o %s %s %s"
                             (or (getenv "CC") "gcc")
                             (file-name-sans-extension file)
                             (or (getenv "CPPFLAGS") "-DDEBUG=9")
                             (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
                             file))))))

;;;; Flycheck (on the fly syntax checking)
(use-package flycheck
  :ensure t
  :custom (flycheck-highlighting-mode 'symbols)
  :init (global-flycheck-mode))

;;;; rainbow-delimeters
(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)
         (LaTeX-mode . rainbow-delimiters-mode)))

;;;; ssh
(use-package ssh-config-mode
  :ensure t)

;;;; CSV
(use-package csv-mode
  :ensure t)

;;;; Perl
(add-to-list 'auto-mode-alist '("latexmkrc\\'"   . perl-mode))
(add-to-list 'auto-mode-alist '("\\.latexmkrc\\'". perl-mode))

;;;; Python
;; (setq python-shell-interpreter "python3")
(defun my/python-send-buffer-and-switch-to-shell ()
  "Send buffer to Python process and switch to its frame/window without splitting."
  (interactive)
  (python-shell-send-buffer)
  (let* ((shell-buffer (python-shell-get-buffer))
         (shell-window (when shell-buffer (get-buffer-window shell-buffer t)))) ; t = any frame
    (cond
     ;; If shell is in another frame, switch to that frame
     (shell-window
      (select-frame-set-input-focus (window-frame shell-window))
      (select-window shell-window)
      (end-of-buffer))
     ;; If shell buffer exists but not displayed, display in other frame
     (shell-buffer
      (display-buffer-pop-up-frame shell-buffer nil)
      (end-of-buffer))
     (t
      (error "No Python shell buffer found")))))

(defun my/add-python-keybindings ()
  "Add custom keybindings to Python modes."
  (when (derived-mode-p 'python-mode)
    (local-set-key (kbd "C-c C-c") 'my/python-send-buffer-and-switch-to-shell)))

;; Add to both python-mode and python-ts-mode hooks
(add-hook 'python-mode-hook 'my/add-python-keybindings)
(add-hook 'python-ts-mode-hook 'my/add-python-keybindings)

;;;; Vimrc
(use-package vimrc-mode
  :ensure t)

;;;; LaTeX
(load (expand-file-name "latex.el" user-emacs-directory) t t)
;; Global for LaTeX buffers (LaTeX-mode or AUCTeX)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq LaTeX-indent-level 4
                  LaTeX-item-indent 0
                  TeX-brace-indent-level 4
                  indent-tabs-mode nil)))  ; Use spaces, not tabs

(setq reftex-toc-split-windows-horizontally t)
(setq reftex-toc-split-windows-fraction 0.2)

(use-package reftex
  :ensure nil
  :hook (LaTeX-mode TeX-mode))

(add-to-list 'major-mode-remap-alist '(latex-mode . latex-ts-mode))
(add-to-list 'major-mode-remap-alist '(LaTeX-mode . latex-ts-mode))


;;;; Markdown
;; The markdown-mode package provides a major mode for Emacs for syntax
;; highlighting, editing commands, and preview support for Markdown documents.
;; It supports core Markdown syntax as well as extensions like GitHub Flavored
;; Markdown (GFM).
(use-package markdown-mode
  :commands (gfm-mode
             gfm-view-mode
             markdown-mode
             markdown-view-mode)
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode))
  :bind
  (:map markdown-mode-map
        ("C-c C-e" . markdown-do)))

;;;; Typst
(use-package typst-ts-mode
  :ensure t)

(use-package typst-preview
  :ensure t)

(with-eval-after-load 'eglot
  (with-eval-after-load 'typst-ts-mode
    (add-to-list 'eglot-server-programs
                 `((typst-ts-mode) .
                   ,(eglot-alternatives `(,typst-ts-lsp-download-path
                                          "tinymist"
                                          "typst-lsp"))))))

;;;; C/C++
(use-package doxymacs
  :ensure t)

;; Define a custom style matching your clang-format config
(defconst llvm-allman-style
  '((c-basic-offset . 4)
    (c-offsets-alist
     . ((access-label . -)
        (annotation-var-cont . 0)
        (arglist-close . 0)
        (arglist-intro . +)
        (block-close . 0)
        (block-open . 0)
        (brace-entry-open . 0)
        (brace-list-close . 0)
        (brace-list-open . 0)
        (case-label . +)
        (class-close . 0)
        (class-open . 0)
        (comment-intro . 0)
        (cpp-macro . -1000)
        (cpp-macro-cont . +)
        (defun-close . 0)
        (defun-open . 0)
        (extern-lang-close . 0)
        (extern-lang-open . 0)
        (friend . 0)
        (inclass . +)
        (inextern-lang . 0)
        (inher-cont . 0)
        (inher-intro . +)
        (inline-close . 0)
        (inline-open . 0)
        (innamespace . 0)           ; Inner namespace content at column 0
        (knr-argdecl-intro . 5)
        (label . 0)
        (member-init-cont . 0)
        (member-init-intro . +)
        (namespace-close . 0)       ; Close namespace at column 0
        (namespace-open . 0)        ; Start namespace at column 0
        (statement-case-open . +)
        (statement-cont . +)
        (substatement-label . 0)
        (substatement-open . 0)
        (template-args-cont c-lineup-template-args +) ; Template handling
        (topmost-intro . 0)
        (topmost-intro-cont . 0)
        ;; Brace placement for Allman style
        (statement-block-intro . +)))
    ;; Move cleanup list to style definition (optional)
    (c-cleanup-list . (brace-else-brace
                       brace-elseif-brace
                       empty-defun-braces
                       defun-close-semi
                       list-close-comma
                       scope-operator))
    ;; Move hanging braces to style definition
    (c-hanging-braces-alist . ((defun-open after)
                               (defun-close before after)
                               (class-open after)
                               (class-close before after)
                               (namespace-open after)
                               (namespace-close before after)
                               (inline-open after)
                               (inline-close before after)
                               (block-open after)
                               (block-close before after)
                               (extern-lang-open after)
                               (extern-lang-close before after)
                               (statement-case-open after)
                               (substatement-open after))))
  "My personal C/C++ style matching .clang-format configuration.")

;; Register style only for CC-mode
(c-add-style "llvm-allman" llvm-allman-style)

(defun my/setup-c-style ()
  "Setup my personal C/C++ style for all C-like modes."
  ;; Common settings for all C-like modes
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil)   ; Use spaces, not tabs
  (setq-local fill-column 120)        ; Column limit
  (setq-local comment-column 40)      ; Align comments to column 40

  ;; Electric pair settings for Allman style braces
  (setq-local electric-pair-preserve-balance t)
  (setq-local electric-pair-open-newline-between-pairs t)

  ;; Set the style - this will apply all settings from llvm-allman-style
  (c-set-style "llvm-allman")

  (setq-local tab-always-indent 'complete)

  ;; Add operator highlighting to C/C++ modes.
  ;; (font-lock-add-keywords
  ;;  nil
  ;;  `(;; Multi-character operators (higher precedence)
  ;;    ("\\(<<\\|>>\\|<=\\|>=\\|==\\|!=\\|&&\\|||\\|\\+\\+\\|--\\)"
  ;;     1 'font-lock-operator-face prepend)
  ;;
  ;;    ;; Single-character operators
  ;;    ("\\([=+*/%&|^!<>?:~-]\\)"
  ;;     1 'font-lock-operator-face prepend))
  ;;  'append)
  )

(defun my/tempel-or-indent ()
  "Expand tempel template if possible; otherwise indent."
  (interactive)
  (if (and (bound-and-true-p tempel-mode)
           (tempel-complete))
      t
    (c-indent-line-or-region)))

;; Set default style for new buffers
(setq-default c-default-style '((c-mode . "llvm-allman")
                                (c++-mode . "llvm-allman")
                                (java-mode . "java")
                                (awk-mode . "awk")
                                (other . "gnu")))

;; Apply to existing buffers via hooks
(add-hook 'c-mode-hook 'my/setup-c-style)
(add-hook 'c++-mode-hook 'my/setup-c-style)
;; Add after your style setup in the hook
(add-hook 'c-mode-hook
          (lambda () (local-set-key (kbd "TAB") #'my/tempel-or-indent)))
(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "TAB") #'my/tempel-or-indent)))

;;;; Miscellanious language modes

(use-package dockerfile-mode
  :ensure t)

;;; Snippets
;; Configure Tempel
(use-package tempel
  :ensure t
  :bind (:map tempel-map
              ("<tab>" . tempel-next)
              ("<backtab>" . tempel-previous))

  :init
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.  `tempel-expand'
    ;; only triggers on exact matches. We add `tempel-expand' *before* the main
    ;; programming mode Capf, such that it will be tried first.
    ;; (setq-local completion-at-point-functions
    ;;             (cons #'tempel-expand completion-at-point-functions))

    ;; Alternatively use `tempel-complete' if you want to see all matches.  Use
    ;; a trigger prefix character in order to prevent Tempel from triggering
    ;; unexpectly.
    (setq-local corfu-auto-trigger "/"
                completion-at-point-functions
                (cons (cape-capf-trigger #'tempel-complete ?/)
                      completion-at-point-functions))
    )

  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)

  ;; Optionally make the Tempel templates available to Abbrev,
  ;; either locally or globally. `expand-abbrev' is bound to C-x '.
  ;; (add-hook 'prog-mode-hook #'tempel-abbrev-mode)
  ;; (global-tempel-abbrev-mode)
  )

;;; Personal function definitions
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

(defun my/mark-inside-quotes-seeking-visible ()
  "Mark inside quotes. If a region is currently active, cycle to the next pair.

  1. If active region: Unselect, jump to end, and search for the NEXT quotes.
  2. If no region: Try marking at current point.
  3. If that fails: Search forward for any quote (' or \") in the visible window.

  It loops until it finds a valid quote pair or hits the bottom of the window."
  (interactive)
  (require 'expand-region)
  (let ((origin (point))
        (limit (window-end nil t))
        (started-with-region (use-region-p))
        (search-start (point)))

    ;; 1. Setup: If we already have a selection, start searching from its END
    (if started-with-region
        (progn
          (goto-char (region-end))
          (deactivate-mark)
          (setq search-start (point)))
      ;; If no region, first try to mark exactly where we are
      (ignore-errors (er/mark-inside-quotes))
      (setq search-start (point)))

    ;; 2. Search Loop: Run only if we don't have a valid selection yet
    (while (and (not (use-region-p))
                (re-search-forward "[\"']" limit t))

      ;; We found a quote and are now placed immediately after it.
      ;; Try to mark inside.
      (ignore-errors (er/mark-inside-quotes))

      ;; EDGE CASE: If er/mark-inside-quotes re-selected the *same* region
      ;; (e.g. we hit the closing quote of the previous string), discard it.
      (when (and (use-region-p)
                 started-with-region
                 (<= (region-beginning) search-start))
        (deactivate-mark))) ;; Loop will continue to the next quote

    ;; 3. Result / Feedback
    (unless (use-region-p)
      (goto-char origin)
      (if started-with-region
          (message "No next quotes found in visible window.")
        (message "No quotes found.")))))

(defun my/mark-outside-quotes-seeking-visible ()
  "Mark outside quotes (including the quote characters).
  Behaves like Vim's va\" / va'.

  1. If active region: Unselect, jump to end, and search for the NEXT quote pair.
  2. If no region: Try marking at current point.
  3. If that fails: Search forward for any quote (' or \") in the visible window.

  Loops until it finds a new quote pair or hits the bottom of the window."
  (interactive)
  (require 'expand-region)
  (let ((origin (point))
        (limit (window-end nil t))
        (started-with-region (use-region-p))
        (search-start (point)))

    ;; 1. Setup: If we already have a selection, start searching from its END
    (if started-with-region
        (progn
          (goto-char (region-end))
          (deactivate-mark)
          (setq search-start (point)))
      ;; If no region, first try to mark exactly where we are
      (ignore-errors (er/mark-outside-quotes))
      (setq search-start (point)))

    ;; 2. Search Loop
    (while (and (not (use-region-p))
                (re-search-forward "[\"']" limit t))

      ;; Try to mark outside the quotes from our new position
      (ignore-errors (er/mark-outside-quotes))

      ;; EDGE CASE: If we hit a closing quote and it re-selected the PREVIOUS string,
      ;; discard it and keep searching forward.
      (when (and (use-region-p)
                 started-with-region
                 (<= (region-beginning) search-start))
        (deactivate-mark)))

    ;; 3. Result / Feedback
    (unless (use-region-p)
      (goto-char origin)
      (if started-with-region
          (message "No next quotes found in visible window.")
        (message "No quotes found.")))))


;;; post-init.el ends here
