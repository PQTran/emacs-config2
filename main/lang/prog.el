;; for highlighting color codes in text
(use-package rainbow-mode
  :hook (prog-mode-hook . rainbow-mode))

;; highlights bracket delimiters
(use-package rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))
