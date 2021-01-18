(use-package company
  :hook (prog-mode-hook . company-mode)
  ;; (nxml-mode-hook . company-mode)
  :bind (:map company-mode-map
              ("<tab>" . company-indent-or-complete-common))
  ;; :config (push 'company-nxml company-backends)
  ;; :init (setq company-idle-delay nil)
  )

(use-package helm-company
  :requires (helm company)
  :bind (:map company-mode-map
              ("<backtab>" . helm-company)))

;; (use-package lsp-mode
;;   :hook (rust-mode-hook . lsp-mode)
;;   :bind (("C-c l s s" . lsp)))

;; (use-package company-lsp
;;   :after (company lsp)
;;   :config (push 'company-lsp company-backends))
