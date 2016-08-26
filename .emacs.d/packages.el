;; Packages from package managers and customizations

;; MELPA package manager
(require 'package)

;; Override the various installed Emacsen so all versions and users can share
(setq package-user-dir "/usr/local/share/emacs/elpa")

(setq
 package-archives '(("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))


(require 'use-package)
(setq use-package-always-ensure t)

(use-package yasnippet :demand)
(use-package company :demand)
(use-package expand-region :demand)
(use-package multiple-cursors :demand)
(use-package graphviz-dot-mode :demand)
(use-package magit :demand)
(use-package git-gutter-fringe+ :demand)

(use-package ensime :pin melpa-stable)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'git-gutter-fringe+)
(if window-system (global-git-gutter+-mode t))

(require 'yasnippet)
(setq yas-snippet-dirs
      '(;; personal snippets
        "~/.emacs.d/snippets"
        ;; You'll need to clone https://github.com/AndreaCrotti/yasnippet-snippets
        ;; and customize this based on where you clone it.
        "~/vcs/github.com/AndreaCrotti/yasnippet-snippets"
        ))
(define-key yas-minor-mode-map (kbd "\t") nil)
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-M-y") 'yas-expand)

;;keys for navigation
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "C-M-y") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "C-M-Y") 'yas-prev)
(yas-global-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(setq-default company-idle-delay 2)

;; graphviz-dot-mode customizations
(require 'graphviz-dot-mode)
(setq-default graphviz-dot-auto-indent-on-semi nil)
(setq-default graphviz-dot-indent-width 4)
