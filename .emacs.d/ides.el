;; Packages and settings to provide IDE-like features for particular langauges

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Specific langauge modes

;; Enable scala-mode for highlighting, indentation and motion commands
(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General programming support

(use-package flycheck
  :init (global-flycheck-mode))


(use-package yasnippet
  :demand
  :config
  (setq yas-snippet-dirs
        '(;; personal snippets
          "~/.emacs.d/snippets"
          ;; You'll need to clone https://github.com/AndreaCrotti/yasnippet-snippets
          ;; and customize this based on where you clone it.
          "~/vcs/github.com/AndreaCrotti/yasnippet-snippets"
          )))


(use-package company :demand)

(use-package expand-region
  :demand
  :config
  :bind
   ("C-=" . er/expand-region))

(use-package graphviz-dot-mode
  :demand
  :config
  (setq-default graphviz-dot-auto-indent-on-semi nil)
  (setq-default graphviz-dot-indent-width 4)
  (setq graphviz-dot-auto-indent-on-semi nil))

(use-package magit
  :demand
  :bind
  ("C-x g" . magit-status))


(use-package git-gutter-fringe+
  :demand
  :config
  (if window-system (global-git-gutter+-mode t)))

(use-package projectile
  :demand
  :pin melpa-stable
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind   (("s-f" . projectile-find-file)
           ("s-F" . projectile-grep)))

(use-package monokai-theme
  :demand
  :config
  (load-theme 'monokai t))


(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Use the Debug Adapter Protocol for running tests and debugging
;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))
    :bind
    (:map global-map
          ("M-0"       . treemacs-select-window)
          ("C-x t 1"   . treemacs-delete-other-windows)
          ("C-x t t"   . treemacs)
          ("C-x t B"   . treemacs-bookmark)
          ("C-x t C-t" . treemacs-find-file)
          ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; (use-package treemacs-icons-dired
;;   :after treemacs dired
;;   :ensure t
;;   :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language Server Protocol

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :hook
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  (lsp-mode . lsp-enable-which-key-integration)

  :config
  (setq lsp-prefer-flymake nil))

;; enable nice rendering of documentation on hover
(use-package lsp-ui)

;; Use the Tree View Protocol for viewing the project structure and triggering compilation
(use-package lsp-treemacs
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t))
