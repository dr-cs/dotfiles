;; Customization for stuff built-in to Emacs

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
(setq-default ispell-program-name (chomp (shell-command-to-string "which ispell")))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; UTF-8 everywhere
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; linum-mode everywhere, except where it doesn't belong
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
(setq linum-eager nil)

;; Keybindings
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x g") 'magit-status)

;; From http://www.emacswiki.org/emacs/SmoothScrolling
;; Scroll one line at a time (less "jumpy" than defaults)
(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq-default mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq-default mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq-default scroll-step 1) ;; keyboard scroll one line at a time

;; Wider than 80 for general editing, e.g., org-mode tables. Use
;; fill-column-indicator for programming modes
(defvar-local desired-width 96)
(defvar-local desired-height 50)

;; Account for size of gutter and fringes
(add-to-list 'initial-frame-alist '(width . desired-width))
(add-to-list 'default-frame-alist '(width . desired-width))

(defun my:window-setup-hook ()
  (when (and (string= system-type "gnu/linux") window-system)
    (let* ((dconf-entry
            (shell-command-to-string
             "dconf read /com/ubuntu/user-interface/scale-factor"))
           (scale-factor (progn (string-match "'[eD][FD]P1': \\([0-9]+\\)[,\}]"
                                              dconf-entry)
                                (string-to-int (match-string 1 dconf-entry))))
           (text-width (truncate (/ desired-width (/ scale-factor 8.0))))
           (text-height (truncate (/ desired-height (/ scale-factor 8.0)))))
      (message "set-frame-size is %dx%d, scale-factor is %s"
               text-width text-height scale-factor)
      (set-frame-size (selected-frame) text-width text-height))))

(setq window-setup-hook 'my:window-setup-hook)
