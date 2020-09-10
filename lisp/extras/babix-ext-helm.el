(use-package helm
  :config
  (helm-mode 1)
  (require 'helm-config)

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-h f") 'helm-apropos)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-c y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-r") 'helm-recentf))

(defvar helm-full-frame-threshold 0.75)

(when window-system
  (defun helm-full-frame-hook ()
    (let ((threshold (* helm-full-frame-threshold (x-display-pixel-height))))
      (setq helm-full-frame (< (frame-height) threshold))))
  (add-hook 'helm-before-initialize-hook 'helm-full-frame-hook))

(provide 'babix-ext-helm)
