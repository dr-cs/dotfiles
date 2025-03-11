;; Customization for stuff built-in to Emacs

(load-theme 'modus-vivendi-tinted)
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 160)
(set-face-attribute 'variable-pitch nil :family "SF Pro")
(set-face-attribute 'fixed-pitch nil :family "Hack")
(setq modus-themes-mixed-fonts t)
(setq ef-themes-mixed-fonts t)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'text-mode-hook #'variable-pitch-mode)


(setq-default visible-bell 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-paren-mode 1)
(if window-system (tool-bar-mode 0))
(if (boundp 'aquamacs-version) (tabbar-mode 0))
(setq-default linum-format "%4d ")
(set-scroll-bar-mode 'right)

(setq-default visual-line-fringe-indicators '(nil nil))
(setq-default word-wrap t)
(setq-default column-number-mode t)
(show-paren-mode 1)
(delete-selection-mode 1)
(transient-mark-mode 1)
;;(setq-default ispell-program-name (chomp (shell-command-to-string "which ispell")))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Got this from https://colinxy.github.io/software-installation/2016/09/24/emacs25-easypg-issue.html
(setq epa-pinentry-mode 'loopback)

;; UTF-8 everywhere
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; From http://www.emacswiki.org/emacs/SmoothScrolling
;; Scroll one line at a time (less "jumpy" than defaults)
(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq-default mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq-default mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq-default scroll-step 1) ;; keyboard scroll one line at a time

;; Wider than 80 for general editing, e.g., org-mode tables. Use
;; fill-column-indicator for programming modes
(add-to-list 'initial-frame-alist '(width . 150))
(add-to-list 'default-frame-alist '(width . 150))
(add-to-list 'initial-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(height . 70))
