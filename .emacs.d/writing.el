;; https://elpa.gnu.org/packages/doc/auctex.html
(use-package auctex
  :ensure t)

;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :config
  (setq tab-width 4)
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;; https://github.com/emacs-citar/citar
(use-package citar
  :custom
  (citar-bibliography '("~/Dropbox/bibtex-db/references.bib"))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup))

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))
