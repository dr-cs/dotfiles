;; Customization for stuff built-in to Emacs

;; From https://emacs.stackexchange.com/questions/45135/change-permanently-font-size-in-aquamacs
(when (boundp 'aquamacs-version)
  (setq initial-frame-alist nil)   ;; Undo Aquamacs forced defaults
  (setq default-frame-alist nil)   ;; Undo Aquamacs forced defaults
  (aquamacs-autoface-mode -1)      ;; Use one face (font) everywhere
  ;;(set-frame-font "Menlo-14")    ;; Set the default font to Menlo size 12
  (set-default-font "Menlo-14")    ;; This would do the same.
)

;; Basics
(set-face-attribute 'default nil :height 140)
(setq-default visible-bell 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-paren-mode 1)
(if window-system (tool-bar-mode 0))
(if (boundp 'aquamacs-version) (tabbar-mode 0))
(setq-default linum-format "%4d ")
(set-scroll-bar-mode 'right)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(setq-default visual-line-fringe-indicators '(nil nil))
(setq-default word-wrap t)
(setq-default column-number-mode t)
(show-paren-mode 1)
(delete-selection-mode 1)
(transient-mark-mode 1)
;;(setq-default ispell-program-name (chomp (shell-command-to-string "which ispell")))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Got this from https://colinxy.github.io/software-installation/2016/09/24/emacs25-easypg-issue.html
(setq epa-pinentry-mode 'loopback)

;; UTF-8 everywhere
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; linum-mode everywhere, except where it doesn't belong
(if (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode)
  (progn
    (require 'linum)
    (setq linum-disabled-modes-list '(eshell-mode
                                      wl-summary-mode
                                      compilation-mode
                                      dired-mode
                                      speedbar-mode
                                      mu4e-main-mode
                                      mu4e-about-mode
                                      mu4e-view-mode
                                      mu4e-headers-mode
                                      doc-view-mode))
    (defun linum-on ()
      (unless (or (minibufferp)
                  (member major-mode linum-disabled-modes-list)
                  (and (not (eq (buffer-name) "*scratch*"))
                       (string-match "*" (buffer-name))))
        (linum-mode 1)))
    (global-linum-mode 1)
    (setq linum-eager nil)))

;; Keybindings
;;(setq mac-option-modifier 'super)
(global-set-key (kbd "M-g") 'goto-line)

;; From http://www.emacswiki.org/emacs/SmoothScrolling
;; Scroll one line at a time (less "jumpy" than defaults)
(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq-default mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq-default mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq-default scroll-step 1) ;; keyboard scroll one line at a time

;; Wider than 80 for general editing, e.g., org-mode tables. Use
;; fill-column-indicator for programming modes
(add-to-list 'initial-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'initial-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(height . 70))

(defun my:window-setup-hook ()
  (when (and (string= system-type "gnu/linux") window-system)
    (toggle-frame-maximized)
    (let* ((dconf-entry
            (shell-command-to-string
             "dconf read /com/ubuntu/user-interface/scale-factor"))
           (scale-factor (progn (string-match "'[eD][FD]P-*1': \\([0-9]+\\)[,\}]"
                                              dconf-entry)
                                (string-to-int (match-string 1 dconf-entry))))
           (text-width (truncate (/ 96 (/ scale-factor 8.0))))
           (text-height (truncate (/ 50 (/ scale-factor 8.0)))))
      (message "set-frame-size is %dx%d, scale-factor is %s"
               text-width text-height scale-factor)
      (set-frame-size (selected-frame) text-width text-height))))

(setq window-setup-hook 'my:window-setup-hook)

(use-package all-the-icons :demand)

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


(use-package multiple-cursors
  :demand
  :bind
  ("C-c m" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this)
  :config
  (setq mc/always-run-for-all t))

(use-package which-key
  :config (which-key-mode))
