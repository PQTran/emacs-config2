;; font
;; alternatively: "Source Code Pro"
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 110)

;; Chinese font display
(set-fontset-font "fontset-default" 'han "Source Han Sans TC")

;; removing some visuals
(blink-cursor-mode 0)
(menu-bar-mode 0)
(toggle-scroll-bar 0)
(toggle-horizontal-scroll-bar 0)
(tool-bar-mode 0)

;; line numbering
(use-package linum
  :hook (prog-mode-hook . linum-mode))
;; line highlighting
(global-hl-line-mode 1)
;; line wrapping
(visual-line-mode 1)

;; replace tabs with space
(setq-default indent-tabs-mode nil)

;; displaying whitespaces
(use-package whitespace
  :hook (prog-mode-hook . whitespace-mode)
  :config
  (setq whitespace-style '(face trailing tabs lines-tail empty tab-mark))
  (set-face-foreground 'whitespace-tab "white")
  (set-face-background 'whitespace-tab "coral")
  (set-face-foreground 'whitespace-trailing "white")
  (set-face-background 'whitespace-trailing "coral")
  (set-face-background 'whitespace-empty "coral"))
