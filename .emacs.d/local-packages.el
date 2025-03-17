;; Extensions that don't have ELPA packages

;; Homebrew-installed packages
(if (file-exists-p "/usr/local/share/emacs/site-lisp/")
    (let ((default-directory "/usr/local/share/emacs/site-lisp/"))
      (normal-top-level-add-subdirs-to-load-path)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/vcs/github.com/dr-cs/ox-ipynb/")
