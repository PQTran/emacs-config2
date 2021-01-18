;; create folder directory
(defun pqtran-create-dir (dir)
  (if (not (file-directory-p dir))
      (make-directory dir)))

(use-package bind-key)

(use-package f
  :config
  (let ((base-dir (f-slash (f-parent (get-current-directory)))))
    (setq generated-dir (f-slash (concat base-dir "generated")))))
