;; incremental completion
(use-package helm
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x C-b" . helm-buffers-list)
   ("M-y" . helm-show-kill-ring)
   ("C-x b" . helm-mini))
  :config (helm-mode 1))

;; helm for describe bindings C-h b
(use-package helm-descbinds
  :after (helm)
  :config (helm-descbinds-mode 1))

;; (defconst helm-ag-directory-arg 4)
(defun helm-ag-filename ()
  (interactive)
  (let ((helm-ag-command-option "-g"))
    (helm-do-ag)))

(use-package ag
  :if (executable-find "ag"))

(use-package helm-ag
  :after (ag)
  :config
  (bind-key* "C-c f s" 'helm-do-ag-this-file)
  (bind-key* "C-c f a" 'helm-do-ag)
  (bind-key* "C-c f g" 'helm-ag-filename))

;; (defun override-projectile-add-known-project ()
;;   (fset 'original-add-known-project (symbol-function 'projectile-add-known-project))
;;   (defun projectile-add-known-project ()
;;     (interactive)
;;     (call-interactively 'original-add-known-project)
;;     (projectile-save-known-projects)))

;; ;; (defun update-projectile-project-type ()
;; ;;   (projectile-register-project-type 'jekyll '("Gemfile" "_includes" "_layouts" "_posts")
;; ;;                                     :project-file "Gemfile"
;; ;;                                     :compile "jekyll build"
;; ;;                                     :run "jekyll serve"))

;; ;; project navigation
;; (use-package projectile
;;   :init
;;   (setq projectile-known-projects-file (concat generated-dir "projectile-bookmarks.eld"))
;;   (setq projectile-track-known-projects-automatically nil)
;;   (setq projectile-switch-project-action 'projectile-dired)
;;   (setq projectile-completion-system 'helm)
;;   ;; to improve caching and indexing performance
;;   (setq projectile-cache-file (concat generated-dir "projectile.cache"))
;;   (setq projectile-enable-caching t)
;;   ;; alien: .gitignore
;;   ;; native: .projectile
;;   ;; hybrid: only reads .gitignore for some reason
;;   (setq projectile-indexing-method 'alien)
;;   :config
;;   ;; manually add projectile project
;;   (override-projectile-add-known-project)
;;   ;; (update-projectile-project-type)
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;   (projectile-mode 1))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))

(use-package isearch
  :ensure nil
  :bind
  ("C-s" . isearch-forward-regexp)
  ("C-r" . isearch-backward-regexp))

;; ;;; on hitting Enter on xref page, change the current buffer to the selected item (killing the buffer)
;; ;;; on hitting Ctrl-j on xref page, change the other buffer to the seletecd item (temporarily)
;; ;;; https://emacs.stackexchange.com/questions/16809/override-a-function-locally-but-allow-calls-to-the-original-function
;; (use-package dumb-jump
;;   :bind (:map xref--xref-buffer-mode-map
;;               ;; ("Enter" . )
;;               ("C-j" . xref-goto-xref)
;;               ("n" . forward-line)
;;               ("p" . (lambda () (interactive) (forward-line -1))))
;;   :hook
;;   (xref-backend-functions . dumb-jump-xref-activate))
