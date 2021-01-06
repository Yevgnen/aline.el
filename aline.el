;;; aline.el ---  -*- lexical-binding: t; -*-
;;; Commentary:

(require 'align)

;;; Code:

;;;###autoload
(defun aline-whitespace (beg end)
  "Align columns by whitespace.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\)\\s-" 1 0 t))

;;;###autoload
(defun aline-ampersand (beg end)
  "Align columns by ampersand.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\)&" 1 1 t))

;;;###autoload
(defun aline-quote-space (beg end)
  "Align columns by quote and space.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\).*\\s-\"" 1 0 t))

;;;###autoload
(defun aline-equals (beg end)
  "Align columns by equals sign.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\)=" 1 0 t))

;;;###autoload
(defun aline-comma (beg end)
  "Align columns by comma.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\)," 1 1 t))

;;;###autoload
(defun aline-dot (beg end)
  "Align columns by dot.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\)\\\." 1 1 t))

;;;###autoload
(defun aline-colon (beg end)
  "Align columns by equals sign.
BEG and END mark the limits of the region."
  (interactive "r")
  (align-regexp beg end
                "\\(\\s-*\\):" 1 0 t))

(with-eval-after-load 'hydra
  (defhydra hydra-align (:color blue)
    "Align"
    ("," align-comma "Comma")
    ("." align-dot "Dot")
    (":" align-colon "Colon")
    ("=" align-equals "Equal")
    ("SPC" align-whitespace "Space")
    ("&" align-ampersand "Ampersand")
    ("c" align-current "Current")
    ("r" align-regexp "Regexp")
    ("q" nil))
  (hydra-set-property 'hydra-align :verbosity 1)
  (bind-keys ("C-x \\" . hydra-align/body)))

(provide 'aline)

;;; aline.el ends here
