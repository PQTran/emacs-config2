(pqtran-create-dir generated-dir)

;;; format: .#file-name
(setq create-lockfiles nil)

;; backup files
;; original file opened by buffer is backed up on first save
;; some files such as: init.el README.org set backup-inhibited t
(setq backup-dir (f-slash (concat generated-dir "backup")))
(pqtran-create-dir backup-dir)
(setq backup-directory-alist `(("." . ,backup-dir)))
(setq backup-by-copying t)

;; caches recently visited files
(setq recentf-save-file (concat generated-dir "recentf"))

;;; format: #file-name#
;;; update hooks: edit counts, time inactive
;;; delete hooks: buffer save
(setq auto-save-interval 200)
(setq auto-save-timeout 60)
(pqtran-create-dir (concat generated-dir "auto-save"))

;;; auto-save-list maps source files and auto-save files
;;; delete hooks: emacs exit
;;; recover-session uses list for recovery
(pqtran-create-dir (concat generated-dir "auto-save-list"))
(setq auto-save-list-file-prefix (concat generated-dir "auto-save-list/.saves-"))

(setq bookmark-default-file (concat generated-dir "bookmarks"))

(setq lsp-session-file (concat generated-dir ".lsp-session-v1"))

(setq tramp-persistency-file-name (concat generated-dir "tramp"))
