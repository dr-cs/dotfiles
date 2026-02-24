;; Customization for stuff built-in to Emacs

;; (load-theme 'modus-operandi-tinted)
(load-theme 'modus-vivendi-tinted)
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 160)
;; (set-face-attribute 'variable-pitch nil
;;                     :family "Hack"
;;                     :height 160)
;; (set-face-attribute 'fixed-pitch nil
;;                     :family "Hack"
;;                     :height 160)
;; (setq modus-themes-mixed-fonts t)
(setq ef-themes-mixed-fonts t)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(setq-default variable-pitch-mode nil)
;; (add-hook 'org-mode-hook #'variable-pitch-mode)
;; (add-hook 'markdown-mode-hook #'variable-pitch-mode)

(setq-default visible-bell 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-paren-mode 1)
(tool-bar-mode 0)
(if (boundp 'aquamacs-version) (tabbar-mode 0))
(set-scroll-bar-mode 'right)

(setq-default visual-line-fringe-indicators '(nil nil))
(setq-default word-wrap t)
(setq-default column-number-mode t)
(setq-default require-final-newline t)
(setq help-window-select t)
(show-paren-mode 1)
(delete-selection-mode 1)
(transient-mark-mode 1)
(setq-default ispell-program-name (chomp (shell-command-to-string "which ispell")))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(auto-save-mode 1)

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
(set-language-environment "UTF-8")

;; From http://www.emacswiki.org/emacs/SmoothScrolling
;; Scroll one line at a time (less "jumpy" than defaults)
(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq-default mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq-default mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq-default scroll-step 1) ;; keyboard scroll one line at a time

;; Prevent mouse-1 from opening links in Markdown and org buffers
(setq-default mouse-1-click-follows-link nil)

;; Wider than 80 for general editing, e.g., org-mode tables. Use
;; fill-column-indicator for programming modes
(add-to-list 'initial-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'initial-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(height . 80))

;; Got this idea from
;; https://protesilaos.com/codelog/2024-02-08-emacs-window-rules-display-buffer-alist/
(setq display-buffer-alist
      ;; For pop-up info buffers like *Help*, *Warnings*, *Messages*,
      ;; etc., place window below, dedicate window to buffer so don't
      ;; accidentally open a new buffer in it, focus it so it can be
      ;; easily dismissed.
      '(
        ("\\*.+\\*"
         ;; List of display functions
         (display-buffer-reuse-mode-window display-buffer-below-selected)
         ;; Parameters
         ;; (window-height . fit-window-to-buffer)
         (dedicated . t)
         (body-function . (lambda (window) (select-window window)))))
)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-width-start t)
(setq display-line-numbers-grow-only t)
;; (add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (add-hook 'text-mode-hook #'display-line-numbers-mode)
