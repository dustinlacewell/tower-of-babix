;;; ob-nasm.el --- Execute Nasm code within org-mode blocks.
;; Copyright 2020 ldlework

;; Author: ldlework <dlacewell@gmail.com>
;; Maintainer: ldlework <dlacewell@gmail.com>
;; Keywords: org babel nasm
;; URL: https://github.com/dustinlacewell/ob-nasm
;; Version: 0.0.1
;; Package-Requires: ((org "9"))

;;; Commentary:
;;
;; Execute Nasm code within org-mode blocks.

;;; Code:
(require 'org)
(require 'ob)

(defgroup ob-nasm nil
  "org-mode blocks for Nasm."
  :group 'org)

;;;###autoload
(defun org-babel-execute:nasm (body params)
  "org-babel nasm hook."
  (let ((source-file (concat temporary-file-directory "babel.s"))
        (object-file (concat temporary-file-directory "babel.o"))
        (binary-file (concat temporary-file-directory "babel")))
    (write-region body nil source-file)
    (shell-command (format "nasm -f elf64 -o %s %s" object-file source-file))
    (shell-command (format "ld -o %s %s" binary-file object-file))
    (shell-command (format "chmod +x %s" binary-file))
    (s-trim (shell-command-to-string binary-file))))

;;;###autoload
(eval-after-load "org"
  '(add-to-list 'org-src-lang-modes '("nasm" . nasm)))

(provide 'ob-nasm)

;;; ob-nasm.el ends here
