(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("◉" "○" "✸" "•")))

(set-face-attribute 'org-level-1 nil :height 1.6)
(set-face-attribute 'org-level-2 nil :height 1.4)
(set-face-attribute 'org-level-3 nil :height 1.2)
(set-face-attribute 'org-level-4 nil :height 1.1)

(setq org-hide-leading-stars t
      org-startup-indented t)

(provide 'babix-ext-org)
