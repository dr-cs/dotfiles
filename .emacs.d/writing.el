;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :config
  (setq tab-width 4)
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))
