;;; doom-twilight-theme.el --- inspired by TextMate's Twilight theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: October 10, 2025
;; Author: Alexander Zakharov <delapishut@tya.ru>
;; Maintainer:
;; Source: https://github.com/jrblevin/twilight-emacs
;; Source: Original TextMate Twilight theme
;;
;;; Commentary:
;; A dark theme inspired by the classic TextMate Twilight theme, adapted
;; for the doom-themes framework with modern package support.
;;
;;; Code:

(require 'doom-themes)

;;; Variables

(defgroup doom-twilight-theme nil
  "Options for the `doom-twilight' theme."
  :group 'doom-themes)

(defcustom doom-twilight-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-twilight-theme
  :type 'boolean)

(defcustom doom-twilight-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-twilight-theme
  :type 'boolean)

(defcustom doom-twilight-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-twilight-theme
  :type '(choice integer boolean))

;;; Theme definition

(def-doom-theme doom-twilight
    "A dark theme inspired by TextMate's Twilight"

  ;; name        default   256       16
  ((bg         '("#141414" "#141414" "black"        ))
   (fg         '("#d8d8d8" "#d8d8d8" "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#111111" "#111111" "black"        ))
   (fg-alt     '("#cacaca" "#cacaca" "white"        ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is dark grey and fg is
   ;; light grey, base0 should be black and base8 should be white.
   (base0      '("#000000" "#000000" "black"        ))
   (base1      '("#111111" "#111111" "brightblack"  ))
   (base2      '("#212121" "#212121" "brightblack"  ))
   (base3      '("#313131" "#313131" "brightblack"  ))
   (base4      '("#4b474c" "#4b474c" "brightblack"  ))
   (base5      '("#5f5a60" "#5f5a60" "brightblack"  ))
   (base6      '("#8f8a80" "#8f8a80" "brightblack"  ))
   (base7      '("#d4d0c8" "#d4d0c8" "brightblack"  ))
   (base8      '("#f8f8f8" "#f8f8f8" "white"        ))

   (grey       base4)
   (red        '("#cf6a4c" "#cf6a4c" "red"          ))
   (orange     '("#efa510" "#efa510" "brightred"    ))
   (green      '("#8f9d6a" "#8f9d6a" "green"        ))
   (teal       '("#5d8084" "#5d8084" "brightgreen"  ))
   (yellow     '("#f2b73f" "#f2b73f" "yellow"       ))
   (blue       '("#7587A6" "#7587A6" "brightblue"   ))
   (dark-blue  '("#5d6c84" "#5d6c84" "blue"         ))
   (magenta    '("#ee799f" "#ee799f" "magenta"      ))
   (violet     '("#9b859d" "#9b859d" "brightmagenta"))
   (cyan       '("#5d8084" "#5d8084" "brightcyan"   ))
   (dark-cyan  '("#41595c" "#41595c" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom theme, or your theme will throw an error.
   (highlight      orange)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        violet)
   (comments       (if doom-twilight-brighter-comments base6 base5))
   (doc-comments   (doom-lighten (if doom-twilight-brighter-comments base6 base5) 0.25))
   (constants      red)
   (functions      orange)
   (keywords       yellow)
   (methods        cyan)
   (operators      yellow)
   (type           violet)
   (strings        green)
   (variables      blue)
   (numbers        violet)
   (region         `(,(doom-lighten (car bg) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if doom-twilight-brighter-modeline
        (doom-darken blue 0.45)
      base3))
   (modeline-bg-l
    (if doom-twilight-brighter-modeline
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg) 0.1) ,@(cdr bg)))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-twilight-brighter-comments (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if doom-twilight-padded-modeline `(:line-width ,(if (integerp doom-twilight-padded-modeline) doom-twilight-padded-modeline 4) :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if doom-twilight-padded-modeline `(:line-width ,(if (integerp doom-twilight-padded-modeline) doom-twilight-padded-modeline 4) :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-twilight-brighter-modeline base8 highlight))

   ;;;; tab-line
   (tab-line :background base3 :foreground base7)
   ;;;; centaur-tabs
   (centaur-tabs-unselected :inherit 'tab-line)
   (centaur-tabs-selected :background bg :foreground fg)
   (centaur-tabs-unselected-modified :inherit 'centaur-tabs-unselected :foreground yellow)
   (centaur-tabs-selected-modified :inherit 'centaur-tabs-selected :foreground yellow)
   (centaur-tabs-active-bar-face :background highlight)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground yellow)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground yellow)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-twilight-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;;;; elscreen
   (elscreen-tab-other-screen-face :background base3 :foreground base0)

   ;;;; ivy
   (ivy-current-match :background base2 :distant-foreground base0 :weight 'bold)
   (ivy-minibuffer-match-face-1 :background base1 :foreground base4)
   (ivy-minibuffer-match-face-2 :background base1 :foreground orange :weight 'bold)
   (ivy-minibuffer-match-face-3 :background base1 :foreground green :weight 'bold)
   (ivy-minibuffer-match-face-4 :background base1 :foreground yellow :weight 'bold)

   ;;;; LaTeX-mode
   (font-latex-math-face :foreground blue)

   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;;;; org <built-in>
   (org-hide :foreground base1)
   (org-block :background base1)
   (org-block-begin-line :foreground base4 :background base0)

   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)

   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if doom-twilight-padded-modeline `(:line-width ,(if (integerp doom-twilight-padded-modeline) doom-twilight-padded-modeline 4) :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if doom-twilight-padded-modeline `(:line-width ,(if (integerp doom-twilight-padded-modeline) doom-twilight-padded-modeline 4) :color ,modeline-bg-inactive-l)))

   ;;;; web-mode
   (web-mode-current-element-highlight-face :background dark-blue :foreground bg)

   ;;;; wgrep <built-in>
   (wgrep-face :background base1)

   ;;;; which-key
   (which-key-key-face :foreground green)
   (which-key-group-description-face :foreground red)
   (which-key-command-description-face :foreground blue)
   (which-key-local-map-description-face :foreground yellow))

  ;;;; Base theme variable overrides
  ())

;;; doom-twilight-theme.el ends here
