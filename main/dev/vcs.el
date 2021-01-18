(defun configure-transient-files ()
  (let ((transient-dir (f-slash (concat generated-dir "transient"))))
    (setq transient-levels-file (concat transient-dir "levels.el"))
    (setq transient-values-file (concat transient-dir "values.el"))
    (setq transient-history-file (concat transient-dir "history.el"))
    (pqtran-create-dir transient-dir)))

(use-package magit
    :bind (("C-x g" . magit-status))
    :init (configure-transient-files))
