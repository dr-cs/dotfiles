
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/local-packages.el")
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/options.el")
(load "~/.emacs.d/mu4e.el")
(load "~/.emacs.d/org.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company yasnippet multiple-cursors magit graphviz-dot-mode git-gutter-fringe+ expand-region ensime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
