;;; ob-basic.el --- Execute Basic code within org-mode blocks.
;; Copyright 2020 ldlework

;; Author: ldlework <dlacewell@gmail.com>
;; Maintainer: ldlework <dlacewell@gmail.com>
;; Keywords: org babel basic
;; URL: https://github.com/dustinlacewell/ob-basic
;; Version: 0.0.1
;; Package-Requires: ((org "9"))

;;; Commentary:
;;
;; Execute Basic code within org-mode blocks.

;;; Code:
(require 'org)
(require 'ob)

(defgroup ob-basic nil
  "org-mode blocks for Basic."
  :group 'org)

;;;###autoload
(defun org-babel-execute:basic (body params)
  "org-babel basic hook."
  (let* ((source-file (concat temporary-file-directory "babel.bas"))
         (command (format "xbasic --quitonend %s" source-file)))
    (write-region body nil source-file)
    (s-trim (shell-command-to-string command))))

;;;###autoload
(eval-after-load "org"
  '(add-to-list 'org-src-lang-modes '("basic" . basic)))

(provide 'ob-basic)

;;; ob-basic.el ends here
