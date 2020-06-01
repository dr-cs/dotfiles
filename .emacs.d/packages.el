;; Packages from package managers and customizations

(require 'package)

;; Override the various installed Emacsen so all versions and users can share
(setq package-user-dir "/usr/local/share/emacs/elpa")

(setq
 package-archives '(("org" . "http://orgmode.org/elpa/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("gnu" . "http://elpa.gnu.org/packages/")))


;; (customize-set-variable
;;  'package-selected-packages
;;  (quote (gnu-elpa-keyring-update
;;          posframe
;;          sbt-mode
;;          scala-mode
;;          markdown-mode
;;          yaml-mode
;;          monokai-theme
;;          all-the-icons
;;          string-inflection
;;          projectile
;;          ivy
;;          git-gutter-fringe+
;;          magit
;;          graphviz-dot-mode
;;          multiple-cursors
;;          expand-region
;;          company
;;          yasnippet
;;          which-key
;;          treemacs
;;          treemacs-projectile
;;          treemacs-icons-dired
;;          treemacs-magit
;;          flycheck
;;          dap-mode
;;          lsp-mode
;;          lsp-treemacs
;;          company-lsp
;;          lsp-ui
;;          use-package)))

;; ;; Ensure packages are installed, updated, and removed if not in
;; ;; package-selected-packages list and not dependency of any listed package.
;; ;; From https://stackoverflow.com/a/39891192
;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))
;; (package-install-selected-packages)

(package-initialize)
(package-refresh-contents)
(package-install 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)
