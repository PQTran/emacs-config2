(let ((current-dir (get-current-directory)))
  (load-file (concat current-dir "prog.el"))
  (load-file (concat current-dir "elisp.el"))
  (load-file (concat current-dir "notes.el")))
