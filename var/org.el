;; Ensure YASnippet is loaded (if installed)
(require 'yasnippet nil t)

(defvar my/org-original-tab-command nil
  "Original command bound to TAB in Org mode (saved per-buffer).")

(defun my/org-tab (&optional arg)
  "Try to expand YASnippet at point; fall back to Org's original TAB command."
  (interactive "P")
  (if (and (bound-and-true-p yas-minor-mode) ; Check if YAS is enabled
           (not (use-region-p))              ; Avoid expanding in active regions
           (yas-expand))                     ; Try to expand snippet (returns t on success)
      t ; Snippet expanded successfully
    ;; Fallback to Org's original TAB behavior
    (if (and my/org-original-tab-command
             (not (eq my/org-original-tab-command 'my/org-tab)))
        (call-interactively my/org-original-tab-command arg)
      (org-cycle arg)))) ; Fallback to org-cycle if original command unset

;; Setup hook to activate in Org mode
(add-hook 'org-mode-hook
          (lambda ()
            ;; Save Org's original TAB command before overriding it
            (setq-local my/org-original-tab-command (key-binding (kbd "TAB")))
            ;; Bind our custom command to TAB
            (local-set-key (kbd "TAB") #'my/org-tab)))
