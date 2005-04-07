;;; doom-solarized-light-high-contrast-theme.el --- a light variant of Solarized -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: ogswag <https://github.com/ogswag>
;; Maintainer: ogswag <https://github.com/ogswag>
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-solarized-light-high-contrast-theme nil
  "Options for the `doom-solarized-light-high-contrast' theme."
  :group 'doom-themes)

(defcustom doom-solarized-light-high-contrast-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-solarized-light-high-contrast-theme
  :type 'boolean)

(defcustom doom-solarized-light-high-contrast-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-solarized-light-high-contrast-theme
  :type 'boolean)

(defcustom doom-solarized-light-high-contrast-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-solarized-light-high-contrast-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-solarized-light-high-contrast
    "A light theme inspired by Solarized light"
  :family 'doom-solarized
  :background-mode 'light

  ;; name        default   256       16
  ((bg         '("#fbf8ef" "#fbf8ef" "white"        ))
   (fg         '("#4a4a4a" "#4a4a4a" "black"        ))

   ;; Muted background variants
   (bg-alt     '("#f3f0e7" "#f3f0e7" "white"        ))
   (fg-alt     '("#8a8a8a" "#8a8a8a" "brightwhite"  ))

   ;; Base spectrum - softer transitions
   (base0      '("#fffff8" "#fffff8" "white"        ))
   (base1      '("#f8f5e7" "#f8f5e7" "brightblack"  ))
   (base2      '("#f0ede0" "#f0ede0" "brightblack"  ))
   (base3      '("#e8e5d8" "#e8e5d8" "brightblack"  ))
   (base4      '("#d8d5c8" "#d8d5c8" "brightblack"  ))
   (base5      '("#b8b5a8" "#b8b5a8" "brightblack"  ))
   (base6      '("#98958a" "#98958a" "brightblack"  ))
   (base7      '("#78756a" "#78756a" "brightblack"  ))
   (base8      '("#58554a" "#58554a" "black"        ))

   ;; Muted, less saturated colors closer to Spacemacs Light
   (grey       base5)
   (red        '("#d33682" "#d33682" "red"          ))  ;; Softer magenta-red
   (orange     '("#cb4b16" "#cb4b16" "brightred"    ))  ;; Kept original
   (green      '("#859900" "#859900" "green"        ))  ;; Olive green
   (teal       '("#2aa198" "#2aa198" "brightgreen"  ))  ;; Cyan-teal
   (yellow     '("#b58900" "#b58900" "yellow"       ))  ;; Mustard yellow
   (blue       '("#487CA1" "#487CA1" "brightblue"   ))  ;; Softer blue
   (dark-blue  '("#657b83" "#657b83" "blue"         ))  ;; Desaturated blue-gray
   (magenta    '("#B55EA8" "#B55EA8" "magenta"      ))  ;; Matching red
   (violet     '("#6c71c4" "#6c71c4" "brightmagenta"))  ;; Kept original
   (cyan       '("#2aa198" "#2aa198" "brightcyan"   ))  ;; Matching teal
   (dark-cyan  '("#586e75" "#586e75" "cyan"         ))  ;; Darker cyan-gray

   ;; Additional Spacemacs-like colors
   (func       '("#6c3163" "#6c3163" "brown"        ))


   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base4)
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-solarized-light-high-contrast-brighter-comments
                       (doom-lighten teal 0.25)
                     base7))
   (doc-comments   teal)
   (constants      teal)
   (functions      func)
   (keywords       green)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        cyan)
   (variables      blue)
   (numbers        violet)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright doom-solarized-light-high-contrast-brighter-modeline)
   (-modeline-pad
    (when doom-solarized-light-high-contrast-padded-modeline
      (if (integerp doom-solarized-light-high-contrast-padded-modeline) doom-solarized-light-high-contrast-padded-modeline 4)))

   (modeline-fg
    (if -modeline-bright
        (doom-lighten base0 0.4)
      base0))
   (modeline-fg-alt base6)

   (modeline-bg
    (if -modeline-bright
        (doom-lighten cyan 0.1)
      base7))
   (modeline-bg-alt
    (if -modeline-bright
        (doom-lighten bg 0.7)
      (doom-lighten base3 0.2)))
   (modeline-bg-inactive     (doom-darken bg 0.025))
   (modeline-bg-inactive-alt (doom-darken bg 0.02))

   (level-1 magenta)
   (level-2 green)
   (level-3 blue)
   (level-4 yellow)
   (level-5 cyan)
   (level-6 magenta)
   (level-7 green)
   (level-8 blue)
   )


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-solarized-light-high-contrast-brighter-comments
                    (doom-blend teal base0 0.07)
                  'unspecified))
   ((font-lock-type-face &override))
   ((font-lock-builtin-face &override))
   ((font-lock-function-name-face &override))
   ((font-lock-keyword-face &override))
   ((font-lock-constant-face &override) :weight 'bold)
   ((font-lock-string-face &override))
   (hl-line :background base3)
   ((line-number &override) :foreground base6)
   ((line-number-current-line &override) :foreground fg :background region :weight 'bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   (easysession-mode-line-session-name-face :foreground (if -modeline-bright (doom-darken red 0.3) (doom-lighten magenta 0.4)) :weight 'bold)

   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-evil-emacs-state  :foreground magenta)
   (doom-modeline-evil-insert-state :foreground blue)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; lsp-ui
   (lsp-ui-sideline-code-action :foreground blue)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; ivy
   (ivy-current-match :background (doom-lighten yellow 0.65) :distant-foreground fg)
   (ivy-minibuffer-match-face-1 :foreground blue :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground magenta :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground green   :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground yellow  :background base3 :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground violet :weight 'bold)
   ;;;; ivy-posframe
   (ivy-posframe :background modeline-bg-alt)
   ;;;; swiper
   (swiper-match-face-1 :inherit 'ivy-minibuffer-match-face-1)
   (swiper-match-face-2 :inherit 'ivy-minibuffer-match-face-2)
   (swiper-match-face-3 :inherit 'ivy-minibuffer-match-face-3)
   (swiper-match-face-4 :inherit 'ivy-minibuffer-match-face-4)
   ;;;; helm
   (helm-selection :foreground base0 :weight 'bold :background blue)
   ;;;; company
   (company-tooltip-selection :background blue :foreground base3)

   ;;;; Org
   (org-level-1 :foreground level-1 :weight 'bold :height 1.4)
   (org-level-2 :foreground level-2 :weight 'bold :height 1.3)
   (org-level-3 :foreground level-3 :weight 'bold :height 1.2)
   (org-level-4 :foreground level-4 :weight 'bold :height 1.1)
   (org-level-5 :foreground level-5 :weight 'bold)
   (org-level-6 :foreground level-6 :weight 'bold)
   (org-level-7 :foreground level-7 :weight 'bold)
   (org-level-8 :foreground level-8 :weight 'bold)
   (org-block :background (doom-blend yellow bg 0.04) :extend t)
   (org-block-background :background (doom-blend yellow bg 0.04))
   (org-block-begin-line :background (doom-blend yellow bg 0.08) :extend t)
   (org-block-end-line :background (doom-blend yellow bg 0.08) :extend t)
   ;; outline
   (outline-1 :foreground level-1 :weight 'bold :height 1.4)
   (outline-2 :foreground level-2 :weight 'bold :height 1.3)
   (outline-3 :foreground level-3 :weight 'bold :height 1.2)
   (outline-4 :foreground level-4 :weight 'bold :height 1.1)
   (outline-5 :foreground level-5 :weight 'bold)
   (outline-6 :foreground level-6 :weight 'bold)
   (outline-7 :foreground level-7 :weight 'bold)
   (outline-8 :foreground level-8 :weight 'bold)


   ;;;; widget
   (widget-field :foreground fg :background base3)
   (widget-single-line-field :foreground fg :background base3)
   ;;;; latex
   (font-latex-sedate-face :inherit 'font-lock-keyword-face)
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
   ;;;; notmuch
   (notmuch-message-summary-face :foreground teal)
   (notmuch-wash-cited-text :foreground base6)

   ;;;; tab-line
   (tab-line :background base3 :foreground base7)
   ;;;; centaur-tabs
   (centaur-tabs-unselected :inherit 'tab-line)
   (centaur-tabs-selected :background bg :foreground fg)
   (centaur-tabs-unselected-modified :inherit 'centaur-tabs-unselected :foreground cyan)
   (centaur-tabs-selected-modified :inherit 'centaur-tabs-selected :foreground cyan)
   (centaur-tabs-active-bar-face :background highlight)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground cyan)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground cyan))

  ;;;; Base theme variable overrides-
  ;; ()
  )

;;; doom-solarized-light-high-contrast-theme.el ends here
