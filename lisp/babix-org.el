(defun fix-org-git-version ()
  "The Git version of org-mode.
  Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (git-run "describe"
              "--match=release\*"
              "--abbrev=6"
              "HEAD"))))

(defun fix-org-release ()
  "The release version of org-mode.
  Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (string-remove-prefix
      "release_"
      (git-run "describe"
               "--match=release\*"
               "--abbrev=0"
               "HEAD")))))

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :init
  (add-hook 'org-mode-hook #'org-indent-mode)
  :config
  ;; these depend on the 'straight.el fixes' above
  (defalias #'org-git-version #'fix-org-git-version)
  (defalias #'org-release #'fix-org-release)
  (require 'org-tempo)
  (setq org-confirm-babel-evaluate nil)
  (setq org-confirm-shell-link-function nil)
  (setq org-confirm-elisp-link-function nil)
  (setq org-ellipsis " ▿"))

(provide 'babix-org)
