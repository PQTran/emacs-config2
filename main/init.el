(let ((current-dir (get-current-directory)))
  (load-file (concat current-dir "visual/init.el"))
  (load-file (concat current-dir "file/init.el"))
  (load-file (concat current-dir "lang/init.el"))
  (load-file (concat current-dir "dev/init.el")))
