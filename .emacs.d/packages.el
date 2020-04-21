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
(use-package fill-column-indicator :demand)
(use-package projectile
  :demand
  :pin melpa-stable
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind   (("s-f" . projectile-find-file)
           ("s-F" . projectile-grep)))
(use-package all-the-icons :demand)
(use-package neotree :demand)
(use-package monokai-theme :demand)

(load-theme 'monokai t)

;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'git-gutter-fringe+)
(if window-system (global-git-gutter+-mode t))

(require 'fill-column-indicator)
(setq fci-rule-column 80)
(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'java-mode-hook 'fci-mode)
(add-hook 'scala-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)

(require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '(;; personal snippets
;;         "~/.emacs.d/snippets"
;;         ;; You'll need to clone https://github.com/AndreaCrotti/yasnippet-snippets
;;         ;; and customize this based on where you clone it.
;;         "~/vcs/github.com/AndreaCrotti/yasnippet-snippets"
;;         ))
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
(setq-default company-idle-delay 1)

;; graphviz-dot-mode customizations
(require 'graphviz-dot-mode)

(setq-default graphviz-dot-auto-indent-on-semi nil)
(setq-default graphviz-dot-indent-width 4)
(setq graphviz-dot-auto-indent-on-semi nil)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; neotree customizations
(require 'neotree)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-toggle)
            (if (neo-global--window-exists-p)
                ;; Result of toggle was to show neotree window
                (progn
                  (neotree-dir project-dir)
                  (neotree-find file-name)
                  (set-frame-width (selected-frame)
                                   (+ neo-window-width
                                      (frame-width (selected-frame)))))
              ;; Result of toggle was to hide neotree window
              (set-frame-width (selected-frame)
                               (- (frame-width (selected-frame))
                                  neo-window-width)))))
        (message "Could not find git project root.")))

(global-set-key [f8] 'neotree-project-dir)
(setq neo-smart-open t)
(setq neo-window-width 30)
(setq projectile-switch-project-action 'neotree-projectile-action)
