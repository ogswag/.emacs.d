;;; -*- no-byte-compile: t; tango-plus-theme.el --- A color theme based on the tango palette  -*- lexical-binding: nil; -*-

;; Copyright (C) 2013 Titus von der Malsburg <malsburg@posteo.de>

;; Author: Titus von der Malsburg <malsburg@posteo.de>
;; Maintainer: Titus von der Malsburg <malsburg@posteo.de>
;; URL: https://github.com/tmalsburg/tango-plus-theme
;; Package-Version: 20250813.1242
;; Package-Revision: 6c57ae3745ab

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Color theme for Emacs loosely based on the tango palette.  The
;; basis for this theme was the tango theme part of Emacs 24 but
;; recent versions deviate considerably.  Some colors where added to
;; increase contrast.  Also, support was added for evil, org mode,
;; mu4e, helm, epresent, and markdown-mode among others.
;;
;; For details and screenshots visit the project page on Github:
;;
;;     https://github.com/tmalsburg/tango-plus-theme
;;
;; To use this theme put the following in your startup file:
;;
;;     (load-theme 'tango-plus t)
;;

;;; Install:

;; Put this file on your Emacs-Lisp load path and add the following in
;; your Emacs startup file:
;;
;;     (load-theme 'tango-plus t)

;;; Code:

(deftheme tango-plus
  "Face colors using the Tango palette (light background).
Basic, Font Lock, Isearch, Gnus, Message, Ediff, Flyspell,
Semantic, and Ansi-Color faces are included.")

(defface tango-plus-quotation
  '((t :inherit default))
  "Face for quotes."
  :group 'basic-faces)

(defface tango-plus-deemphasized
  '((t :inherit default))
  "Face for visually deemphasized text."
  :group 'basic-faces)

(let ((class '((class color) (min-colors 89)))
      ;; Tango palette colors.
      (butter-1 "#fce94f")   (butter-2 "#edd400")   (butter-3 "#c4a000")
      (orange-1 "#fcaf3e")   (orange-2 "#f57900")   (orange-3 "#ce5c00")
      (choc-1   "#e9b96e")   (choc-2   "#c17d11")   (choc-3   "#8f5902")
      (cham-1   "#8ae234")   (cham-2   "#73d216")   (cham-3   "#4e9a06")
      (blue-1   "#729fcf")   (blue-2   "#3465a4")   (blue-3   "#204a87")
      (plum-1   "#ad7fa8")   (plum-2   "#75507b")   (plum-3   "#5c3566")
      (red-1    "#ef2929")   (red-2    "#cc0000")   (red-3    "#a40000")
      (alum-1   "#eeeeec")   (alum-2   "#d3d7cf")   (alum-3   "#babdb6")
      (alum-4   "#888a85")   (alum-5   "#5f615c")   (alum-6   "#2e3436")
      ;; Not in Tango palette; used for better contrast.
      (white    "#ffffff")  (black  "#000000")  (cham-4   "#346604")
      (plum-0   "#F1D1E8")  (cham-0 "#e6ffc2")  (red-4    "#ff2d2d")
      (red-0    "#FFCBCB")  (blue-0 "#D0EFFD")  (orange-4 "#b35000")
      (orange-0 "#FFDBBD")


      ;; Colors for heading levels
      (level-1 "#204a87")
      (level-2 "#00695C")
      (level-3 "#4e9a06")
      (level-4 "#A0B33B")
      (level-5 "#5c3566")
      (level-6 "#cc0000")
      (level-7 "#ce5c00")
      (level-8 "#c4a000")
      )

  (custom-theme-set-faces
   'tango-plus
   ;; Base faces from which other faces inherit:

   ;; Faces defined in faces.el:
   `(default                        ((,class (:foreground ,black))))
   ;; Skipping bold, italic, bold-italic, underline, fixed-pitch,
   ;; variable-pitch, shadow.
   `(link                           ((,class (:underline t :foreground ,blue-3))))
   `(link-visited                   ((,class (:underline t :foreground ,plum-3))))
   `(highlight                      ((,class (:background ,alum-2))))
   `(region                         ((,class (:background ,butter-1))))
   `(secondary-selection            ((,class (:background ,butter-2))))
   `(trailing-whitespace            ((,class (:background ,red-1))))
   `(escape-glyph                   ((,class (:foreground ,red-3))))
   ;; Skipping `nobreak-space'.
   `(mode-line                      ((,class (:background ,alum-5 :foreground ,alum-1))))
   `(mode-line-inactive             ((,class (:background ,alum-4 :foreground ,alum-3))))
   ;; What `mode-line-highlight' and `mode-line-emphasis' used for?
   `(mode-line-buffer-id            ((,class (:weight bold))))
   `(header-line                    ((,class (:background ,alum-2))))
   `(vertical-border                ((,class (:foreground ,alum-3))))
   ;; Skipping `window-divider', `window-divider-first-pixel' and
   ;; `window-divider-last-pixel'.
   `(minibuffer-prompt              ((,class (:weight bold :foreground ,blue-3))))
   `(fringe                         ((,class (:foreground ,alum-2 :background ,white))))
   ;; Skipping `scroll-bar', `border'.
   ;; Skipping `mouse', `tool-bar', `menu'.
   ;; FIXME `help-argument-name'

   `(help-key-binding               ((,class (:background ,plum-0 :foreground ,plum-3))))

   ;; Skipping `glyphless-char'.
   `(error                          ((,class (:foreground ,red-3 :weight bold))))
   `(warning                        ((,class (:foreground ,red-3))))
   `(success                        ((,class (:foreground ,cham-3))))
   `(show-paren-match               ((,class (:inherit region))))
   `(show-paren-mismatch            ((,class (:inherit trailing-whitespace))))
   `(sh-quoted-exec                 ((,class (:foreground, black))))
   `(sh-heredoc                     ((,class (:foreground, black))))

   ;; Tango-plus faces:
   `(tango-plus-deemphasized        ((,class (:foreground ,alum-4))))
   `(tango-plus-quotation           ((,class (:foreground ,alum-5 :slant italic))))

   ;; Bookmark.el:
   `(bookmark-face                  ((,class (:background ,red-0))))

   ;; Faces in isearch.el:
   `(isearch                        ((,class (:foreground ,white :background ,blue-3))))
   `(isearch-fail                   ((,class (:foreground ,white :background ,red-3))))
   `(isearch-group-1                ((,class (:foreground ,white :background ,orange-2))))
   `(isearch-group-2                ((,class (:foreground ,white :background ,cham-4))))

   `(lazy-highlight                 ((,class (:background ,plum-0))))

   ;; Avy
   `(avy-goto-char-timer-face ((,class (:background ,alum-5 :foreground ,white))))
   `(avy-lead-face            ((,class (:background ,orange-2  :foreground ,white))))
   `(avy-lead-face-0          ((,class (:background ,blue-2 :foreground ,white))))
   `(avy-lead-face-1          ((,class (:background ,cham-3 :foreground ,white))))
   `(avy-lead-face-2          ((,class (:background ,plum-2 :foreground ,white))))

   ;; Orderless
   `(orderless-match-face-0 ((,class (:foreground ,blue-3 :background ,blue-0 :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,cham-4 :background ,cham-0 :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,orange-3 :background ,orange-0 :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,plum-3  :background ,plum-0 :weight bold))))

   ;; Corfu
   `(corfu-current ((,class (:foreground ,blue-3 :background ,blue-0 :weight bold))))

   ;; Completion
   `(completions-common-part ((,class (:inherit orderless-match-face-1))))
   `(completions-first-difference ((,class (:inherit orderless-match-face-2))))
   `(completions-annotations ((,class (:inherit font-lock-comment-face))))

   ;; Font lock faces.  Other faces are defined in based on them to
   ;; the extend possible.
   `(font-lock-comment-face           ((,class (:inherit tango-plus-deemphasized))))
   `(font-lock-comment-delimiter-face ((,class (:inherit tango-plus-deemphasized))))
   `(font-lock-string-face            ((,class (:foreground ,choc-3))))
   `(font-lock-doc-face               ((,class (:inherit tango-plus-deemphasized))))
   `(font-lock-keyword-face           ((,class (:foreground ,blue-3))))
   `(font-lock-builtin-face           ((,class (:foreground ,plum-2))))
   `(font-lock-function-name-face     ((,class (:foreground ,red-3))))
   `(font-lock-variable-name-face     ((,class (:foreground ,red-1))))
   `(font-lock-type-face              ((,class (:foreground ,red-3))))
   `(font-lock-constant-face          ((,class (:foreground ,choc-3 :slant italic))))
   `(font-lock-warning-face           ((,class (:foreground ,red-3))))
   `(font-lock-negation-char-face     ((,class (:foreground ,red-3))))
   `(font-lock-preprocessor-face      ((,class (:inherit tango-plus-deemphasized))))

   ;; Application-specific face which inherit from the base faces if possible:

   ;; Highlighting faces
   `(sentence-highlight-face        ((,class (:inherit highlight))))
   `(evil-ex-substitute-matches     ((,class (:background ,red-0 :strike-through ,red-1))))
   `(evil-ex-substitute-replacement ((,class (:inherit lazy-highlight))))
   `(evil-visual-mark-face          ((,class (:inherit default :foreground ,white :background ,blue-2))))

   ;; Gnus faces
   `(gnus-group-news-1              ((,class (:weight bold :foreground ,plum-3))))
   `(gnus-group-news-1-low          ((,class (:foreground ,plum-3))))
   `(gnus-group-news-2              ((,class (:weight bold :foreground ,blue-3))))
   `(gnus-group-news-2-low          ((,class (:foreground ,blue-3))))
   `(gnus-group-news-3              ((,class (:weight bold :foreground ,red-3))))
   `(gnus-group-news-3-low          ((,class (:foreground ,red-3))))
   `(gnus-group-news-4              ((,class (:weight bold :foreground ,"#7a4c02"))))
   `(gnus-group-news-4-low          ((,class (:foreground ,"#7a4c02"))))
   `(gnus-group-news-5              ((,class (:weight bold :foreground ,orange-3))))
   `(gnus-group-news-5-low          ((,class (:foreground ,orange-3))))
   `(gnus-group-news-low            ((,class (:foreground ,alum-4))))
   `(gnus-group-mail-1              ((,class (:weight bold :foreground ,plum-3))))
   `(gnus-group-mail-1-low          ((,class (:foreground ,plum-3))))
   `(gnus-group-mail-2              ((,class (:weight bold :foreground ,blue-3))))
   `(gnus-group-mail-2-low          ((,class (:foreground ,blue-3))))
   `(gnus-group-mail-3              ((,class (:weight bold :foreground ,cham-3))))
   `(gnus-group-mail-3-low          ((,class (:foreground ,cham-3))))
   `(gnus-group-mail-low            ((,class (:foreground ,alum-4))))
   `(gnus-header-content            ((,class (:inherit default))))
   `(gnus-header-from               ((,class (:inherit default :weight bold))))
   `(gnus-header-subject            ((,class (:inherit font-lock-keyword-face :weight bold))))
   `(gnus-header-name               ((,class (:inherit font-lock-builtin-face))))
   `(gnus-header-newsgroups         ((,class (:foreground ,alum-4))))
   `(gnus-cite-attribution          ((,class (:inherit tango-plus-deemphasized :slant italic))))
   `(gnus-cite-1                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-2                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-3                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-4                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-5                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-6                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-7                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-8                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-9                    ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-10                   ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-cite-11                   ((,class (:inherit tango-plus-deemphasized))))
   `(gnus-signature                 ((,class (:inherit tango-plus-deemphasized :slant italic))))

   ;; Message faces
   `(message-header-name            ((,class (:inherit font-lock-builtin-face))))
   `(message-header-other           ((,class (:inherit default))))
   `(message-header-xheader         ((,class (:inherit message-header-name))))
   `(message-header-newsgroups      ((,class (:inherit message-header-name))))
   `(message-header-to              ((,class (:inherit default :weight bold))))
   `(message-header-cc              ((,class (:inherit default))))
   `(message-mml                    ((,class (:inherit tango-plus-deemphasized))))
   `(message-header-subject         ((,class (:inherit default))))
   `(message-cited-text             ((,class (:inherit tango-plus-deemphasized))))
   `(message-separator              ((,class (:inherit tango-plus-deemphasized))))
   `(message-cited-text-1           ((,class (:inherit font-lock-comment-face))))
   `(message-cited-text-2           ((,class (:inherit font-lock-comment-face))))
   `(message-cited-text-3           ((,class (:inherit font-lock-comment-face))))
   `(message-cited-text-4           ((,class (:inherit font-lock-comment-face))))

   ;; SMerge
   `(smerge-refined-change          ((,class (:background ,plum-1))))

   ;; Ediff
   `(ediff-current-diff-A           ((,class (:background ,red-0))))
   `(ediff-fine-diff-A              ((,class (:background ,red-1))))
   `(ediff-current-diff-B           ((,class (:background ,cham-0))))
   `(ediff-fine-diff-B              ((,class (:background ,cham-1))))
   `(ediff-even-diff-A              ((,class (:inherit highlight))))
   `(ediff-even-diff-B              ((,class (:inherit highlight))))
   `(ediff-odd-diff-A               ((,class (:inherit highlight))))
   `(ediff-odd-diff-B               ((,class (:inherit highlight))))

   ;; Flyspell
   `(flyspell-incorrect             ((,class (:underline (:color ,red-1 :style wave) :background ,red-0))))
   `(flyspell-duplicate             ((,class (:inherit flyspell-incorrect))))
   ;; Wcheck
   `(wcheck-default-face            ((,class (:inherit flyspell-incorrect))))

   ;; Outline:
   `(outline-1                      ((,class (:foreground ,level-1 :height 1.5 :weight bold))))
   `(outline-2                      ((,class (:foreground ,level-2 :height 1.4 :weight bold))))
   `(outline-3                      ((,class (:foreground ,level-3 :height 1.3 :weight bold))))
   `(outline-4                      ((,class (:foreground ,level-4 :height 1.2 :weight bold))))
   `(outline-5                      ((,class (:foreground ,level-5 :height 1.1 :weight bold))))
   `(outline-6                      ((,class (:foreground ,level-6 :height 1.0 :weight bold))))
   `(outline-7                      ((,class (:foreground ,level-7 :height 1.0 :weight bold))))
   `(outline-8                      ((,class (:foreground ,level-8 :height 1.0 :weight bold))))

   ;; Org mode:
   `(org-quote                      ((,class (:inherit tango-plus-quotation))))
   `(org-verbatim                   ((,class (:inherit tango-plus-quotation))))
   `(org-level-1                    ((,class (:inherit outline-1))))
   `(org-level-2                    ((,class (:inherit outline-2))))
   `(org-level-3                    ((,class (:inherit outline-3))))
   `(org-level-4                    ((,class (:inherit outline-4))))
   `(org-level-5                    ((,class (:inherit outline-5))))
   `(org-level-6                    ((,class (:inherit outline-6))))
   `(org-level-7                    ((,class (:inherit outline-7))))
   `(org-level-8                    ((,class (:inherit outline-8))))
   `(org-document-title             ((,class (:inherit font-lock-keyword-face :height 1.5 :weight bold))))
   `(org-document-info              ((,class (:inherit font-lock-keyword-face))))
   `(org-document-info-keyword      ((,class (:inherit font-lock-builtin-face))))
   `(org-meta-line                  ((,class (:inherit font-lock-builtin-face))))
   `(org-todo                       ((,class (:foreground ,red-2 :weight bold))))
   `(org-done                       ((,class (:foreground ,cham-3))))
   `(org-headline-done              ((,class (:inherit font-lock-keyword-face))))
   `(org-table                      ((,class (:inherit font-lock-keyword-face))))
   `(org-drawer                     ((,class (:inherit font-lock-keyword-face))))
   `(org-special-keyword            ((,class (:inherit font-lock-keyword-face))))
   `(org-date                       ((,class (:inherit font-lock-builtin-face))))
   `(org-footnote                   ((,class (:foreground ,alum-5))))
   `(org-block-begin-line           ((,class (:foreground ,alum-4 :background ,alum-1))))
   `(org-block                      ((,class (:background ,alum-1))))
   `(org-block-end-line             ((,class (:foreground ,alum-4 :background ,alum-1))))
   `(org-hide                       ((,class (:foreground ,white))))
   `(org-agenda-date                ((,class (:foreground ,black))))
   `(org-agenda-date-today          ((,class (:inherit org-agenda-date))))
   `(org-agenda-date-weekend        ((,class (:inherit org-agenda-date :foreground ,alum-6 :underline t))))
   `(org-sexp-date                  ((,class (:inherit org-date))))
   `(org-time-grid                  ((,class (:foreground ,alum-4))))
   `(org-dispatcher-highlight       ((,class (:inherit lazy-highlight))))
   `(org-agenda-structure           ((,class (:inherit helm-source-header))))

   ;; Moinmoin
   `(moinmoin-h1                    ((,class (:inherit org-level-1))))
   `(moinmoin-h2                    ((,class (:inherit org-level-2))))
   `(moinmoin-h3                    ((,class (:inherit org-level-3))))
   `(moinmoin-h4                    ((,class (:inherit org-level-4))))
   `(moinmoin-h5                    ((,class (:inherit org-level-5))))
   `(moinmoin-ss                    ((,class (:inherit org-level-5))))
   `(moinmoin-smiley                ((,class (:inherit font-lock-keyword-face))))
   `(moinmoin-macro-name            ((,class (:inherit font-lock-keyword-face))))
   `(moinmoin-wiki-link             ((,class (:inherit font-lock-keyword-face))))
   `(moinmoin-pi                    ((,class (:inherit font-lock-comment-face))))
   `(moinmoin-comment               ((,class (:inherit font-lock-comment-face))))
   `(moinmoin-item                  ((,class (:inherit default))))
   `(moinmoin-url                   ((,class (:inherit org-link))))
   `(moinmoin-url-title             ((,class (:inherit org-link))))
   `(moinmoin-tt                    ((,class (:inherit org-code))))
   `(moinmoin-rule                  ((,class (:inherit font-lock-keyword-face))))
   `(moinmoin-blockquote-indent     ((,class (:inherit default))))

   ;; Mu4e
   `(mu4e-title-face                ((,class (:weight bold))))
   `(mu4e-unread-face               ((,class (:foreground ,blue-3 :weight bold))))
   `(mu4e-moved-face                ((,class (:inherit tango-plus-deemphasized))))
   `(mu4e-thrashed-face             ((,class (:inherit tango-plus-deemphasized :strike-through t))))
   `(mu4e-draft-face                ((,class (:inherit font-lock-string-face))))
   `(mu4e-flagged-face              ((,class (:foreground ,red-3 :weight bold))))
   `(mu4e-replied-face              ((,class (:inherit tango-plus-deemphasized))))
   `(mu4e-forward-face              ((,class (:inherit tango-plus-deemphasized))))
   `(mu4e-header-face               ((,class (:inherit default))))
   `(mu4e-header-title-face         ((,class (:inherit default))))
   `(mu4e-header-highlight-face     ((,class (:inherit highlight))))
   `(mu4e-header-marks-face         ((,class (:inherit tango-plus-deemphasized))))
   `(mu4e-header-key-face           ((,class (:inherit font-lock-builtin-face))))
   `(mu4e-header-value-face         ((,class (:inherit default))))
   `(mu4e-special-header-value-face ((,class (:inherit default))))
   `(mu4e-contact-face              ((,class (:inherit default :weight bold))))
   `(mu4e-highlight-face            ((,class (:inherit default :bold t))))
   `(mu4e-modeline-face             ((,class ())))
   `(mu4e-compose-separator-face    ((,class (:inherit tango-plus-deemphasized))))
   `(mu4e-cited-1-face              ((,class (:inherit font-lock-comment-face))))
   `(mu4e-cited-2-face              ((,class (:inherit font-lock-comment-face))))
   `(mu4e-cited-3-face              ((,class (:inherit font-lock-comment-face))))
   `(mu4e-cited-4-face              ((,class (:inherit font-lock-comment-face))))
   `(mu4e-cited-5-face              ((,class (:inherit font-lock-comment-face))))
   `(mu4e-cited-6-face              ((,class (:inherit font-lock-comment-face))))
   `(mu4e-cited-7-face              ((,class (:inherit font-lock-comment-face))))

   ;; Magit et al:
   `(diff-context                   ((,class (:inherit highlight))))
   `(diff-refine-removed            ((,class (:inherit magit-diff-removed :underline t))))
   `(diff-refine-added              ((,class (:inherit magit-diff-added :underline t))))
   `(magit-diff-hunk-header         ((,class (:inherit header-line))))
   `(magit-diff-file-header         ((,class (:inherit header-line))))
   `(git-commit-summary-face        ((,class (:inherit default))))
   `(git-gutter:added               ((,class (:foreground ,cham-3))))
   `(git-gutter:deleted             ((,class (:foreground ,red-3))))
   `(git-gutter:modified             ((,class (:foreground ,plum-2))))

   ;; Helm
   `(helm-source-header             ((,class (:inherit default :weight bold
                                                       :height 1.3))))
   `(helm-selection                 ((,class (:inherit highlight))))
   `(helm-match                     ((,class (:inherit lazy-highlight))))
   `(helm-match-item                ((,class (:inherit lazy-highlight))))
   `(helm-grep-match                ((,class (:inherit lazy-highlight))))
   `(helm-grep-file                 ((,class (:inherit default))))
   `(helm-grep-lineno               ((,class (:inherit tango-plus-deemphasized))))
   `(helm-grep-cmd-line             ((,class (:inherit warning))))
   `(helm-action                    ((,class ())))
   `(helm-candidate-number          ((,class (:inherit mode-line))))
   `(helm-swoop-target-word-face    ((,class (:inherit lazy-highlight))))
   `(helm-swoop-target-line-face    ((,class (:inherit highlight))))
   `(helm-swoop-target-line-block-face ((,class (:inherit highlight))))

   ;; Markdown mode
   `(markdown-italic-face           ((,class (:slant italic))))
   `(markdown-bold-face             ((,class (:weight bold))))
   `(markdown-header-rule-face      ((,class (:inherit font-lock-keyword-face :weight bold))))
   `(markdown-header-delimiter-face ((,class (:inherit font-lock-keyword-face))))
   `(markdown-header-face           ((,class (:inherit font-lock-keyword-face))))
   `(markdown-header-face-1         ((,class (:inherit 'outline-1))))
   `(markdown-header-face-2         ((,class (:inherit 'outline-2))))
   `(markdown-header-face-3         ((,class (:inherit 'outline-3))))
   `(markdown-header-face-4         ((,class (:inherit 'outline-4))))
   `(markdown-header-face-5         ((,class (:inherit 'outline-5))))
   `(markdown-header-face-6         ((,class (:inherit 'outline-6))))
   `(markdown-header-face           ((,class (:inherit font-lock-keyword-face))))
   `(markdown-inline-code-face      ((,class (:slant italic))))
   `(markdown-list-face             ((,class (:weight bold))))
   `(markdown-blockquote-face       ((,class (:inherit tango-plus-quotation))))
   `(markdown-pre-face              ((,class (:inherit tango-plus-quotation))))
   `(markdown-language-keyword-face ((,class (:inherit font-lock-keyword-face))))
   `(markdown-link-face             ((,class (:inherit font-lock-keyword-face))))
   `(markdown-missing-link-face     ((,class (:inherit font-lock-keyword-face))))
   `(markdown-reference-face        ((,class (:inherit font-lock-keyword-face))))
   `(markdown-footnote-face         ((,class (:inherit font-lock-keyword-face))))
   `(markdown-url-face              ((,class (:inherit font-lock-keyword-face))))
   `(markdown-link-title-face       ((,class (:inherit font-lock-keyword-face))))
   `(markdown-link-break-face       ((,class (:inherit font-lock-keyword-face))))
   `(markdown-comment-face          ((,class (:inherit tango-plus-deemphasized))))
   `(markdown-math-face             ((,class (:inherit font-lock-keyword-face))))

   ;;; LaTeX
   `(font-latex-sectioning-0-face ((,class (:inherit 'outline-1))))
   `(font-latex-sectioning-1-face ((,class (:inherit 'outline-1))))
   `(font-latex-sectioning-2-face ((,class (:inherit 'outline-2))))
   `(font-latex-sectioning-3-face ((,class (:inherit 'outline-3))))
   `(font-latex-sectioning-4-face ((,class (:inherit 'outline-4))))
   `(font-latex-sectioning-5-face ((,class (:inherit 'outline-5))))
   `(font-latex-sectioning-6-face ((,class (:inherit 'outline-6))))
   `(font-latex-sectioning-7-face ((,class (:inherit 'outline-7))))
   `(font-latex-sectioning-8-face ((,class (:inherit 'outline-8))))

   ;; Semantic faces
   ;; FIXME This section.  When and where are these faces used?
   `(semantic-decoration-on-includes ((,class (:underline  ,cham-4))))
   `(semantic-decoration-on-private-members-face ((,class (:background ,alum-2))))
   `(semantic-decoration-on-protected-members-face ((,class (:background ,alum-2))))
   `(semantic-decoration-on-unknown-includes ((,class (:background ,choc-3))))
   `(semantic-decoration-on-unparsed-includes ((,class (:underline  ,orange-3))))
   `(semantic-tag-boundary-face     ((,class (:overline   ,blue-1))))
   `(semantic-unmatched-syntax-face ((,class (:underline  ,red-1))))

   ;; Epresent:
   `(epresent-title-face            ((,class (:weight bold :height 360))))
   `(epresent-heading-face          ((,class (:weight bold :height 270
                                                      :underline nil ))))
   `(epresent-subheading-face       ((,class (:weight bold :height 240))))
   `(epresent-author-face           ((,class (:height 1.6))))
   `(epresent-bullet-face           ((,class (:weight bold))))
   `(epresent-hidden-face           ((,class (:invisible t))))

   ;; writegood-mode:
   `(writegood-weasels-face         ((,class (:underline (:color ,red-1 :style wave)))))
   `(writegood-passive-voice-face   ((,class (:inherit writegood-weasels-face))))
   `(writegood-duplicates-face      ((,class (:inherit flyspell-duplicate))))

   ;; anzu-mode:
   `(anzu-mode-line                 ((,class (:inherit mode-line))))

   ;; doom-modeline
   `(doom-modeline-info                 ((,class (:weight bold :foreground ,cham-2))))
   `(doom-modeline-warning              ((,class (:weight bold :foreground ,butter-1))))
   `(doom-modeline-urgent               ((,class (:weight bold :foreground ,red-4))))
   `(doom-modeline-project-dir          ((,class (:weight bold :foreground ,butter-3))))
   `(doom-modeline-evil-normal-state    ((,class (:weight bold :foreground ,cham-1))))
   `(doom-modeline-evil-insert-state    ((,class (:weight bold :foreground ,blue-0))))
   `(doom-modeline-evil-visual-state    ((,class (:weight bold :foreground ,butter-1))))
   `(doom-modeline-buffer-modified      ((,class (:inherit doom-modeline-urgent))))

   ;; dired
   `(diredp-display-msg                 ((,class (:foreground ,blue-0))))
   `(diredp-compressed-file-suffix      ((,class (:foreground ,butter-1))))
   `(diredp-date-time                   ((,class (:foreground ,choc-3))))
   `(diredp-deletion                    ((,class (:foreground ,butter-1))))
   `(diredp-deletion-file-name          ((,class (:foreground ,red-1))))
   `(diredp-dir-heading                 ((,class (:foreground ,blue-3 :background ,alum-2))))
   `(diredp-dir-priv                    ((,class (:foreground ,blue-3))))
   `(diredp-exec-priv                   ((,class (:foreground ,red-1))))
   `(diredp-executable-tag              ((,class (:foreground ,cham-1))))
   `(diredp-file-name                   ((,class (:foreground ,black))))
   `(diredp-file-suffix                 ((,class (:foreground ,red-2))))
   `(diredp-flag-mark                   ((,class (:foreground ,butter-1))))
   `(diredp-flag-mark-line              ((,class (:foreground ,orange-1))))
   `(diredp-ignored-file-name           ((,class (:foreground ,alum-6))))
   `(diredp-link-priv                   ((,class (:foreground ,butter-1))))
   `(diredp-mode-line-flagged           ((,class (:foreground ,butter-1))))
   `(diredp-mode-line-marked            ((,class (:foreground ,orange-1))))
   `(diredp-no-priv                     ((,class (:foreground ,white))))
   `(diredp-number                      ((,class (:foreground ,red-0))))
   `(diredp-other-priv                  ((,class (:foreground ,butter-1))))
   `(diredp-rare-priv                   ((,class (:foreground ,red-3))))
   `(diredp-read-priv                   ((,class (:foreground ,butter-3))))
   `(diredp-symlink                     ((,class (:foreground ,butter-1))))
   `(diredp-write-priv                  ((,class (:foreground ,plum-1))))

   ;; diredfl
   `(diredfl-compressed-file-name       ((,class (:foreground ,alum-1 :weight bold))))
   `(diredfl-compressed-file-suffix     ((,class (:inherit diredfl-compressed-file-name))))
   `(diredfl-dir-name                   ((,class (:foreground ,alum-6 :weight bold))))
   `(diredfl-date-time                  ((,class (:foreground ,choc-3))))
   `(diredfl-deletion                   ((,class (:foreground ,butter-1))))
   `(diredfl-deletion-file-name         ((,class (:foreground ,red-3))))
   `(diredfl-dir-heading                ((,class (:foreground ,black :background ,alum-2))))
   `(diredfl-dir-priv                   ((,class (:foreground ,black :weight bold))))
   `(diredfl-exec-priv                  ((,class (:foreground ,blue-3))))
   `(diredfl-executable-tag             ((,class (:foreground ,blue-3))))
   `(diredfl-file-name                  ((,class (:foreground ,black))))
   `(diredfl-file-suffix                ((,class (:inherit 'diredfl-file-name))))
   `(diredfl-flag-mark                  ((,class (:foreground ,butter-1))))
   `(diredfl-flag-mark-line             ((,class (:foreground ,orange-1))))
   ;;`(diredfl-ignored-file-name          ((,class (:foreground ,alum-2))))
   `(diredfl-link-priv                  ((,class (:foreground ,butter-1))))
   `(diredfl-no-priv                    ((,class (:foreground ,white))))
   `(diredfl-number                     ((,class (:foreground ,red-3)))) ;;n files in folder and size
   `(diredfl-other-priv                 ((,class (:foreground ,butter-1))))
   `(diredfl-rare-priv                  ((,class (:foreground ,blue-3))))
   `(diredfl-read-priv                  ((,class (:foreground ,black))))
   `(diredfl-symlink                    ((,class (:foreground ,plum-3))))
   `(diredfl-write-priv                 ((,class (:foreground ,black))))

   ;; dired-async
   `(dired-async-failures               ((,class (:foreground ,red-3 :weight bold))))
   `(dired-async-message                ((,class (:foreground ,butter-1 :weight bold))))
   `(dired-async-mode-message           ((,class (:foreground ,butter-1))))

   ;;eshell
   `(eshell-prompt                   ((,class (:foreground ,blue-3))))
   `(eshell-ls-directory             ((,class (:weight bold :foreground ,black))))
   `(eshell-ls-symlink               ((,class (:weight bold :foreground ,butter-3))))
   `(eshell-ls-executable            ((,class (:foreground ,choc-3))))
   `(eshell-ls-special               ((,class (:foreground ,plum-3))))

   ;;vterm
   `(vterm-color-black               ((,class (:foreground ,black))))
   `(vterm-color-red               ((,class (:foreground ,red-3))))
   `(vterm-color-blue               ((,class (:foreground ,blue-3))))
   `(vterm-color-green               ((,class (:foreground ,cham-3))))
   `(vterm-color-yellow               ((,class (:foreground ,butter-3))))
   `(vterm-color-magenta               ((,class (:foreground ,plum-3))))
   `(vterm-color-cyan               ((,class (:foreground ,blue-1))))
   )

  (custom-theme-set-variables
   'tango-plus
   `(ansi-color-names-vector [,alum-6 ,red-3 ,cham-3 ,butter-3
                                      ,blue-3 ,plum-3 ,blue-1 ,alum-1])))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'tango-plus)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; tango-plus-theme.el ends here
