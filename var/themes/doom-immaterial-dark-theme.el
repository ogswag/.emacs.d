;;; doom-immaterial-dark-theme.el --- A dark immaterial theme variant for Doom Emacs -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) 2019-2025 Peter Gardfjäll
;; Author: Peter Gardfjäll
;; Source: https://github.com/petergardfjall/emacs-immaterial-theme/
;; Doom port: 2025
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-immaterial-dark-theme nil
  "Options for the `doom-immaterial-dark' theme."
  :group 'doom-themes)

(defcustom doom-immaterial-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-immaterial-dark-theme
  :type 'boolean)

(defcustom doom-immaterial-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-immaterial-dark-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-immaterial-dark
    "A dark theme based on material design colors."

  ;; name        default   256       16
  (
   ;; Base colors
   (base0        '("#000a0f" "black" "black"))
   (base1        '("#001b21" "#1e1e1e" "brightblack"))
   (base2        '("#01343f" "#2e2e2e" "brightblack"))
   (base3        '("#0a4652" "#262626" "brightblack"))
   (base4        '("#1d565f" "#3f3f3f" "brightblack"))
   (base5        '("#4a6a70" "#525252" "brightblack"))
   (base6        '("#6d868c" "#6b6b6b" "brightblack"))
   (base7        '("#9aacb0" "#979797" "brightblack"))
   (base8        '("#ccd5d8" "#dfdfdf" "white"))

   (bg           '("#012027" "black" "black"))
   (bg-alt       '("#001b21" "black" "black"))

   (fg          '("#dddddd" "#bfbfbf" "brightwhite"))
   (fg-alt      '("#c8c8c8" "#2d2d2d" "white"))
   (fg-dim      '("#848484" "#777777" "white"))

   ;; Semantic colors
   (grey         '("#848484" "#777777" "white"))
   (red          '("#EF9A9A" "red" "red"))
   (orange       '("#FFAB91" "orange" "orange"))
   (green        '("#C5E1A5" "green" "green"))
   (teal         '("#80CBC4" "teal" "teal"))
   (yellow       '("#FFCA28" "yellow" "yellow"))
   (blue         '("#90CAF9" "blue" "blue"))
   (dark-blue    '("#42A5F5" "blue" "blue"))
   (magenta      '("#B39DDB" "magenta" "magenta"))
   (violet       '("#CE93D8" "magenta" "magenta"))
   (cyan         '("#80DEEA" "cyan" "cyan"))
   (dark-cyan    '("#4DD0E1" "cyan" "cyan"))

   ;; Additional colors from immaterial-dark palette
   (red-warmer   '("#FFAB91" "red" "red"))
   (red-cooler   '("#F48FB1" "red" "red"))
   (red-faint    '("#d95f5f" "red" "red"))
   (red-intense  '("#E53935" "red" "red"))

   (green-warmer '("#66BB6A" "green" "green"))
   (green-cooler '("#D4E157" "green" "green"))
   (green-faint  '("#8BC34A" "green" "green"))
   (green-intense '("#7CB342" "green" "green"))

   (yellow-warmer '("#FFA726" "yellow" "yellow"))
   (yellow-cooler '("#FFEE58" "yellow" "yellow"))
   (yellow-faint  '("#FFECB3" "yellow" "yellow"))
   (amber         '("#FF8F00" "orange" "orange"))

   (blue-warmer  '("#9FA8DA" "blue" "blue"))
   (blue-cooler  '("#81D4FA" "blue" "blue"))
   (blue-faint   '("#74b5f7" "blue" "blue"))

   (magenta-warmer '("#CE93D8" "magenta" "magenta"))
   (magenta-cooler '("#9FA8DA" "magenta" "magenta"))
   (magenta-faint  '("#a78cd8" "magenta" "magenta"))
   (magenta-intense '("#9575CD" "magenta" "magenta"))

   (cyan-warmer  '("#80CBC4" "cyan" "cyan"))
   (cyan-cooler  '("#81D4FA" "cyan" "cyan"))
   (cyan-faint   '("#6dd5e0" "cyan" "cyan"))
   (cyan-intense '("#4DD0E1" "cyan" "cyan"))

   (teal-intense '("#4DB6AC" "teal" "teal"))

   ;; UI colors
   (highlight      '("#01343f" "#1c1c1c" "brightblack"))
   (vertical-bar   '("#001b21" "#000000" "black"))
   (selection      '("#004346" "#444444" "brightblack"))
   (builtin        magenta)
   (comments       '("#848484" "#777777" "white"))
   (doc-comments   '("#9aacb0" "#999999" "brightblack"))
   (constants      blue)
   (functions      magenta)
   (keywords       teal-intense)
   (methods        magenta)
   (operators      fg)
   (type           fg)
   (strings        blue)
   (variables      green)
   (numbers        fg)
   (region         highlight)
   (error          red)
   (warning        amber)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; Custom categories
   (level-1 magenta)
   (level-2 green)
   (level-3 blue)
   (level-4 yellow)
   (level-5 cyan)
   (level-6 magenta-warmer)
   (level-7 green-cooler)
   (level-8 blue-cooler)

   ;; Modeline
   (modeline-bg     (if doom-immaterial-dark-brighter-modeline base3 bg-alt))
   (modeline-bg-alt (if doom-immaterial-dark-brighter-modeline base1 bg))
   (modeline-fg     fg)
   (modeline-fg-alt '("#4a6a70" "#666666" "brightblack"))

   ;; Launcher
   (launcher-bg bg-alt)
   (launcher-fg fg-alt)

   ;; Window dividers
   (window-divider        vertical-bar)
   (window-divider-first-pixel vertical-bar)
   (window-divider-last-pixel  vertical-bar)

   ;; Line numbers
   (line-number          comments)
   (line-number-current  fg)
   )

  ;; Faces
  (
   (cursor :background amber)

   ;; Defaults
   (default :background bg :foreground fg)
   (bold :inherit 'default :weight 'bold)
   (fringe :background bg-alt :foreground fg-dim)

   ;; Mode line
   (doom-modeline-bar :background (if doom-immaterial-dark-brighter-modeline magenta magenta))
   (doom-modeline-project-dir :foreground cyan :weight 'bold)
   (doom-modeline-buffer-path :inherit 'bold :foreground fg)
   (doom-modeline-buffer-file :inherit 'bold :foreground fg)
   (doom-modeline-buffer-modified :inherit 'bold :foreground warning)
   (doom-modeline-error :background bg)
   (doom-modeline-warning :background bg)
   (doom-modeline-info :background bg)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if doom-immaterial-dark-padded-modeline
             `(:line-width ,doom-immaterial-dark-padded-modeline :color ,modeline-bg)
           nil))
   (mode-line-inactive
    :background modeline-bg-alt :foreground modeline-fg-alt
    :box (if doom-immaterial-dark-padded-modeline
             `(:line-width ,doom-immaterial-dark-padded-modeline :color ,modeline-bg-alt)
           nil))
   (mode-line-emphasis :foreground (if doom-immaterial-dark-brighter-modeline base8 highlight))
   (mode-line-highlight :background selection :foreground base8 :distant-foreground base0)

   ;; Font lock
   (font-lock-builtin-face :foreground builtin)
   (font-lock-comment-face :foreground comments :slant 'italic)
   (font-lock-comment-delimiter-face :foreground comments)
   (font-lock-doc-face :foreground doc-comments :slant 'italic)
   (font-lock-constant-face :foreground constants)
   (font-lock-function-name-face :foreground functions)
   (font-lock-keyword-face :foreground keywords :weight 'bold)
   (font-lock-string-face :foreground strings)
   (font-lock-type-face :foreground type)
   (font-lock-variable-name-face :foreground green)
   (font-lock-variable-use-face :foreground fg)
   (font-lock-warning-face :foreground warning :background bg)
   (font-lock-preprocessor-face :foreground red-warmer)
   (font-lock-operator-face :foreground operators)

   ;; Highlight
   (highlight :background selection)
   (hl-line :background highlight :extend t)
   (region :background selection :extend t)
   (match :background nil :foreground amber :weight 'bold)

   ;; Line numbers
   (line-number :inherit 'default :foreground line-number :distant-foreground nil)
   (line-number-current-line :inherit 'default :foreground line-number-current :weight 'bold)

   ;; UI
   (vertical-border :background vertical-bar :foreground vertical-bar)
   (window-divider :foreground window-divider)
   (window-divider-first-pixel :foreground window-divider-first-pixel)
   (window-divider-last-pixel :foreground window-divider-last-pixel)
   (header-line :background bg-alt :foreground fg-alt)
   (tooltip :background bg-alt :foreground fg)
   (minibuffer-prompt :foreground amber :weight 'bold)
   (show-paren-match :background nil :foreground amber :weight 'bold)
   (show-paren-mismatch :background red :foreground bg)
   (whitespace-tab :background bg-alt :foreground fg-dim)

   ;; Buttons & links
   (button :foreground cyan-warmer :underline t)
   (link :foreground cyan-warmer :underline t)
   (link-visited :foreground magenta :underline t)

   ;; Search
   (isearch :background green :foreground bg :weight 'bold)
   (isearch-fail :background red :foreground fg)
   (lazy-highlight :background cyan-warmer :foreground bg)

   ;; Dired
   (dired-directory :foreground cyan)
   (dired-ignored :foreground comments)
   (dired-flagged :foreground red)
   (dired-marked :foreground magenta)

   ;; outline
   (outline-1 :foreground fg :weight 'bold :height 1.4)
   (outline-2 :foreground fg :weight 'bold :height 1.3)
   (outline-3 :foreground fg :weight 'bold :height 1.2)
   (outline-4 :foreground fg :weight 'bold :height 1.1)
   (outline-5 :foreground fg :weight 'bold)
   (outline-6 :foreground fg :weight 'bold)
   (outline-7 :foreground fg :weight 'bold)
   (outline-8 :foreground fg :weight 'bold)

   ;; Org
   (org-level-1 :foreground level-1 :weight 'bold :height 1.4)
   (org-level-2 :foreground level-2 :weight 'bold :height 1.3)
   (org-level-3 :foreground level-3 :weight 'bold :height 1.2)
   (org-level-4 :foreground level-4 :weight 'bold :height 1.1)
   (org-level-5 :foreground level-5 :weight 'bold)
   (org-level-6 :foreground level-6 :weight 'bold)
   (org-level-7 :foreground level-7 :weight 'bold)
   (org-level-8 :foreground level-8 :weight 'bold)
   (org-todo :foreground red :weight 'bold)
   (org-done :foreground green :weight 'bold)
   (org-date :foreground cyan :underline nil)
   (org-special-keyword :foreground magenta-faint)
   (org-document-title :foreground cyan :weight 'bold :height 1.4)
   (org-document-info :foreground cyan)
   (org-document-info-keyword :foreground comments)
   (org-code :foreground yellow :background bg-alt)
   (org-verbatim :foreground green :background bg-alt)
   (org-quote :foreground fg-alt :slant 'italic)
   (org-hide :foreground bg)
   (org-checkbox :foreground cyan)
   (org-table :foreground blue)
   (org-formula :foreground yellow)
   (org-tag :foreground magenta-faint :weight 'normal)
   (org-link :foreground cyan :underline t)
   (org-ellipsis :foreground comments :underline nil)
   (org-footnote :foreground cyan)
   (org-block :background bg-alt :extend t)
   (org-block-begin-line :background bg-alt :foreground comments :extend t)
   (org-block-end-line :background bg-alt :foreground comments :extend t)

   ;; Company
   (company-tooltip :background bg-alt :foreground fg)
   (company-tooltip-common :foreground cyan)
   (company-tooltip-search :background cyan :foreground bg)
   (company-tooltip-selection :background selection)
   (company-tooltip-scrollbar-thumb :background base4)
   (company-tooltip-scrollbar-track :background bg-alt)
   (company-tooltip-annotation :foreground comments)
   (company-tooltip-annotation-selection :foreground cyan)
   (company-scrollbar-bg :background bg-alt)
   (company-scrollbar-fg :background base4)
   (company-preview :foreground cyan)
   (company-preview-common :foreground cyan)
   (company-preview-search :background cyan :foreground bg)

   ;; Ivy/Selectrum/Helm
   (ivy-current-match :background selection :extend t)
   (ivy-minibuffer-match-face-1 :foreground cyan :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground magenta :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground green :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground yellow :weight 'bold)
   (ivy-grep-info :foreground cyan)
   (ivy-grep-line-number :foreground comments)
   (ivy-confirm-face :foreground green)
   (ivy-match-required-face :foreground red)
   (ivy-virtual :foreground comments)
   (ivy-remote :foreground cyan)
   (ivy-modified-buffer :foreground yellow)

   ;; Magit
   (magit-section-heading :foreground cyan :weight 'bold)
   (magit-section-highlight :background bg-alt)
   (magit-branch-local :foreground cyan)
   (magit-branch-remote :foreground green)
   (magit-tag :foreground yellow)
   (magit-hash :foreground comments)
   (magit-dim-hash :foreground fg-dim)
   (magit-diff-file-heading :foreground fg)
   (magit-diff-file-heading-highlight :background selection)
   (magit-diff-hunk-heading :background bg-alt :foreground fg-dim)
   (magit-diff-hunk-heading-highlight :background selection :foreground magenta :weight 'bold)
   (magit-diff-added :background "#033521" :foreground fg-dim)
   (magit-diff-added-highlight :background "#175b2b" :foreground green)
   (magit-diff-removed :background "#3b0f19" :foreground fg-dim)
   (magit-diff-removed-highlight :background "#8d2323" :foreground red)
   (magit-diff-context :foreground fg-alt)
   (magit-diff-context-highlight :background bg-alt :foreground fg)
   (magit-diffstat-added :foreground green)
   (magit-diffstat-removed :foreground red)

   ;; Diff hl
   (diff-hl-change :foreground yellow)
   (diff-hl-delete :foreground red)
   (diff-hl-insert :foreground green)

   ;; Flycheck
   (flycheck-error :underline `(:style wave :color ,red))
   (flycheck-warning :underline `(:style wave :color ,yellow))
   (flycheck-info :underline `(:style wave :color ,cyan))
   (flycheck-fringe-error :foreground red)
   (flycheck-fringe-warning :foreground yellow)
   (flycheck-fringe-info :foreground cyan)

   ;; Rainbow delimiters
   (rainbow-delimiters-depth-1-face :foreground level-1)
   (rainbow-delimiters-depth-2-face :foreground level-2)
   (rainbow-delimiters-depth-3-face :foreground level-3)
   (rainbow-delimiters-depth-4-face :foreground level-4)
   (rainbow-delimiters-depth-5-face :foreground level-5)
   (rainbow-delimiters-depth-6-face :foreground level-6)
   (rainbow-delimiters-depth-7-face :foreground level-7)
   (rainbow-delimiters-depth-8-face :foreground level-8)

   ;; LSP
   (lsp-face-highlight-textual :background selection)
   (lsp-face-highlight-read :background selection)
   (lsp-face-highlight-write :background selection)
   (lsp-ui-doc-background :background bg-alt)
   (lsp-ui-doc-header :background bg :foreground cyan)
   (lsp-ui-peek-filename :foreground cyan :weight 'bold)
   (lsp-ui-peek-header :background bg :foreground fg :weight 'bold)
   (lsp-ui-peek-highlight :background selection)
   (lsp-ui-peek-list :background bg-alt)
   (lsp-ui-peek-peek :background bg-alt)
   (lsp-ui-peek-selection :background selection)
   (lsp-ui-sideline-code-action :foreground yellow)
   (lsp-ui-sideline-current-symbol :foreground cyan)
   (lsp-ui-sideline-symbol :foreground comments)

   ;; ;; Tree-sitter
   ;; (tree-sitter-hl-face:function :foreground functions)
   ;; (tree-sitter-hl-face:function.call :foreground functions)
   ;; (tree-sitter-hl-face:function.builtin :foreground builtin)
   ;; (tree-sitter-hl-face:function.macro :foreground red-cooler)
   ;; (tree-sitter-hl-face:function.special :foreground magenta-warmer)
   ;; (tree-sitter-hl-face:method :foreground functions)
   ;; (tree-sitter-hl-face:method.call :foreground functions)
   ;; (tree-sitter-hl-face:type :foreground type)
   ;; (tree-sitter-hl-face:type.parameter :foreground variables)
   ;; (tree-sitter-hl-face:type.argument :foreground variables)
   ;; (tree-sitter-hl-face:type.builtin :foreground builtin)
   ;; (tree-sitter-hl-face:type.super :foreground magenta-warmer)
   ;; (tree-sitter-hl-face:constructor :foreground cyan)
   ;; (tree-sitter-hl-face:variable :foreground variables)
   ;; (tree-sitter-hl-face:variable.parameter :foreground variables)
   ;; (tree-sitter-hl-face:variable.builtin :foreground builtin)
   ;; (tree-sitter-hl-face:variable.special :foreground magenta-warmer)
   ;; (tree-sitter-hl-face:property :foreground cyan)
   ;; (tree-sitter-hl-face:property.definition :foreground cyan)
   ;; (tree-sitter-hl-face:comment :foreground comments :slant 'italic)
   ;; (tree-sitter-hl-face:doc :foreground doc-comments :slant 'italic)
   ;; (tree-sitter-hl-face:string :foreground strings)
   ;; (tree-sitter-hl-face:string.special :foreground yellow)
   ;; (tree-sitter-hl-face:escape :foreground yellow)
   ;; (tree-sitter-hl-face:embedded :foreground cyan)
   ;; (tree-sitter-hl-face:keyword :foreground keywords :weight 'bold)
   ;; (tree-sitter-hl-face:operator :foreground operators)
   ;; (tree-sitter-hl-face:label :foreground cyan)
   ;; (tree-sitter-hl-face:constant :foreground constants)
   ;; (tree-sitter-hl-face:constant.builtin :foreground builtin)
   ;; (tree-sitter-hl-face:number :foreground numbers)
   ;; (tree-sitter-hl-face:boolean :foreground constants)
   ;; (tree-sitter-hl-face:punctuation :foreground operators)
   ;; (tree-sitter-hl-face:punctuation.bracket :foreground fg-alt)
   ;; (tree-sitter-hl-face:punctuation.delimiter :foreground operators)
   ;; (tree-sitter-hl-face:punctuation.special :foreground red-cooler)
   ;; (tree-sitter-hl-face:tag :foreground magenta)
   ;; (tree-sitter-hl-face:attribute :foreground cyan)

   ;; Markdown
   (markdown-header-face-1 :foreground level-1 :weight 'bold :height 1.3)
   (markdown-header-face-2 :foreground level-2 :weight 'bold :height 1.2)
   (markdown-header-face-3 :foreground level-3 :weight 'bold :height 1.1)
   (markdown-header-face-4 :foreground level-4 :weight 'bold)
   (markdown-header-face-5 :foreground level-5 :weight 'bold)
   (markdown-header-face-6 :foreground level-6 :weight 'bold)
   (markdown-markup-face :foreground comments)
   (markdown-code-face :foreground yellow :background bg-alt)
   (markdown-pre-face :foreground yellow :background bg-alt)
   (markdown-inline-code-face :foreground yellow :background bg-alt)
   (markdown-url-face :foreground cyan :underline t)
   (markdown-link-face :foreground cyan :underline t)
   (markdown-footnote-face :foreground cyan)
   (markdown-list-face :foreground cyan)
   (markdown-language-keyword-face :foreground magenta-faint)
   (markdown-metadata-key-face :foreground magenta-faint)
   (markdown-metadata-value-face :foreground cyan)
   (markdown-bold-face :weight 'bold)
   (markdown-italic-face :slant 'italic)
   (markdown-bold-italic-face :weight 'bold :slant 'italic)

   ;; Web mode
   (web-mode-html-tag-face :foreground magenta)
   (web-mode-html-tag-bracket-face :foreground fg-alt)
   (web-mode-html-attr-name-face :foreground cyan)
   (web-mode-html-attr-value-face :foreground green)
   (web-mode-css-selector-face :foreground magenta)
   (web-mode-css-property-name-face :foreground cyan)
   (web-mode-css-at-rule-face :foreground red-cooler)
   (web-mode-builtin-face :foreground builtin)
   (web-mode-keyword-face :foreground keywords)
   (web-mode-function-name-face :foreground functions)
   (web-mode-variable-name-face :foreground variables)
   (web-mode-type-face :foreground type)
   (web-mode-constant-face :foreground constants)
   (web-mode-string-face :foreground strings)
   (web-mode-comment-face :foreground comments :slant 'italic)
   (web-mode-doctype-face :foreground comments)
   (web-mode-block-delimiter-face :foreground operators)

   ;; LaTeX/AUCTeX
   (font-latex-math-face :foreground blue)
   (font-latex-bold-face :weight 'bold)
   (font-latex-italic-face :slant 'italic)
   ;; sectioning
   (font-latex-sectioning-0-face :foreground fg :weight 'bold :height 1.4)
   (font-latex-sectioning-1-face :foreground fg :weight 'bold :height 1.4)
   (font-latex-sectioning-2-face :foreground fg :weight 'bold :height 1.3)
   (font-latex-sectioning-3-face :foreground fg :weight 'bold :height 1.2)
   (font-latex-sectioning-4-face :foreground fg :weight 'bold :height 1.1)
   (font-latex-sectioning-5-face :foreground fg :weight 'bold)
   (font-latex-sectioning-6-face :foreground fg :weight 'bold)
   (font-latex-sectioning-7-face :foreground fg :weight 'bold)
   (font-latex-sectioning-8-face :foreground fg :weight 'bold)

   ;; Term
   (term-color-black :background base0 :foreground base0)
   (term-color-red :background red :foreground red)
   (term-color-green :background green :foreground green)
   (term-color-yellow :background yellow :foreground yellow)
   (term-color-blue :background blue :foreground blue)
   (term-color-magenta :background magenta :foreground magenta)
   (term-color-cyan :background cyan :foreground cyan)
   (term-color-white :background base8 :foreground base8)
   )

  ;; Extra variables
  (
   ;; Fill column indicator
   (fci-rule-color base4)

   ;; Vterm
   (vterm-color-black base0)
   (vterm-color-red red)
   (vterm-color-green green)
   (vterm-color-yellow yellow)
   (vterm-color-blue blue)
   (vterm-color-magenta magenta)
   (vterm-color-cyan cyan)
   (vterm-color-white base8)
   (vterm-color-bright-black base1)
   (vterm-color-bright-red red-warmer)
   (vterm-color-bright-green green-cooler)
   (vterm-color-bright-yellow yellow-warmer)
   (vterm-color-bright-blue blue-cooler)
   (vterm-color-bright-magenta magenta-warmer)
   (vterm-color-bright-cyan cyan-warmer)
   (vterm-color-bright-white base8)
   )
  )

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'doom-immaterial-dark-theme)
;;; doom-immaterial-dark-theme.el ends here
