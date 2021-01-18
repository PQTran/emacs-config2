(use-package paredit
  :hook (emacs-lisp-mode-hook . paredit-mode)
  :bind (:map paredit-mode-map
              ("M-)" . paredit-forward-slurp-sexp)
              ("M-(" . paredit-forward-barf-sexp)
              ("M-O" . paredit-backward-slurp-sexp)
              ("M-P" . paredit-backward-barf-sexp)))
