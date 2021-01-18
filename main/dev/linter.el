(defun emacs-d-update-flycheck-fringe ()
  (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
    (vector #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00111100
            #b01111110
            #b01111110
            #b01111110
            #b01111110
            #b00111100
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000))

  (flycheck-define-error-level 'info
    :severity -10
    :compilation-level 0
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-info
    :error-list-face 'flycheck-error-list-info)
  (flycheck-define-error-level 'warning
    :severity 10
    :compilation-level 1
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-warning
    :error-list-face 'flycheck-error-list-warning)
  (flycheck-define-error-level 'error
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-error
    :error-list-face 'flycheck-error-list-error)
  (set-frame-parameter (car (frame-list)) 'left-fringe 10))

(use-package flycheck
  :hook
  (java-mode-hook . flycheck-mode)
  (js-mode-hook . flycheck-mode)
  (sh-mode-hook . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (emacs-d-update-flycheck-fringe))

;;; consider the affect of having multiple use-package flycheck
(use-package flycheck-rust
  :after (flycheck)
  :hook
  (rust-mode-hook . flycheck-mode)
  (rust-mode-hook . flycheck-rust-setup))
