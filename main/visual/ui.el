;; https://github.com/purcell/page-break-lines
(use-package page-break-lines
  :requires dashboard)

;; https://github.com/domtronn/all-the-icons.el
(use-package all-the-icons
  :requires dashboard)

(defun configure-dashboard-items ()
  (setq dashboard-items '((projects . 5)
                          (bookmarks . 5)
                          (recents . 5)
                          ;; (registers . 3)
			  )))

(defun randomize-startup-banner ()
  (let* ((banners (vector 1 3 (intern "official")))
	 (random-banner (elt banners (random (length banners)))))
    (setq dashboard-startup-banner random-banner)))

;; https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard
  :after projectile
  :config
  (dashboard-setup-startup-hook)
  :init
  (randomize-startup-banner)
  (configure-dashboard-items))

;; (use-package centaur-tabs
;;   :demand
;;   :bind
;;   ("C-<left>" . centaur-tabs-backward)
;;   ("C-<right>" . centaur-tabs-forward)
;;   :config
;;   (centaur-tabs-mode 1)
;;   (centaur-tabs-headline-match)
;;   :init
;;   (setq centaur-tabs-style "rounded"
;;         centaur-tabs-height 25
;;         centaur-tabs-set-icons t
;;         cenatur-tabs-gray-out-icons 'buffer
;;         centaur-tabs-set-bar 'over
;;         centaur-tabs-set-modified-marker t
;;         centaur-tabs-modified-marker "×*"))

;; https://github.com/Malabarba/smart-mode-line
(use-package smart-mode-line
  :config
  (sml/setup)
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 1))
