;; I never use the customize UI, I do everything in my init scripts, so
;; save custom settings to a separate file and never load it.
;; And, yes, I install packages programmatically.
(setq custom-file "~/.emacs.d/custom.el")


(load "~/.emacs.d/core-packages.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/options.el")

;; (load "~/.emacs.d/packages.el")
;; (load "~/.emacs.d/local-packages.el")
;; (load "~/.emacs.d/functions.el")
;; (load "~/.emacs.d/options.el")
;; (load "~/.emacs.d/org.el")
;; (load "~/.emacs.d/intellij.el")
;; (load "~/.emacs.d/ides.el")
