;; My org-mode customizations

;; These are the suggested defaults from http://orgmode.org/org.html#Introduction
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-hook 'org-mode-hook #'flyspell-mode)

(setq-default org-support-shift-select 1)
(setq org-descriptive-links nil)

;; From https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   ;; '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))


(setq org-directory "~/Documents/org")
(if (file-directory-p org-directory) nil
      (make-directory org-directory))
(setq org-agenda-files (directory-files-recursively org-directory "org$"))

;; Graphviz dot language
(org-babel-do-load-languages
     'org-babel-load-languages
     '((dot . t)
       (python . t)
       (ditaa . t)))

(setq org-edit-src-content-indentation 0)

(plist-put org-format-latex-options :background "Transparent")
(plist-put org-format-latex-options :scale 2.0)


(require 'ox-latex)

;; https://github.com/jkitchin/ox-ipynb
;; TODO: this fails on ox-ipynb.el:78 -- (require 's).  Must be something in John Kitchin's personal setup.
;; (add-to-list 'load-path "~/vcs/github.com/dr-cs/ox-ipynb")
;; (require 'ox-ipynb)

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("exam"
               "\\documentclass{exam}"
               ;; org-latex-export requires the header, but the exam
               ;; class doesn't want one. Comment out,
               ;; org-latex-export and exam class both happy
               ("\\begin{questions} %% %s"
                "\\end{questions}"
                "\\begin{questions} %% %s"
                "\\end{questions}")
               ("\\question %s " . "\\question* %s")
               ("\\begin{parts} %s"
                "\\end{parts}"
                "\\begin{parts} %s"
                "\\end{parts}")))

(setq org-latex-listings t)
(setq org-confirm-babel-evaluate nil)
(setq org-hierarchical-todo-statistics nil)
