;;; usgc-polyimide-st-theme.el --- USGC-POLYIMIDE-ST color theme for Emacs -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Neil Panchal
;;               2025 Alexander Zakharov

;; Author: Neil Panchal <https://github.com/neilpanchal>
;;         Alexander Zakharov <https://github.com/ogswag>
;; Maintainer: Alexander Zakharov <delovoii@icloud.com>
;; URL: https://github.com/ogswag/usgc-themes
;; Package-Requires: ((emacs "27.1"))
;; Version: 1.0.0
;; Keywords: faces, theme

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This theme is a port of the “USGC-HIGH-K-ST” colour scheme originally
;; designed by Neil Panchal for Sublime Text:
;; https://github.com/neilpanchal.
;;
;; The port for Emacs was implemented by Alexander Zakharov:
;; https://github.com/ogswag.
;;

;;; Code:

(deftheme usgc-polyimide-st
  "USGC-POLYIMIDE-ST color theme")

(let ((class '((class color) (min-colors 89)))
      ;; Color definitions
      (black      "#000000")
      (white      "#FFFFFF")
      (fl-red     "#FF0000")
      (fl-green   "#00FF00")
      (fl-blue    "#0000FF")
      (fl-cyan    "#00FFFF")
      (fl-magenta "#FF00FF")
      (fl-yellow  "#FFFF00")
      (fl-orange  "#FF6600")
      (maroon     "#660000")
      (green      "#00A645")
      (blue       "#000066")
      (cyan       "#006666")
      (magenta    "#660066")
      (yellow     "#FFBF00")
      (olive      "#666600")
      (gray       "#999999"))

  (custom-theme-set-faces
   'usgc-polyimide-st

   ;; Base settings - Dark theme with black background, yellow foreground
   `(default                  ((,class (:background ,black :foreground ,yellow))))
   `(cursor                   ((,class (:background ,green))))
   `(region                   ((,class (:background ,blue :foreground ,fl-cyan))))
   `(hl-line                  ((,class (:background ,fl-blue))))
   `(fringe                   ((,class (:background ,black :foreground ,fl-orange))))
   `(linum                    ((,class (:background ,black :foreground ,fl-orange))))
   `(line-number              ((,class (:inherit default :background ,black :foreground ,fl-orange))))
   `(line-number-current-line ((,class (:inherit default :background ,fl-blue :foreground ,white))))

   ;; Mode line
   `(mode-line ((,class (:background ,black
                                     :foreground ,fl-red
                                     :box (:line-width 1 :color ,maroon :style flat-button)))))
   `(mode-line-inactive ((,class (:background ,black
                                              :foreground ,gray
                                              :box (:line-width 1 :color ,gray :style flat-button)))))

   `(mode-line-highlight ((,class (:background ,black
                                               :foreground ,white
                                               :box (:line-width 1 :color ,white :style flat-button)))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,fl-green))))

   ;; Font lock (syntax highlighting)
   `(font-lock-builtin-face       ((,class (:foreground ,fl-orange))))
   `(font-lock-comment-face       ((,class (:foreground ,gray))))
   `(font-lock-doc-face           ((,class (:foreground ,gray))))
   `(font-lock-constant-face      ((,class (:foreground ,yellow))))
   `(font-lock-function-name-face ((,class (:foreground ,fl-orange :weight bold))))
   `(font-lock-keyword-face       ((,class (:foreground ,fl-orange))))
   `(font-lock-string-face        ((,class (:foreground ,green))))
   `(font-lock-type-face          ((,class (:foreground ,fl-orange :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,yellow))))
   `(font-lock-warning-face       ((,class (:foreground ,fl-orange :weight bold))))

   ;; Parenthesis matching
   `(show-paren-match ((,class (:background ,fl-yellow :foreground ,black))))
   `(show-paren-mismatch ((,class (:background ,fl-red :foreground ,white))))

   ;; Search
   `(isearch ((,class (:background ,fl-yellow :foreground ,black))))
   `(isearch-fail ((,class (:background ,fl-red :foreground ,white))))

   ;; Error/Warning
   `(error ((,class (:foreground ,fl-red :weight bold))))
   `(warning ((,class (:foreground ,fl-orange :weight bold))))
   `(success ((,class (:foreground ,fl-green :weight bold))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,fl-blue :weight bold))))
   `(dired-symlink ((,class (:foreground ,magenta :slant italic))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,green :weight bold))))
   `(org-level-2 ((,class (:foreground ,fl-blue :weight bold))))
   `(org-level-3 ((,class (:foreground ,magenta :weight bold))))
   `(org-level-4 ((,class (:foreground ,cyan :weight bold))))

   ;; Diff
   `(diff-added ((,class (:background ,fl-green :foreground ,black))))
   `(diff-removed ((,class (:background ,fl-red :foreground ,white))))
   `(diff-changed ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Which-function
   `(which-func ((,class (:foreground ,fl-blue))))

   ;; Vertical border
   `(vertical-border ((,class (:foreground ,gray))))

   ;; Tooltips
   `(tooltip ((,class (:background ,white :foreground ,black))))

   ;; Match
   `(match ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Lazy highlight
   `(lazy-highlight ((,class (:background ,green :foreground ,black))))

   ;; Trailing whitespace
   `(trailing-whitespace ((,class (:background ,fl-red))))

   ;; Escape glyphs
   `(escape-glyph ((,class (:foreground ,fl-red))))

   ;; Compilation
   `(compilation-info ((,class (:foreground ,fl-blue :weight bold))))
   `(compilation-warning ((,class (:foreground ,fl-orange :weight bold))))
   `(compilation-error ((,class (:foreground ,fl-red :weight bold))))

   ;; Flycheck
   `(flycheck-error ((,class (:underline (:style wave :color ,fl-red)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,fl-orange)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,fl-blue)))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,yellow))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,fl-blue))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,green))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,magenta))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,cyan))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,olive))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,maroon))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,gray))))

   ;; Magit
   `(magit-section-title ((,class (:foreground ,green :weight bold))))
   `(magit-branch ((,class (:foreground ,fl-blue :weight bold))))
   `(magit-diff-added ((,class (:background ,fl-green :foreground ,black))))
   `(magit-diff-removed ((,class (:background ,fl-red :foreground ,white))))
   `(magit-diff-hunk-heading ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Company
   `(company-tooltip ((,class (:background ,black :foreground ,yellow))))
   `(company-tooltip-selection ((,class (:background ,blue :foreground ,green))))
   `(company-tooltip-common ((,class (:foreground ,fl-blue :weight bold))))
   `(company-tooltip-common-selection ((,class (:background ,blue :foreground ,fl-blue :weight bold))))

   ;; Ivy
   `(ivy-current-match ((,class (:background ,blue :foreground ,green))))
   `(ivy-minibuffer-match-face-1 ((,class (:background ,fl-yellow :foreground ,black))))
   `(ivy-minibuffer-match-face-2 ((,class (:background ,green :foreground ,black))))

   ;; Helm
   `(helm-selection ((,class (:background ,blue :foreground ,green))))
   `(helm-match ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Ediff
   `(ediff-current-diff-A ((,class (:background ,fl-red :foreground ,white))))
   `(ediff-current-diff-B ((,class (:background ,fl-green :foreground ,black))))
   `(ediff-fine-diff-A ((,class (:background ,fl-orange :foreground ,black))))
   `(ediff-fine-diff-B ((,class (:background ,green :foreground ,black))))

   ;; Custom
   `(custom-variable-tag ((,class (:foreground ,green :weight bold))))
   `(custom-group-tag ((,class (:foreground ,fl-blue :weight bold))))
   `(custom-state ((,class (:foreground ,fl-green :weight bold))))

   ;; Widget
   `(widget-field ((,class (:background ,gray :foreground ,black))))
   `(widget-button ((,class (:weight bold :foreground ,fl-blue))))
   `(widget-button-pressed ((,class (:foreground ,fl-red))))

   ;; Button
   `(button ((,class (:weight bold :foreground ,fl-blue))))

   ;; Link
   `(link ((,class (:foreground ,green :underline t))))
   `(highlight ((,class (:background ,green :foreground ,black :underline nil))))
   `(link-visited ((,class (:foreground ,fl-magenta :underline t))))


   ;; Header line
   `(header-line ((,class (:background ,black :foreground ,yellow :box nil))))

   ;; Tab line
   `(tab-line ((,class (:background ,maroon :foreground ,black))))
   `(tab-line-tab ((,class (:background ,black :foreground ,yellow :weight bold))))
   `(tab-line-tab-current ((,class (:background ,black :foreground ,yellow :weight bold))))

   ;; Centaur tabs
   `(centaur-tabs-selected ((,class (:background ,black :foreground ,yellow :weight bold :underline nil))))
   `(centaur-tabs-unselected ((,class (:background ,maroon :foreground ,fl-orange))))
   `(centaur-tabs-selected-modified ((,class (:background ,black :foreground ,yellow :weight bold :underline nil))))
   `(centaur-tabs-unselected-modified ((,class (:background ,gray :foreground ,black))))

   ;; Powerline (if used)
   `(powerline-active1 ((,class (:background ,black :foreground ,yellow))))
   `(powerline-active2 ((,class (:background ,black :foreground ,gray))))
   `(powerline-inactive1 ((,class (:background ,black :foreground ,gray))))
   `(powerline-inactive2 ((,class (:background ,black :foreground ,gray))))

   ;; Dashboard
   `(dashboard-banner-logo-title ((,class (:foreground ,green :weight bold :height 1.2))))
   `(dashboard-items-face ((,class (:foreground ,yellow))))

   ;; Calendar
   `(calendar-today ((,class (:background ,blue :foreground ,green))))
   `(calendar-holiday ((,class (:foreground ,fl-red :weight bold))))

   ;; EWW
   `(eww-invalid-certificate ((,class (:foreground ,fl-red :weight bold))))
   `(eww-form-submit ((,class (:foreground ,green :weight bold))))

   ;; Gnus
   `(gnus-header-from ((,class (:foreground ,fl-blue :weight bold))))
   `(gnus-header-subject ((,class (:foreground ,yellow))))
   `(gnus-header-newsgroups ((,class (:foreground ,magenta))))
   `(gnus-header-name ((,class (:foreground ,cyan))))

   ;; Message
   `(message-header-name ((,class (:foreground ,cyan))))
   `(message-header-from ((,class (:foreground ,fl-blue :weight bold))))
   `(message-header-to ((,class (:foreground ,green :weight bold))))
   `(message-header-cc ((,class (:foreground ,magenta))))
   `(message-header-subject ((,class (:foreground ,yellow :weight bold))))
   `(message-separator ((,class (:foreground ,gray))))

   ;; Term
   `(term-color-black ((,class (:foreground ,black :background ,black))))
   `(term-color-red ((,class (:foreground ,fl-red :background ,fl-red))))
   `(term-color-green ((,class (:foreground ,fl-green :background ,fl-green))))
   `(term-color-yellow ((,class (:foreground ,fl-yellow :background ,fl-yellow))))
   `(term-color-blue ((,class (:foreground ,fl-blue :background ,fl-blue))))
   `(term-color-magenta ((,class (:foreground ,fl-magenta :background ,fl-magenta))))
   `(term-color-cyan ((,class (:foreground ,green :background ,green))))
   `(term-color-white ((,class (:foreground ,white :background ,white))))
   `(term-default-fg ((,class (:foreground ,yellow))))
   `(term-default-bg ((,class (:background ,black))))

   ;; Man
   `(Man-overstrike ((,class (:foreground ,green :weight bold))))
   `(Man-underline ((,class (:foreground ,fl-blue :underline t))))

   ;; Info
   `(info-title-1 ((,class (:foreground ,green :weight bold :height 1.4))))
   `(info-title-2 ((,class (:foreground ,fl-blue :weight bold :height 1.2))))
   `(info-title-3 ((,class (:foreground ,magenta :weight bold))))
   `(info-title-4 ((,class (:foreground ,cyan :weight bold))))

   ;; Outline
   `(outline-1 ((,class (:foreground ,green :weight bold))))
   `(outline-2 ((,class (:foreground ,fl-blue :weight bold))))
   `(outline-3 ((,class (:foreground ,magenta :weight bold))))
   `(outline-4 ((,class (:foreground ,cyan :weight bold))))

   ;; LaTeX
   `(font-latex-bold-face ((,class (:foreground ,green :weight bold))))
   `(font-latex-italic-face ((,class (:foreground ,fl-blue :slant italic))))
   `(font-latex-math-face ((,class (:foreground ,magenta))))
   `(font-latex-sectioning-0-face ((,class (:foreground ,green :weight bold))))
   `(font-latex-sectioning-1-face ((,class (:foreground ,fl-blue :weight bold))))
   `(font-latex-sectioning-2-face ((,class (:foreground ,magenta :weight bold))))
   `(font-latex-sectioning-3-face ((,class (:foreground ,cyan :weight bold))))

   ;; Python
   `(python-exception-face ((,class (:foreground ,fl-red :weight bold))))
   `(python-rx-const-face ((,class (:foreground ,green))))

   ;; JSON
   `(json-key ((,class (:foreground ,fl-blue :weight bold))))
   `(json-string ((,class (:foreground ,fl-orange))))
   `(json-number ((,class (:foreground ,fl-green))))
   `(json-boolean ((,class (:foreground ,magenta :weight bold))))
   `(json-null ((,class (:foreground ,gray :slant italic))))

   ;; Web mode
   `(web-mode-html-tag-face ((,class (:foreground ,fl-blue :weight bold))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,green))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,fl-orange))))
   `(web-mode-css-selector ((,class (:foreground ,magenta :weight bold))))
   `(web-mode-css-property-name ((,class (:foreground ,cyan))))
   `(web-mode-css-property-value ((,class (:foreground ,fl-green))))

   ;; Markdown
   `(markdown-header-face-1 ((,class (:foreground ,green :weight bold :height 1.2))))
   `(markdown-header-face-2 ((,class (:foreground ,fl-blue :weight bold :height 1.1))))
   `(markdown-header-face-3 ((,class (:foreground ,magenta :weight bold))))
   `(markdown-header-face-4 ((,class (:foreground ,cyan :weight bold))))
   `(markdown-bold-face ((,class (:weight bold))))
   `(markdown-italic-face ((,class (:slant italic))))
   `(markdown-inline-code-face ((,class (:foreground ,fl-orange :background ,gray))))

   ;; Shell script
   `(sh-heredoc ((,class (:foreground ,fl-orange :slant italic))))
   `(sh-quoted-exec ((,class (:foreground ,fl-green))))

   ;; C/C++
   `(c-annotation-face ((,class (:foreground ,magenta))))
   `(c-font-lock-enum-face ((,class (:foreground ,cyan))))

   ;; Lisp
   `(lisp-face ((,class (:foreground ,magenta))))
   `(lisp-keyword-face ((,class (:foreground ,fl-magenta :weight bold))))

   ;; Elisp
   `(elisp-byte-code-face ((,class (:foreground ,green))))

   ;; Prog mode
   `(prog-mode-face ((,class (:foreground ,yellow))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,gray :background ,black))))
   `(whitespace-tab ((,class (:foreground ,gray :background ,black))))
   `(whitespace-newline ((,class (:foreground ,gray :background ,black))))
   `(whitespace-trailing ((,class (:background ,fl-red :foreground ,white))))
   `(whitespace-line ((,class (:background ,fl-yellow :foreground ,black))))
   `(whitespace-space-after-tab ((,class (:background ,fl-orange :foreground ,black))))

   ;; Column marker
   `(column-marker-1 ((,class (:background ,fl-yellow))))
   `(column-marker-2 ((,class (:background ,green))))
   `(column-marker-3 ((,class (:background ,fl-magenta))))

   ;; Highlight symbol
   `(highlight-symbol-face ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Highlight current symbol
   `(highlight-current-symbol-face ((,class (:background ,blue :foreground ,green))))

   ;; Highlight indentation
   `(highlight-indentation-face ((,class (:background ,gray))))
   `(highlight-indentation-current-column-face ((,class (:background ,fl-yellow))))

   ;; Auto highlight symbol
   `(auto-highlight-symbol-face ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Iedit
   `(iedit-occurrence ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Multiple cursors
   `(multiple-cursors ((,class (:background ,blue :foreground ,green))))

   ;; Avy
   `(avy-lead-face ((,class (:background ,fl-red :foreground ,white :weight bold))))
   `(avy-lead-face-0 ((,class (:background ,fl-green :foreground ,black :weight bold))))
   `(avy-lead-face-1 ((,class (:background ,fl-blue :foreground ,white :weight bold))))
   `(avy-lead-face-2 ((,class (:background ,fl-magenta :foreground ,white :weight bold))))

   ;; Ace jump
   `(ace-jump-face-background ((,class (:foreground ,gray))))
   `(ace-jump-face-foreground ((,class (:foreground ,fl-red :weight bold))))

   ;; Guide key
   `(guide-key/key-face ((,class (:foreground ,fl-blue :weight bold))))

   ;; Which key
   `(which-key-key-face ((,class (:foreground ,fl-blue :weight bold))))
   `(which-key-group-description-face ((,class (:foreground ,green))))

   ;; Undo tree
   `(undo-tree-visualizer-current-face ((,class (:foreground ,fl-green :weight bold))))
   `(undo-tree-visualizer-default-face ((,class (:foreground ,yellow))))
   `(undo-tree-visualizer-register-face ((,class (:foreground ,fl-red))))

   ;; Git gutter
   `(git-gutter:added ((,class (:foreground ,fl-green :weight bold))))
   `(git-gutter:modified ((,class (:foreground ,fl-yellow :weight bold))))
   `(git-gutter:deleted ((,class (:foreground ,fl-red :weight bold))))

   ;; Diff-hl
   `(diff-hl-insert ((,class (:foreground ,fl-green :weight bold))))
   `(diff-hl-delete ((,class (:foreground ,fl-red :weight bold))))
   `(diff-hl-change ((,class (:foreground ,fl-yellow :weight bold))))

   ;; Neo tree
   `(neo-root-dir-face ((,class (:foreground ,green :weight bold))))
   `(neo-file-link-face ((,class (:foreground ,yellow))))
   `(neo-dir-link-face ((,class (:foreground ,fl-blue :weight bold))))
   `(neo-expand-btn-face ((,class (:foreground ,gray))))

   ;; Treemacs
   `(treemacs-root-face ((,class (:foreground ,green :weight bold))))
   `(treemacs-file-face ((,class (:foreground ,yellow))))
   `(treemacs-directory-face ((,class (:foreground ,fl-blue :weight bold))))
   `(treemacs-git-added-face ((,class (:foreground ,fl-green))))
   `(treemacs-git-modified-face ((,class (:foreground ,fl-yellow))))
   `(treemacs-git-ignored-face ((,class (:foreground ,gray))))

   ;; Dired+
   `(diredp-file-name ((,class (:foreground ,yellow))))
   `(diredp-dir-name ((,class (:foreground ,fl-blue :weight bold))))
   `(diredp-symlink ((,class (:foreground ,magenta :slant italic))))

   ;; All-the-icons
   `(all-the-icons-red ((,class (:foreground ,fl-red))))
   `(all-the-icons-green ((,class (:foreground ,fl-green))))
   `(all-the-icons-blue ((,class (:foreground ,fl-blue))))
   `(all-the-icons-cyan ((,class (:foreground ,green))))
   `(all-the-icons-magenta ((,class (:foreground ,fl-magenta))))
   `(all-the-icons-yellow ((,class (:foreground ,fl-yellow))))
   `(all-the-icons-orange ((,class (:foreground ,fl-orange))))

   ;; Perspective
   `(persp-selected-face ((,class (:foreground ,fl-green :weight bold))))
   ;; Doom modeline
   `(doom-modeline-bar ((,class (:background ,fl-green))))
   `(doom-modeline-buffer-path ((,class (:foreground ,yellow :weight bold))))
   `(doom-modeline-buffer-file ((,class (:foreground ,yellow :weight bold))))
   `(doom-modeline-project-root ((,class (:foreground ,green :weight bold))))
   `(doom-modeline-project-doom ((,class (:foreground ,fl-blue :weight bold))))
   `(doom-modeline-project-dev ((,class (:foreground ,magenta :weight bold))))
   `(doom-modeline-buffer-modified ((,class (:foreground ,fl-red :weight bold))))

   ;; Spaceline
   `(spaceline-flycheck-error ((,class (:foreground ,fl-red :weight bold))))
   `(spaceline-flycheck-warning ((,class (:foreground ,fl-orange :weight bold))))
   `(spaceline-flycheck-info ((,class (:foreground ,fl-blue :weight bold))))

   ;; Solaire mode
   `(solaire-default-face ((,class (:background ,black :foreground ,yellow))))
   `(solaire-minibuffer-face ((,class (:background ,black :foreground ,yellow))))
   `(solaire-hl-line-face ((,class (:background ,fl-blue))))
   `(solaire-org-hide-face ((,class (:foreground ,black))))

   ;; Consult
   `(consult-preview-insertion ((,class (:background ,blue :foreground ,green))))
   `(consult-preview-line ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Corfu
   `(corfu-default ((,class (:background ,black :foreground ,yellow))))
   `(corfu-current ((,class (:background ,blue :foreground ,green))))

   ;; Orderless
   `(orderless-match-face-0 ((,class (:foreground ,black :background ,fl-red :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,black :background ,fl-orange :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,white :background ,fl-blue :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,white :background ,fl-magenta :weight bold))))

   ;; Marginalia
   `(marginalia-char ((,class (:foreground ,green))))
   `(marginalia-date ((,class (:foreground ,fl-green))))
   `(marginalia-documentation ((,class (:foreground ,gray))))
   `(marginalia-key ((,class (:foreground ,fl-red))))
   `(marginalia-number ((,class (:foreground ,fl-yellow))))
   `(marginalia-symbol ((,class (:foreground ,fl-magenta))))

   ;; Embark
   `(embark-key ((,class (:foreground ,fl-red :weight bold))))
   `(embark-indicator ((,class (:foreground ,fl-blue :weight bold))))

   ;; Vertico
   `(vertico-current ((,class (:background ,blue :foreground ,green))))

   ;; Mct
   `(mct-minibuffer-match ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Icomplete
   `(icomplete-first-match ((,class (:foreground ,fl-green :weight bold))))

   ;; Recentf
   `(recentf-item ((,class (:foreground ,yellow))))

   ;; Bookmark
   `(bookmark-menu-bookmark ((,class (:foreground ,yellow))))
   `(bookmark-menu-heading ((,class (:foreground ,green :weight bold))))

   ;; Buffer menu
   `(Buffer-menu-buffer ((,class (:foreground ,yellow))))
   `(Buffer-menu-marked ((,class (:foreground ,fl-green :weight bold))))

   ;; Completion
   `(completions-first-difference ((,class (:foreground ,fl-red :weight bold))))

   ;; Electric
   `(electric-pair-overlay ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Paren
   `(paren-face-match ((,class (:background ,fl-yellow :foreground ,black))))
   `(paren-face-mismatch ((,class (:background ,fl-red :foreground ,white))))
   `(paren-face-no-match ((,class (:background ,fl-orange :foreground ,black))))

   ;; Anzu
   `(anzu-mode-line ((,class (:foreground ,fl-blue :weight bold))))

   ;; Evil
   `(evil-ex-lazy-highlight ((,class (:background ,green :foreground ,black))))
   `(evil-ex-substitute-matches ((,class (:background ,fl-red :foreground ,white))))

   ;; Lsp
   `(lsp-face-highlight-read ((,class (:background ,fl-yellow :foreground ,black))))
   `(lsp-face-highlight-textual ((,class (:background ,blue :foreground ,green))))
   `(lsp-face-highlight-write ((,class (:background ,fl-red :foreground ,white))))

   ;; Tree-sitter
   `(tree-sitter-hl-face:annotation ((,class (:foreground ,magenta))))
   `(tree-sitter-hl-face:attribute ((,class (:foreground ,fl-blue))))
   `(tree-sitter-hl-face:boolean ((,class (:foreground ,magenta :weight bold))))
   `(tree-sitter-hl-face:builtin ((,class (:foreground ,fl-magenta))))
   `(tree-sitter-hl-face:comment ((,class (:foreground ,gray :slant italic))))
   `(tree-sitter-hl-face:constant ((,class (:foreground ,fl-blue))))
   `(tree-sitter-hl-face:constructor ((,class (:foreground ,green :weight bold))))
   `(tree-sitter-hl-face:function ((,class (:foreground ,green :weight bold))))
   `(tree-sitter-hl-face:function.call ((,class (:foreground ,yellow))))
   `(tree-sitter-hl-face:function.macro ((,class (:foreground ,fl-magenta))))
   `(tree-sitter-hl-face:label ((,class (:foreground ,olive))))
   `(tree-sitter-hl-face:method ((,class (:foreground ,green :weight bold))))
   `(tree-sitter-hl-face:method.call ((,class (:foreground ,yellow))))
   `(tree-sitter-hl-face:number ((,class (:foreground ,fl-green))))
   `(tree-sitter-hl-face:operator ((,class (:foreground ,fl-blue))))
   `(tree-sitter-hl-face:property ((,class (:foreground ,cyan))))
   `(tree-sitter-hl-face:punctuation ((,class (:foreground ,gray))))
   `(tree-sitter-hl-face:punctuation.bracket ((,class (:foreground ,yellow))))
   `(tree-sitter-hl-face:punctuation.delimiter ((,class (:foreground ,gray))))
   `(tree-sitter-hl-face:punctuation.special ((,class (:foreground ,fl-red))))
   `(tree-sitter-hl-face:string ((,class (:foreground ,fl-orange))))
   `(tree-sitter-hl-face:string.special ((,class (:foreground ,fl-orange :slant italic))))
   `(tree-sitter-hl-face:tag ((,class (:foreground ,fl-blue :weight bold))))
   `(tree-sitter-hl-face:type ((,class (:foreground ,magenta))))
   `(tree-sitter-hl-face:type.parameter ((,class (:foreground ,cyan))))
   `(tree-sitter-hl-face:variable ((,class (:foreground ,yellow))))
   `(tree-sitter-hl-face:variable.parameter ((,class (:foreground ,cyan))))

   ;; Semantic
   `(semantic-tag-func ((,class (:foreground ,green :weight bold))))
   `(semantic-tag-var ((,class (:foreground ,yellow))))
   `(semantic-tag-type ((,class (:foreground ,magenta))))
   `(semantic-tag-keyword ((,class (:foreground ,fl-magenta :weight bold))))

   ;; CEDET
   `(cedet-format-tag-function ((,class (:foreground ,green :weight bold))))
   `(cedet-format-tag-variable ((,class (:foreground ,yellow))))
   `(cedet-format-tag-type ((,class (:foreground ,magenta))))
   `(cedet-format-tag-class ((,class (:foreground ,fl-blue :weight bold))))

   ;; EDE
   `(ede-tab-active ((,class (:background ,black :foreground ,yellow :weight bold :underline t))))
   `(ede-tab-inactive ((,class (:background ,black :foreground ,gray))))

   ;; Speedbar
   `(speedbar-button-face ((,class (:foreground ,fl-blue :weight bold))))
   `(speedbar-file-face ((,class (:foreground ,yellow))))
   `(speedbar-directory-face ((,class (:foreground ,fl-blue :weight bold))))
   `(speedbar-tag-face ((,class (:foreground ,green))))

   ;; Imenu
   `(imenu-list-entry-face-0 ((,class (:foreground ,green :weight bold))))
   `(imenu-list-entry-face-1 ((,class (:foreground ,fl-blue :weight bold))))
   `(imenu-list-entry-face-2 ((,class (:foreground ,magenta :weight bold))))
   `(imenu-list-entry-face-3 ((,class (:foreground ,cyan :weight bold))))

   ;; Occur
   `(occur-match ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Grep
   `(grep-match-face ((,class (:background ,fl-yellow :foreground ,black))))
   `(grep-context-face ((,class (:foreground ,gray))))
   `(grep-error-face ((,class (:foreground ,fl-red :weight bold))))

   ;; Compilation
   `(compilation-line-number ((,class (:foreground ,fl-blue))))
   `(compilation-column-number ((,class (:foreground ,green))))

   ;; Debugger
   `(debugger-locals ((,class (:foreground ,yellow))))
   `(debugger-stack-frame ((,class (:foreground ,green :weight bold))))

   ;; Profiler
   `(profiler-called-function-name ((,class (:foreground ,green :weight bold))))
   `(profiler-calling-function-name ((,class (:foreground ,fl-blue :weight bold))))

   ;; Edebug
   `(edebug-enabled-face ((,class (:background ,blue :foreground ,green))))

   ;; Macro
   `(kmacro-key-sequence ((,class (:foreground ,fl-red :weight bold))))

   ;; Repeat
   `(repeat-mode-prompt ((,class (:foreground ,fl-blue :weight bold))))

   ;; Saveplace
   `(save-place ((,class (:foreground ,fl-green :weight bold))))

   ;; Recentf
   `(recentf-item ((,class (:foreground ,yellow))))

   ;; Ring
   `(ring-highlight ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Skeleton
   `(skeleton-face ((,class (:foreground ,fl-orange))))

   ;; Sort
   `(sort-column ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Tar mode
   `(tar-file ((,class (:foreground ,yellow))))
   `(tar-header ((,class (:foreground ,fl-blue :weight bold))))

   ;; Term mode
   `(term-bold ((,class (:weight bold))))
   `(term-underline ((,class (:underline t))))

   ;; Tetris
   `(tetris-x-face ((,class (:foreground ,fl-red))))
   `(tetris-y-face ((,class (:foreground ,fl-green))))

   ;; Time
   `(time ((,class (:foreground ,fl-blue))))

   ;; Timer
   `(timer ((,class (:foreground ,fl-orange))))

   ;; Todo
   `(todo ((,class (:foreground ,fl-red :weight bold))))

   ;; Type
   `(type ((,class (:foreground ,magenta))))

   ;; Undo
   `(undo ((,class (:foreground ,fl-green :weight bold))))

   ;; VC
   `(vc-annotate-face-0046FF ((,class (:foreground ,fl-blue))))
   `(vc-annotate-face-00FF00 ((,class (:foreground ,fl-green))))
   `(vc-annotate-face-FF0000 ((,class (:foreground ,fl-red))))

   ;; Version control
   `(vc-dir-file-name ((,class (:foreground ,yellow))))
   `(vc-dir-header ((,class (:foreground ,green :weight bold))))
   `(vc-dir-marked ((,class (:foreground ,fl-green :weight bold))))

   ;; View
   `(view ((,class (:foreground ,yellow))))

   ;; Visible bookmarks
   `(visible-bookmark ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Widget
   `(widget ((,class (:foreground ,yellow))))

   ;; Window
   `(window ((,class (:foreground ,yellow))))

   ;; Woman
   `(woman-bold ((,class (:foreground ,green :weight bold))))
   `(woman-italic ((,class (:foreground ,fl-blue :slant italic))))

   ;; Xref
   `(xref-file-header ((,class (:foreground ,green :weight bold))))
   `(xref-file-prefix ((,class (:foreground ,fl-blue))))
   `(xref-found ((,class (:foreground ,yellow))))
   `(xref-match ((,class (:background ,fl-yellow :foreground ,black))))

   ;; Yank
   `(yank ((,class (:background ,blue :foreground ,green))))

   ;; Zebra
   `(zebra ((,class (:background ,blue))))

   ;; Zoom
   `(zoom ((,class (:foreground ,fl-blue :weight bold))))

   ;; Zone
   `(zone ((,class (:foreground ,fl-red))))

   ;; Ztree
   `(ztree-diff-model-add ((,class (:foreground ,fl-green))))
   `(ztree-diff-model-del ((,class (:foreground ,fl-red))))
   `(ztree-diff-model-ignored ((,class (:foreground ,gray))))
   `(ztree-diff-model-normal ((,class (:foreground ,yellow))))
   `(ztree-diff-node ((,class (:foreground ,fl-blue :weight bold))))
   `(ztree-expand-sign ((,class (:foreground ,gray))))
   `(ztree-header ((,class (:foreground ,green :weight bold))))
   `(ztree-last-node ((,class (:foreground ,yellow))))
   `(ztree-node ((,class (:foreground ,yellow))))
   `(ztree-leaf ((,class (:foreground ,yellow))))

   ;; End of faces
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'usgc-polyimide-st)

;; End:

;;; usgc-polyimide-st-theme.el ends here
