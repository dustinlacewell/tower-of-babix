(setq babix-home (concat (getenv "HOME") "/.config/" "babix/"))
(setq user-emacs-directory babix-home)
(unless (file-exists-p babix-home)
  (make-directory babix-home))

(let ((lisp-path (file-name-directory load-file-name)))
  (add-to-list 'load-path lisp-path)
  (add-to-list 'load-path (concat lisp-path "ob"))
  (add-to-list 'load-path (concat lisp-path "extras")))

(require 'babix-straight)
(require 'babix-org)
(require 'babix-pkgs)
