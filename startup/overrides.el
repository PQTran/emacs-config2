;;; redefine yes/no prompt
(defun pqtran-prompt-validate (input)
  (or (string= "Y" input)
      (string= "y" input)
      (string= "N" input)
      (string= "n" input)))

(defun pqtran-prompt-yes-validate (input)
  (or (string= "Y" input)
      (string= "y" input)))

(defun pqtran-prompt (prompt)
  (interactive)
  (setq response (read-from-minibuffer (concat prompt  "[Y/n] ")))

  (while (not (pqtran-prompt-validate response))
    (setq response (read-from-minibuffer (concat prompt "Try again. [Y/n] "))))

  (pqtran-prompt-yes-validate response))

(fset 'yes-or-no-p 'pqtran-prompt)
(fset 'y-or-n-p 'pqtran-prompt)

;; ;; open shell in live window
;; (defun pqtran-buffer-list-contains-p (target)
;;   (let* ((buffers (buffer-list))
;;          (filtered-buffers (seq-filter (lambda (buffer)
;;                                          (string-equal (buffer-name buffer) target))
;;                                        buffers)))
;;     (= (length filtered-buffers) 1)))

;; ;; TODO have default shell name based on current buffer name
;; (use-package shell
;;   :config
;;   ;; store original shell function, so we can use its namespace
;;   (fset 'original-shell (symbol-function 'shell))
;;   (defun shell (name)
;;     (interactive "BShell name: ")
;;     (let ((shell-name (concat "shell-" name)))
;;       (if (pqtran-buffer-list-contains-p shell-name)
;;           (message "Shell name taken already.")
;;         (progn (create-file-buffer shell-name)
;;                (switch-to-buffer shell-name)
;;                (original-shell shell-name))))))

;; (make-auto-save-file-name)



;; ;;; change the output directory to generated-dir
;; (defun make-auto-save-file-name ()
;;   "Return file name to use for auto-saves of current buffer.
;; Does not consider `auto-save-visited-file-name' as that variable is checked
;; before calling this function.  You can redefine this for customization.
;; See also `auto-save-file-name-p'."
;;   (if buffer-file-name
;;       (let ((handler (find-file-name-handler buffer-file-name
;;                                              'make-auto-save-file-name)))
;;         (if handler
;;             (funcall handler 'make-auto-save-file-name)
;;           (let ((list auto-save-file-name-transforms)
;;                 (filename buffer-file-name)
;;                 result uniq)
;;             ;; Apply user-specified translations
;;             ;; to the file name.
;;             (while (and list (not result))
;;               (if (string-match (car (car list)) filename)
;;                   (setq result (replace-match (cadr (car list)) t nil
;;                                               filename)
;;                         uniq (car (cddr (car list)))))
;;               (setq list (cdr list)))
;;             (if result
;;                 (if uniq
;;                     (setq filename (concat
;;                                     (file-name-directory result)
;;                                     (subst-char-in-string
;;                                      ?/ ?!
;;                                      (replace-regexp-in-string "!" "!!"
;;                                                                filename))))
;;                   (setq filename result)))
;;             (setq result
;;                   (if (and (eq system-type 'ms-dos)
;;                            (not (msdos-long-file-names)))
;;                       ;; We truncate the file name to DOS 8+3 limits
;;                       ;; before doing anything else, because the regexp
;;                       ;; passed to string-match below cannot handle
;;                       ;; extensions longer than 3 characters, multiple
;;                       ;; dots, and other atrocities.
;;                       (let ((fn (dos-8+3-filename
;;                                  (file-name-nondirectory buffer-file-name))))
;;                         (string-match
;;                          "\\`\\([^.]+\\)\\(\\.\\(..?\\)?.?\\|\\)\\'"
;;                          fn)
;;                         ;; (concat generated-dir
;;                         (concat (file-name-directory buffer-file-name)
;;                                 "#" (match-string 1 fn)
;;                                 "." (match-string 3 fn) "#"))
;;                     (concat generated-dir "auto-save/"
;;                             "#"
;;                             (file-name-nondirectory filename)
;;                             "#")))
;;             ;; Make sure auto-save file names don't contain characters
;;             ;; invalid for the underlying filesystem.
;;             (if (and (memq system-type '(ms-dos windows-nt cygwin))
;;                      ;; Don't modify remote filenames
;;                      (not (file-remote-p result)))
;;                 (convert-standard-filename result)
;;               result))))

;;     ;; Deal with buffers that don't have any associated files.  (Mail
;;     ;; mode tends to create a good number of these.)

;;     (let ((buffer-name (buffer-name))
;;           (limit 0)
;;           file-name)
;;       ;; Restrict the characters used in the file name to those which
;;       ;; are known to be safe on all filesystems, url-encoding the
;;       ;; rest.
;;       ;; We do this on all platforms, because even if we are not
;;       ;; running on DOS/Windows, the current directory may be on a
;;       ;; mounted VFAT filesystem, such as a USB memory stick.
;;       (while (string-match "[^A-Za-z0-9-_.~#+]" buffer-name limit)
;;         (let* ((character (aref buffer-name (match-beginning 0)))
;;                (replacement
;;                 ;; For multibyte characters, this will produce more than
;;                 ;; 2 hex digits, so is not true URL encoding.
;;                 (format "%%%02X" character)))
;;           (setq buffer-name (replace-match replacement t t buffer-name))
;;           (setq limit (1+ (match-end 0)))))
;;       ;; Generate the file name.
;;       (setq file-name
;;             (make-temp-file
;;              (let ((fname
;;                     (expand-file-name
;;                      (format "#%s#" buffer-name)
;;                      ;; Try a few alternative directories, to get one we can
;;                      ;; write it.
;;                      (cond
;;                       ((file-writable-p default-directory) default-directory)
;;                       ((file-writable-p "/var/tmp/") "/var/tmp/")
;;                       ("~/")))))
;;                (if (and (memq system-type '(ms-dos windows-nt cygwin))
;;                         ;; Don't modify remote filenames
;;                         (not (file-remote-p fname)))
;;                    ;; The call to convert-standard-filename is in case
;;                    ;; buffer-name includes characters not allowed by the
;;                    ;; DOS/Windows filesystems.  make-temp-file writes to the
;;                    ;; file it creates, so we must fix the file name _before_
;;                    ;; make-temp-file is called.
;;                    (convert-standard-filename fname)
;;                  fname))
;;              nil "#"))
;;       ;; make-temp-file creates the file,
;;       ;; but we don't want it to exist until we do an auto-save.
;;       (condition-case ()
;;           (delete-file file-name)
;;         (file-error nil))
;;       file-name)))
