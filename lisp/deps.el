(require 'ob-nasm (concat (file-name-directory (or load-file-name buffer-file-name)) "ob-nasm.el"))

(use-package csharp-mode)
(use-package ess) ;; R
(use-package fsharp-mode)
(use-package geiser) ;; Scheme
(use-package go-mode)
(use-package haskell-mode)
(use-package lua-mode)
(use-package nasm-mode)
(use-package perl-mode)
(use-package ruby-mode)
(use-package rust-mode)
(use-package tuareg) ;; OCaml

(setq geiser-active-implementations '(guile))

(use-package ob-csharp
  :straight (ob-csharp :type git
                       :host github
                       :repo "thomas-villagers/ob-csharp"
                       :files ("src/ob-csharp.el")))
(use-package ob-fsharp
  :straight (ob-fsharp :type git
                       :host github
                       :repo "zweifisch/ob-fsharp"
                       :files ("ob-fsharp.el")))

(use-package ob-rust
  :straight (ob-rust :type git
                     :host github
                     :repo "zweifisch/ob-rust"
                     :files ("ob-rust.el")))
(use-package ob-go
  :straight (ob-go :type git
                   :host github
                   :repo "pope/ob-go"
                   :files ("ob-go.el")))


(setq org-babel-load-languages
      '((C . t)
        (R . t)
        (awk . t)
        (emacs-lisp . t)
        (fortran . t)
        (go . t)
        (js . t)
        (lua . t)
        (nasm . t)
        (ocaml . t)
        (perl . t)
        (python . t)
        (ruby . t)
        (rust . t)
        (scheme . t)
        (shell . t)))

(org-babel-do-load-languages 'org-babel-load-languages
                             org-babel-load-languages)


