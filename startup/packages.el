;; loads installed package for usage
(require 'package)
(package-initialize)

;; package repositories
;; https is having issues with certain packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;;; prevents recalling package-initialize after reading init files
(setq package-enable-at-startup nil)

;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; defaults ensure value
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-hook-name-suffix nil)
