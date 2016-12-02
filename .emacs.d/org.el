;; My org-mode customizations

;; These are the suggested defaults from http://orgmode.org/org.html#Introduction
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq-default org-support-shift-select 1)
(setq org-descriptive-links nil)

;; Graphviz dot language
(org-babel-do-load-languages
     'org-babel-load-languages
     '((dot . t)
       (python . t)
       (ditaa . t)))

(require 'ox-latex)
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
