(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t     ; if nil, bold is universally disabled
        doom-themes-enable-italic t)  ; if nil, italics is universally disabled
  (let* ((theme-name (getenv "theme"))
         (theme-symbol (if (string-equal "default" theme-name) 'doom-one
                         (intern (format "doom-%s" theme-name)))))
    (load-theme theme-symbol t))

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'babix-ext-themes)
