;;; envy-theme.el --- A light color scheme with comfortable contrast -*- lexical-binding: t -*-

;; Copyright (C) 2025 Alexander Zakharov

;; Author: Alexander Zakharov <delovoii@icloud.com>
;; URL: https://github.com/kkga/vim-envy
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; Keywords: faces, themes, light

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; A light color scheme with comfortable contrast.
;; Converted from Vim's Envy theme by Gadzhi Kharkharov.

;;; Code:

(deftheme envy
  "A light color scheme with comfortable contrast.")

(let ((class '((class color) (min-colors 89)))
      ;; Color definitions from the Vim theme
      (background "#eeeeee")
      (foreground "#000000")
      (cursor "#000000")
      (cursor-bg "#000000")
      (selection "#afd7ff")
      (comment "#6c6c6c")
      (grey1 "#e4e4e4")
      (grey2 "#c6c6c6")
      (grey3 "#b2b2b2")
      (white "#ffffff")
      (black "#000000")
      (red "#d70000")
      (green "#005f00")
      (yellow "#d75f00")
      (blue "#005fd7")
      (purple "#5f00d7")
      (cyan "#0087af")
      (error-bg "#ffafaf")
      (warning-bg "#ffd787")
      (hint-bg "#afd7af")
      (lred "#ffafaf")
      (lyellow "#ffd787")
      (lcyan "#afd7af")
      (lblue "#afd7ff")
      (yellow-hard "yellow")
      )

  (custom-theme-set-faces
   'envy

   ;; Basic faces
   `(default ((,class (:background ,background :foreground ,foreground))))
   `(cursor ((,class (:background ,cursor-bg))))
   `(region ((,class (:background ,selection))))
   `(highlight ((,class (:background ,selection))))
   `(hl-line ((,class (:background ,grey1))))
   `(fringe ((,class (:background ,grey1 :foreground ,comment))))
   `(linum ((,class (:background ,grey1 :foreground ,comment))))
   `(line-number ((,class (:inherit default :background ,grey1 :foreground ,comment))))
   `(line-number-current-line ((,class (:inherit default :background ,grey1 :foreground ,comment :weight bold))))

   ;; Text faces
   `(font-lock-comment-face ((,class (:foreground ,comment))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-keyword-face ((,class (:inherit bold))))
   `(font-lock-function-name-face ((,class (:foreground ,foreground :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,foreground))))
   `(font-lock-number-face ((,class (:foreground ,blue))))
   `(font-lock-type-face ((,class (:foreground ,foreground :weight bold))))
   `(font-lock-constant-face ((,class (:foreground ,foreground))))
   `(font-lock-builtin-face ((,class (:foreground ,purple))))
   `(font-lock-preprocessor-face ((,class (:inherit bold))))
   `(font-lock-warning-face ((,class (:foreground ,yellow :weight bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,foreground))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,yellow))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow))))

   ;; UI faces
   `(mode-line ((,class (:background ,grey3 :foreground ,foreground :weight bold))))
   `(mode-line-inactive ((,class (:background ,grey2 :foreground ,foreground))))
   `(vertical-border ((,class (:background ,grey2 :foreground ,grey2))))
   `(tab-line ((,class (:background ,grey2 :foreground ,foreground))))
   `(tab-line-inactive ((,class (:background ,grey2 :foreground ,foreground))))
   `(tab-line-tab-current ((,class (:background ,background :foreground ,foreground :weight bold))))
   `(minibuffer-prompt ((,class (:foreground ,blue :weight bold))))
   `(centaur-tabs-selected ((,class (:background ,background :foreground ,foreground :weight bold))))
   `(centaur-tabs-unselected ((,class (:background ,grey2 :foreground ,foreground))))
   `(centaur-tabs-selected-modified ((,class (:inherit centaur-tabs-selected))))
   `(centaur-tabs-unselected-modified ((,class (:inherit centaur-tabs-unselected))))


   ;; Search and matches
   `(isearch ((,class (:background ,selection))))
   `(isearch-fail ((,class (:background ,error-bg))))
   `(lazy-highlight ((,class (:background ,selection :weight bold))))
   `(match ((,class (:background ,selection :weight bold))))

   ;; Parentheses matching
   `(show-paren-match ((,class (:background ,selection :weight bold))))
   `(show-paren-mismatch ((,class (:background ,error-bg :foreground ,white))))

   ;; Spelling
   `(flyspell-incorrect ((,class (:foreground ,red :underline (:style wave :color ,red)))))
   `(flyspell-duplicate ((,class (:foreground ,purple :underline (:style wave :color ,purple)))))

   ;; Error/warning/info faces
   `(error ((,class (:foreground ,red :weight bold))))
   `(warning ((,class (:foreground ,yellow :weight bold))))
   `(success ((,class (:foreground ,green :weight bold))))
   `(compilation-error ((,class (:foreground ,red :weight bold :underline t))))
   `(compilation-warning ((,class (:foreground ,yellow :weight bold :underline t))))
   `(compilation-info ((,class (:foreground ,cyan :weight bold :underline t))))

   ;; Diagnostics (LSP, Flycheck, etc.)
   `(lsp-face-highlight-read ((,class (:background ,selection))))
   `(lsp-face-highlight-textual ((,class (:background ,selection))))
   `(lsp-face-highlight-write ((,class (:background ,selection :weight bold))))
   `(lsp-ui-peek-highlight ((,class (:background ,selection))))
   `(lsp-ui-peek-selection ((,class (:background ,grey2))))
   `(lsp-ui-sideline-symbol ((,class (:foreground ,comment))))
   `(lsp-ui-sideline-code-actions ((,class (:foreground ,blue))))
   `(lsp-ui-doc-background ((,class (:background ,white))))
   `(lsp-ui-doc-header ((,class (:background ,white :foreground ,foreground :weight bold))))

   ;; Git-related
   `(git-gutter:added ((,class (:foreground ,green :background ,grey1))))
   `(git-gutter:modified ((,class (:foreground ,yellow :background ,grey1))))
   `(git-gutter:deleted ((,class (:foreground ,red :background ,grey1))))
   `(git-gutter-fr:added ((,class (:foreground ,green :weight bold))))
   `(git-gutter-fr:modified ((,class (:foreground ,yellow :weight bold))))
   `(git-gutter-fr:deleted ((,class (:foreground ,red :weight bold))))

   ;; Magit
   `(magit-diff-added ((,class (:foreground ,green :background ,grey1))))
   `(magit-diff-added-highlight ((,class (:foreground ,green))))
   `(magit-diff-removed ((,class (:foreground ,red :background ,grey1))))
   `(magit-diff-removed-highlight ((,class (:foreground ,red))))
   `(magit-diff-context ((,class (:foreground ,foreground :background ,grey1))))
   `(magit-diff-context-highlight ((,class (:foreground ,foreground))))
   `(magit-section-heading ((,class (:foreground ,foreground :weight bold))))
   `(magit-section-highlight ((,class (:background ,grey1))))

   ;; Company (completion) - kept for compatibility
   `(company-tooltip ((,class (:background ,white :foreground ,foreground))))
   `(company-tooltip-common ((,class (:foreground ,blue :weight bold))))
   `(company-tooltip-selection ((,class (:background ,grey2 :weight bold))))
   `(company-scrollbar-fg ((,class (:background ,grey2))))
   `(company-scrollbar-bg ((,class (:background ,grey1))))

   ;; Ivy/Counsel
   `(ivy-current-match ((,class (:background ,grey2 :weight bold))))
   `(ivy-minibuffer-match-face-1 ((,class (:background ,selection))))
   `(ivy-minibuffer-match-face-2 ((,class (:background ,selection :weight bold))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,blue :weight bold))))
   `(org-level-2 ((,class (:foreground ,purple :weight bold))))
   `(org-level-3 ((,class (:foreground ,green :weight bold))))
   `(org-level-4 ((,class (:foreground ,yellow :weight bold))))
   `(org-date ((,class (:foreground ,comment))))
   `(org-todo ((,class (:foreground ,cyan :weight bold))))
   `(org-done ((,class (:foreground ,green :weight bold))))
   `(org-tag ((,class (:foreground ,purple :weight bold))))

   ;; Markdown
   `(markdown-header-face ((,class (:foreground ,blue :weight bold))))
   `(markdown-header-face-1 ((,class (:foreground ,blue :weight bold))))
   `(markdown-header-face-2 ((,class (:foreground ,purple :weight bold))))
   `(markdown-header-face-3 ((,class (:foreground ,green :weight bold))))
   `(markdown-header-face-4 ((,class (:foreground ,yellow :weight bold))))
   `(markdown-code-face ((,class (:background ,grey1))))
   `(markdown-list-face ((,class (:foreground ,foreground :weight bold))))

   ;; Special faces
   `(escape-glyph ((,class (:foreground ,comment))))
   `(trailing-whitespace ((,class (:background ,error-bg))))
   `(whitespace-space ((,class (:foreground ,grey2 :background ,background))))
   `(whitespace-hspace ((,class (:foreground ,grey2 :background ,background))))
   `(whitespace-tab ((,class (:foreground ,grey2 :background ,background))))
   `(whitespace-newline ((,class (:foreground ,grey2))))
   `(whitespace-trailing ((,class (:background ,error-bg :foreground ,red))))
   `(whitespace-line ((,class (:background ,error-bg))))
   `(link ((,class (:foreground ,blue :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,purple :underline t :weight normal))))

   ;; Parenthesis matching
   `(paren-face-match ((,class (:background ,selection :weight bold))))
   `(paren-face-mismatch ((,class (:background ,error-bg :foreground ,white))))
   `(paren-face-no-match ((,class (:background ,error-bg :foreground ,white))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,blue :weight bold))))
   `(dired-symlink ((,class (:foreground ,purple :weight bold))))
   `(dired-mark ((,class (:foreground ,red :weight bold))))

   ;; Calendar
   `(calendar-today ((,class (:background ,grey2 :weight bold))))

   ;; Eshell
   `(eshell-prompt ((,class (:foreground ,blue :weight bold))))
   `(eshell-ls-directory ((,class (:foreground ,blue :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,purple :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,green :weight bold))))

   ;; Diff
   `(diff-added ((,class (:foreground ,green :background ,grey1))))
   `(diff-removed ((,class (:foreground ,red :background ,grey1))))
   `(diff-changed ((,class (:foreground ,yellow :background ,grey1))))
   `(diff-refine-added ((,class (:background ,green))))
   `(diff-refine-removed ((,class (:background ,red))))
   `(diff-refine-changed ((,class (:background ,yellow))))

   ;; Error/warning signs and highlights
   `(error-sign ((,class (:background ,lred :weight bold))))
   `(warning-sign ((,class (:background ,lyellow :weight bold))))
   `(hint-sign ((,class (:background ,lcyan :weight bold))))
   `(error-highlight ((,class (:background ,lred))))
   `(warning-highlight ((,class (:background ,lyellow))))
   `(hint-highlight ((,class (:background ,lcyan))))

   ;; Float windows
   `(lsp-ui-doc ((,class (:background ,white :foreground ,foreground))))
   `(lsp-ui-doc-header ((,class (:background ,white :foreground ,foreground :weight bold))))

   ;; Neogit equivalent faces
   `(neogit-hunk-header ((,class (:background ,grey1 :foreground ,comment :weight bold))))
   `(neogit-hunk-header-highlight ((,class (:background ,grey2 :weight bold))))

   ;; Fugitive equivalent
   `(fugitive-blame-time ((,class (:foreground ,blue))))
   `(fugitive-blame-hash ((,class (:foreground ,purple))))

   ;; HAML/HTML
   `(haml-tag ((,class (:foreground ,foreground :weight bold))))
   `(html-tag ((,class (:foreground ,foreground :weight bold))))

   ;; Ruby
   `(ruby-constant-face ((,class (:foreground ,foreground))))
   `(ruby-instance-variable-face ((,class (:foreground ,blue :weight bold))))

   ;; CSS
   `(css-selector ((,class (:foreground ,foreground :weight bold))))
   `(css-property ((,class (:foreground ,foreground))))

   ;; JSON
   `(json-key ((,class (:foreground ,green))))

   ;; YAML
   `(yaml-key ((,class (:foreground ,blue :weight bold))))

   ;; Python
   `(python-operator ((,class (:foreground ,foreground :weight bold))))

   ;; JavaScript/TypeScript
   `(js2-function-call ((,class (:foreground ,foreground))))
   `(typescript-function-call-face ((,class (:foreground ,foreground))))

   ;; Rust
   `(rust-mod-path ((,class (:foreground ,foreground))))

   ;; Java
   `(java-annotation-face ((,class (:foreground ,blue :weight bold))))

   ;; Perl
   `(perl-nonoverridable-face ((,class (:foreground ,foreground :weight bold))))

   ;; Makefile
   `(makefile-targets ((,class (:foreground ,foreground :weight bold))))

   ;; TeX
   `(font-latex-sectioning-0-face ((,class (:foreground ,blue :weight bold))))
   `(font-latex-sectioning-1-face ((,class (:foreground ,purple :weight bold))))

   ;; Custom faces for special plugins
   `(white-on-yellow ((,class (:background ,yellow :foreground ,white))))
   `(white-on-red ((,class (:background ,red :foreground ,white))))
   `(white-on-purple ((,class (:background ,purple :foreground ,white))))

   ;; Additional faces for compatibility
   `(tooltip ((,class (:background ,white :foreground ,foreground))))
   `(menu ((,class (:background ,white :foreground ,foreground))))
   `(secondary-selection ((,class (:background nil))))
   `(query-replace ((,class (:background ,selection :foreground ,foreground :weight bold))))

   ;; Corfu (Completion UI)
   `(corfu-default ((,class (:background ,white :foreground ,foreground))))
   `(corfu-current ((,class (:background ,grey2 :weight bold))))
   `(corfu-border ((,class (:background ,grey2 :foreground ,grey2))))
   `(corfu-separator ((,class (:background ,grey2 :foreground ,grey2))))
   `(corfu-annotations ((,class (:foreground ,comment))))
   `(corfu-bar ((,class (:background ,grey2))))
   `(corfu-quick ((,class (:foreground ,blue :weight bold))))

   ;; Vertico (Vertical Completion)
   `(vertico-current ((,class (:background ,grey2 :weight bold))))
   `(vertico-group-title ((,class (:foreground ,blue :weight bold :extend t))))
   `(vertico-group-separator ((,class (:background ,grey1 :foreground ,comment :extend t))))

   ;; Marginalia (Annotations for completions)
   `(marginalia-documentation ((,class (:foreground ,comment :slant italic))))
   `(marginalia-key ((,class (:foreground ,blue :weight bold))))
   `(marginalia-value ((,class (:foreground ,purple))))
   `(marginalia-type ((,class (:foreground ,green :weight bold))))
   `(marginalia-modifier ((,class (:foreground ,yellow :weight bold))))
   `(marginalia-symbol ((,class (:foreground ,cyan :weight bold))))
   `(marginalia-char ((,class (:foreground ,red :weight bold))))

   ;; Which-Key
   `(which-key-key-face ((,class (:foreground ,blue :weight bold :box (:line-width 1 :color ,grey2)))))
   `(which-key-group-description-face ((,class (:foreground ,comment))))
   `(which-key-command-description-face ((,class (:foreground ,foreground))))
   `(which-key-local-map-description-face ((,class (:foreground ,green :weight bold))))
   `(which-key-special-key-face ((,class (:foreground ,purple :weight bold))))
   `(which-key-posframe ((,class (:background ,white :foreground ,foreground))))
   `(which-key-posframe-border ((,class (:background ,grey2))))

   ;; Eglot (LSP client)
   `(eglot-mode-line ((,class (:foreground ,cyan :weight bold))))
   `(eglot-inlay-hint-face ((,class (:foreground ,comment :background ,background :height 0.9))))
   `(eglot-inlay-hint-parameter-face ((,class (:inherit eglot-inlay-hint-face :foreground ,purple))))
   `(eglot-inlay-hint-type-face ((,class (:inherit eglot-inlay-hint-face :foreground ,green))))
   `(eglot-inlay-hint-readonly-face ((,class (:inherit eglot-inlay-hint-face :foreground ,comment :slant italic))))
   `(eglot-diagnostic-tag-deprecated ((,class (:strike-through t :foreground ,comment))))
   `(eglot-diagnostic-tag-unnecessary ((,class (:foreground ,comment :strike-through t))))
   `(eglot-diagnostic-error ((,class (:foreground ,red :weight bold :underline (:style wave :color ,red)))))
   `(eglot-diagnostic-warning ((,class (:foreground ,yellow :weight bold :underline (:style wave :color ,yellow)))))
   `(eglot-diagnostic-info ((,class (:foreground ,cyan :weight bold :underline (:style wave :color ,cyan)))))
   `(eglot-diagnostic-hint ((,class (:foreground ,green :weight bold :underline (:style wave :color ,green)))))
   `(eglot-signature-active-argument ((,class (:background ,grey1 :weight bold))))
   `(eglot-hover-highlight ((,class (:background ,selection))))
   `(eglot-helpful-argument-name ((,class (:foreground ,purple :weight bold))))
   `(eglot-helpful-return-type ((,class (:foreground ,green :weight bold))))

   ;; Avy (Jump navigation)
   `(avy-lead-face ((,class (:background ,yellow-hard :foreground ,black :weight bold :box nil))))
   `(avy-lead-face-0 ((,class (:inherit avy-lead-face))))
   `(avy-lead-face-1 ((,class (:inherit avy-lead-face))))
   `(avy-lead-face-2 ((,class (:inherit avy-lead-face))))
   `(avy-goto-char-timer ((,class (:inherit avy-lead-face))))
   `(avy-goto-word-0 ((,class (:inherit avy-lead-face))))
   `(avy-goto-word-1 ((,class (:inherit avy-lead-face))))
   `(avy-goto-line ((,class (:inherit avy-lead-face))))
   `(avy-background-face ((,class (:background ,grey1 :foreground ,comment))))

   ;; Additional faces for compatibility with the original theme links
   `(diff-text ((,class (:inherit font-lock-constant-face))))
   `(boolean ((,class (:inherit font-lock-keyword-face))))
   `(character ((,class (:inherit font-lock-string-face))))
   `(label ((,class (:inherit font-lock-special-face))))
   `(special-key ((,class (:inherit font-lock-constant-face))))
   `(statement ((,class (:inherit font-lock-keyword-face))))
   `(storage-class ((,class (:inherit font-lock-keyword-face))))
   `(type ((,class (:inherit font-lock-keyword-face))))
   `(wildmenu ((,class (:background ,grey2 :weight bold))))

   ;; Orderless
   `(orderless-match-face-0 ((,class (:foreground ,blue :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,purple :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,yellow :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,cyan :weight bold))))

   ;; CSS/HTML specific
   `(css-classname ((,class (:inherit font-lock-keyword-face))))
   `(css-color ((,class (:inherit font-lock-constant-face))))
   `(css-id ((,class (:inherit font-lock-keyword-face))))
   `(css-important ((,class (:inherit font-lock-keyword-face))))
   `(css-property ((,class (:inherit font-lock-variable-name-face))))
   `(css-tag ((,class (:inherit font-lock-keyword-face))))

   ;; Git signs
   `(git-signs-add ((,class (:inherit diff-added))))
   `(git-signs-change ((,class (:inherit diff-changed))))
   `(git-signs-delete ((,class (:inherit diff-removed))))
   `(git-signs-change-delete ((,class (:inherit diff-removed))))

   ;; LSP diagnostics (for compatibility with various LSP clients)
   `(lsp-diagnostic-face-error ((,class (:inherit eglot-diagnostic-error))))
   `(lsp-diagnostic-face-warning ((,class (:inherit eglot-diagnostic-warning))))
   `(lsp-diagnostic-face-info ((,class (:inherit eglot-diagnostic-info))))
   `(lsp-diagnostic-face-hint ((,class (:inherit eglot-diagnostic-hint))))

   ;; ALE equivalents
   `(ale-error-sign ((,class (:inherit error-sign))))
   `(ale-error ((,class (:inherit error-highlight))))
   `(ale-warning-sign ((,class (:inherit warning-sign))))
   `(ale-warning ((,class (:inherit warning-highlight))))

   ;; Coc equivalents
   `(coc-error-sign ((,class (:inherit error-sign))))
   `(coc-error-highlight ((,class (:inherit error-highlight))))
   `(coc-warning-sign ((,class (:inherit warning-sign))))
   `(coc-warning-highlight ((,class (:inherit warning-highlight))))
   `(coc-hint-sign ((,class (:inherit hint-sign))))
   `(coc-hint-highlight ((,class (:inherit hint-highlight))))

   ;; Telescope equivalents (for consult/embark users)
   `(consult-preview-line ((,class (:background ,grey1))))
   `(embark-keybinding ((,class (:foreground ,blue :weight bold))))
   `(embark-collect ((,class (:background ,grey1 :foreground ,foreground))))

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'envy)

;;; envy-theme.el ends here
