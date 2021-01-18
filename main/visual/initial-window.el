(defun get-monitor-property (monitor key)
  (cdr (assq key monitor)))

(defun get-monitor-position (monitor)
  (let* ((geometry (get-monitor-property monitor 'geometry))
         (position `(,(car geometry) . ,(car (cdr geometry)))))
    position))

(defun get-monitor (name)
  (seq-find (lambda (monitor)
              (string-equal name (get-monitor-property monitor 'name)))
            (display-monitor-attributes-list)))

(defconst laptop-monitor "eDP-1")
(defconst desktop-monitor "DP-1")
(defun configure-initial-window ()
  (let* ((display-monitor (or (get-monitor laptop-monitor)
                              (get-monitor desktop-monitor)))
	 (position (get-monitor-position display-monitor)))
    (setq initial-frame-alist
	  `((top . ,(cdr position)) (left . ,(car position))))))

;; set default frame size and placement
(configure-initial-window)
