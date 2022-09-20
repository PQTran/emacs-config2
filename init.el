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

(defun pqtran-insert-to-end-of-lines ()
  (interactive)
  (let* ((text (read-string "Text [default: ',']: " nil nil ","))
         (initial-pos (if (region-active-p)
                          (region-beginning)
                        (point-at-bol)))
         (end-pos (if (region-active-p)
                      (region-end)
                    (point-max)))
         (content (buffer-substring-no-properties initial-pos end-pos)))
    ;; (message content)
    (let ((updated-content (with-temp-buffer
                             (insert content)
                             (goto-char (point-min))
                             (while (< (point) (point-at-eol))
                               (end-of-line nil)
                               (insert text)
                               ;; (message (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
                               (forward-line 1))
                             (buffer-string)
                             )))
      (if (not (string-empty-p updated-content))
          (save-excursion
            (progn (kill-region initial-pos end-pos)
                   (insert updated-content))))
      )))

;;; 
;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'meta) ; make cmd key do Meta
(setq mac-option-modifier 'super) ; make opt key do Super
(setq mac-control-modifier 'control) ; make Control key do Control
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

(let ((extra-dir (concat (get-current-directory) "extra/")))
  (print "world"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(go-mode dockerfile-mode logview terraform-mode yaml-mode kotlin-mode f use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
