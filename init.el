(defun get-loading-directory ()
  (file-name-directory load-file-name))

(defun get-buffer-directory ()
  (file-name-directory (or buffer-file-name "")))

(defun get-current-directory ()
  (let ((is-loading load-in-progress)
        (visited-file (get-buffer-directory)))
    (cond (is-loading (get-loading-directory))
          ((stringp visited-file) visited-file)
          (t default-directory))))

(let ((startup-dir (concat (get-current-directory) "startup/")))
  (load-file (concat startup-dir "packages.el"))
  (load-file (concat startup-dir "overrides.el"))
  (load-file (concat startup-dir "init.el")))

(let ((main-dir (concat (get-current-directory) "main/")))
  (load-file (concat main-dir "init.el")))

(let ((extra-dir (concat (get-current-directory) "extra/")))
  (print "world"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(f use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
