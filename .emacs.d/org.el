;; My org-mode customizations

;; These are the suggested defaults from http://orgmode.org/org.html#Introduction
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


(setq-default org-support-shift-select 1)
(setq org-descriptive-links nil)

(setq org-agenda-files (list "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/work.org"
                             "~/Dropbox/org/calendar.org"))

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
