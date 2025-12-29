;; My org-mode customizations

;; These are the suggested defaults from http://orgmode.org/org.html#Introduction
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-hook 'org-mode-hook #'flyspell-mode)

(setq-default org-support-shift-select 1)
(setq org-descriptive-links nil)
(setq org-startup-folded nil)

;; From https://github.com/syl20bnr/spacemacs/issues/13255#issuecomment-592998372
;; src block indentation / editing / syntax highlighting
(setq org-src-fontify-natively t
      org-src-window-setup 'current-window ;; edit in current window
      org-src-strip-leading-and-trailing-blank-lines t
      org-src-preserve-indentation t ;; do not put two spaces on the left
      org-src-tab-acts-natively t)

;; ;; From https://zzamboni.org/post/beautifying-org-mode-in-emacs/
;; (custom-theme-set-faces
;;    'user
;;    '(org-block ((t (:inherit fixed-pitch))))
;;    '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;    ;; '(org-document-info ((t (:foreground "dark orange"))))
;;    '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;    '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;    '(org-link ((t (:foreground "royal blue" :underline t))))
;;    '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;    '(org-property-value ((t (:inherit fixed-pitch))) t)
;;    '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;    '(org-table ((t (:inherit fixed-pitch))))
;;    '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;    '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))


(setq org-directory "~/Documents/org")
(if (file-directory-p org-directory) nil
      (make-directory org-directory))
(setq org-agenda-files (directory-files-recursively org-directory "org$"))

(setq org-cite-global-bibliography '("~/Dropbox/bibtex-db/references.bib"))
;;(setq org-cite-insert-processor 'citar)

;; https://orgmode.org/org.html#Capture-and-Attachments
(setq org-capture-templates
      '(("t" "To do" entry (file+headline "~/Documents/org/tasks.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Documents/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DELEGATED" "|" "DONE")))

;; https://github.com/bastibe/org-journal
(use-package org-journal
  :ensure t
  :init
  ;; ;; Change default prefix key; needs to be set before loading org-journal
  ;; (setq org-journal-prefix-key "C-c j")
  :config
  (setq org-journal-file-type 'monthly
        org-journal-start-on-weekday 0
        org-extend-today-until 0 ;; the default
        org-journal-find-file #'find-file
        org-journal-dir (concat org-directory "/journal/")
        org-journal-date-format "%Y-%m-%d %a"
        org-journal-file-format "%Y-%m-journal.org")
  :bind
  ("C-c C-j" . org-journal-new-entry))

(defun my-old-carryover (old_carryover)
  (save-excursion
    (let ((matcher (cdr (org-make-tags-matcher org-journal-carryover-items))))
      (dolist (entry (reverse old_carryover))
        (save-restriction
          (narrow-to-region (car entry) (cadr entry))
          (goto-char (point-min))
          (org-scan-tags '(lambda ()
                            (org-set-tags ":carried:"))
                         matcher org--matcher-tags-todo-only))))))

;; (setq org-journal-handle-old-carryover 'my-old-carryover)

;; (defun org-journal-file-header-func (time)
;;   "Custom function to create journal header."
;;   (concat
;;     (pcase org-journal-file-type
;;       (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
;;       (`weekly "#+TITLE: Week of %Y-%m-%d\n#+STARTUP: folded")
;;       (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
;;       (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))

;; (setq org-journal-file-header 'org-journal-file-header-func)

(org-babel-do-load-languages
     'org-babel-load-languages
     '((dot . t)
       (python . t)
       (ditaa . t)))

(setq org-edit-src-content-indentation 0
      org-yank-folded-subtrees 0)

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
