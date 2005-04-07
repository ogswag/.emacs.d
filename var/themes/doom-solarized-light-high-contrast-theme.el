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
  ((bg         '("#FDF6E3" "#FDF6E3" "white"        ))
   (fg         '("#002b36" "#002b36" "black"        ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#EEE8D5" "#EEE8D5" "white"        ))
   (fg-alt     '("#7B8787" "#7B8787" "brightwhite"  ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#FFFBF0" "#FFFBF0" "white"        ))
   (base1      '("#FCF8ED" "#FCF8ED" "brightblack"  ))
   (base2      '("#FCF7E8" "#FCF7E8" "brightblack"  ))
   (base3      '("#F2E6CE" "#F2E6CE" "brightblack"  ))
   (base4      '("#E1DBCD" "#E1DBCD" "brightblack"  ))
   (base5      '("#D6D6D6" "#D6D6D6" "brightblack"  ))
   (base6      '("#96A7A9" "#96A7A9" "brightblack"  ))
   (base7      '("#788484" "#788484" "brightblack"  ))
   (base8      '("#626C6C" "#626C6C" "black"        ))
   (func       '("#6c3163" "#6c3163" "brown"        ))

   (grey       base4)
   (red        '("#dc322f" "#dc322f" "red"          ))
   (orange     '("#cb4b16" "#cb4b16" "brightred"    ))
   (green      '("#088600" "#088600" "green"        ))
   (teal       '("#007E60" "#007E60" "brightgreen"  ))
   (yellow     '("#987B00" "#987B00" "yellow"       ))
   (blue       '("#006ED9" "#006ED9" "brightblue"   ))
   (dark-blue  '("#007B9C" "#007B9C" "blue"         ))
   (magenta    '("#DE006B" "#DE006B" "magenta"      ))
   (violet     '("#6c71c4" "#6c71c4" "brightmagenta"))
   (cyan       '("#00807B" "#00807B" "brightcyan"   ))
   (dark-cyan  '("#00524F" "#00524F" "cyan"         ))

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
   (functions      magenta)
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
      dark-cyan))
   (modeline-bg-alt
    (if -modeline-bright
        (doom-lighten bg 0.7)
      (doom-lighten base3 0.2)))
   (modeline-bg-inactive     (doom-darken bg 0.025))
   (modeline-bg-inactive-alt (doom-darken bg 0.02)))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-solarized-light-high-contrast-brighter-comments
                    (doom-blend teal base0 0.07)
                  'unspecified))
   ((font-lock-type-face &override) :weight 'bold)
   ((font-lock-builtin-face &override))
   ((font-lock-function-name-face &override) :foreground type :weight 'bold)
   ((font-lock-keyword-face &override) :weight 'bold)
   ((font-lock-constant-face &override) :weight 'bold)
   ((font-lock-string-face &override) :weight)
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
   ;;;; org <built-in>
   (org-block :background (doom-blend yellow bg 0.04) :extend t)
   (org-block-background :background (doom-blend yellow bg 0.04))
   (org-block-begin-line :background (doom-blend yellow bg 0.08) :extend t)
   (org-block-end-line :background (doom-blend yellow bg 0.08) :extend t)
   ;;;; widget
   (widget-field :foreground fg :background base3)
   (widget-single-line-field :foreground fg :background base3)
   ;;;; latex
   (font-latex-sedate-face :foreground base6)
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
