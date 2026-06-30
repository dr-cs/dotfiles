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

;; (use-package eldoc-box)

(use-package eglot
  :bind (:map eglot-mode-map
              ("C-c d" . flymake-show-buffer-diagnostics)
              ("C-c f" . eglot-format)
              ("C-c h" . eldoc)
              ("C-c o" . eglot-code-action-organize-imports)
              ("C-c r" . eglot-rename)
              ("C-c q" . eglot-code-action-quickfix))
  :config
  ;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode t)
  ;; (setq eldoc-box-max-pixel-width (* .33 (frame-inner-width)))
  ;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode t)
)

;; Adapted from https://www.reddit.com/r/emacs/comments/1923cz8/eglot_unsuported_or_ignored_lsp_capability/
;; (use-package eglot
;;   :hook (((c-mode c++-mode python-mode) . eglot-ensure))
;;   :custom (eglot-send-changes-idle-time 0.1)
;;   :bind-keymap ("C-c l" . eglot-mode-map)
;;   :bind (:map eglot-mode-map
;; 	      ("a" . eglot-code-actions)
;; 	      ("r" . eglot-rename)
;; 	      ("h" . eldoc)
;; 	      ("f" . eglot-format)
;; 	      ("F" . eglot-format-buffer)
;; 	      ("d" . xref-find-definitions-at-mouse)
;; 	      ("D" . eglot-find-declaration)
;; 	      ("i" . eglot-find-implementation)))

;; Show the current buffer's imenu entries in a separate buffer
(use-package imenu-list
  :ensure t
  :config
  (setq imenu-list-focus-after-activation t)
  (global-set-key (kbd "C-.") #'imenu-list-minor-mode)
)

(use-package yasnippet
  :defer 1
  :diminish yas-minor-mode
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :after yasnippet
  :config (yasnippet-snippets-initialize))

(setq eldoc-echo-area-prefer-doc-buffer t
      eldoc-echo-area-use-multiline-p nil)

(use-package emmet-mode
  :hook
  (emmet-mode . sgml-mode-hook)
  (emmet-mode . css-mode-hook))

;; FUCK TREE-SITTER!!!!!
;; Thought the Emacs 30.2-1 build would fix it.  It did not.
;; FUCK TREE-SITTER!!!!!!!!!!!!!!!!!!!!!!!!!!
;; Previously:
;; The ONLY sane way to use tree-sitter
;; https://github.com/renzmann/treesit-auto
;; (use-package treesit-auto
;;   :custom
;;   (treesit-auto-install 'prompt)
;;   :config
;;   (treesit-auto-add-to-auto-mode-alist 'all)
;;   (global-treesit-auto-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python

;; First, in a shell, install the langauge server.
;; https://github.com/python-lsp/python-lsp-server

;; pip3 install "python-lsp-server[all]"

;; Then, in Emacs, install the Python treesitter grammar.  This is
;; interactive, just accept the defaults.
;;
;; M-x treesit-install-language-grammar

(use-package python
  :ensure t
  :bind (:map python-mode-map
              ("<f5>" . recompile)
              ("<f6>" . eglot-format))
  :config
  ;; (setq python-shell-interpreter "ipython"
  ;;       python-shell-interpreter-args "-i --simple-prompt")
  ;; (add-hook 'python-mode-hook 'eglot-ensure)
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(python-mode . ("pylsp"))))
  ;; Add following line to with-eval-after-load
  ;;   (add-hook 'after-save-hook 'eglot-format))
  :hook
  ((python-mode . eglot-ensure)
   (python-mode . flymake-mode))
  :mode (("\\.py\\'" . python-mode)))


;; (use-package jupyter)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++

;; Much inspired by https://olddeuteronomy.github.io/post/cpp-programming-in-emacs/

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-or-c++-mode-hook 'eglot-ensure)
(add-hook 'c-or-c++-mode-hook 'electric-pair-mode)

;; .h files to open in c++-mode rather than c-mode.
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(setq c-default-style "stroustrup")
(setq c-basic-indent 4)
(setq c-basic-offset 4)

;; emacs-fu: don’t indent inside of C++ namespaces
;; http://brrian.tumblr.com/post/9018043954/emacs-fu-dont-indent-inside-of-c-namespaces
(c-set-offset 'innamespace 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SQL

;; Why is built-in SQL mode so awful?
;;



;; https://github.com/ppareit/graphviz-dot-mode
(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4)
  :hook
  (graphviz-dot-mode . flycheck-mode))
