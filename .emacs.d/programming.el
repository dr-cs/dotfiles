;; Programming packages, modes, settings.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General

;; https://github.com/akermu/emacs-libvterm
;; Needs CMake to be installed on the host OS
(use-package vterm
    :ensure t
    :bind (("C-`" . vterm-other-window))
    :config
    (add-hook 'vterm-mode-hook
          (lambda ()
               (set (make-local-variable 'buffer-face-mode-face) '(:family "MesloLGS NF"))
               (buffer-face-mode t)))
    (add-to-list 'vterm-eval-cmds '("update-pwd" (lambda (path) (setq default-directory path)))))

;; https://github.com/purcell/envrc
(use-package envrc
  :hook (after-init . envrc-global-mode))

;; Use the shell's PATH when executing stuff from Emacs.  This is
;; particularly helpful for Python virtual environments.  I use
;; direnv to activate the venv automatically.
;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package eglot
  :bind (:map eglot-mode-map
              ("C-c h" . eldoc)
              ("C-c o" . eglot-code-action-organize-imports)
              ("C-c f" . flymake-show-buffer-diagnostics)
              ("C-c r" . eglot-rename)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python

;; First, in a shell, install the langauge server.
;; https://github.com/python-lsp/python-lsp-server
;;
;; pip3 install "python-lsp-server[all]"

;; Then, in Emacs, install the Python treesitter grammar.  This is
;; interactive, just accept the defaults.
;;
;; M-x treesit-install-language-grammar

(use-package python
  :ensure t
  :bind (:map python-ts-mode-map
              ("<f5>" . recompile)
              ("<f6>" . eglot-format))
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt")
  :hook
  ((python-ts-mode . eglot-ensure)
   (python-ts-mode . flymake-mode))
  :mode (("\\.py\\'" . python-ts-mode)))
