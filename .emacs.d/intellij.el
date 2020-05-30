;; Helpful keybindings to make switching between IntelliJ and Emacs easier
;; Note: these are for macOS

;; These settings map the IntelliJ Mac OSX 10.5+ keybindings to their
;; Emacs equivalents, where applicable, for the editor features on
;; this page:
;; https://www.jetbrains.com/help/idea/using-code-editor.html


;; To mimic IntelliJ's duplicate-line, which is M-d on macOS
;; Based on "Nate"'s answer to
;; https://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;; Emacs's built-in join-line joins the current line to the line
;; above.  This join-line works like IntelliJ's, joining the current
;; line to the line below
(defun join-line-below()
  (interactive)
  (next-line 1)
  (delete-indentation))

;; TODO: I don't use Aquamacs, so I should probably remove this.
(cond ((boundp 'aquamacs-version)
       (progn
         ;; In Aquamacs, A- is Mac Command key, M- is Mac Option key
         (global-set-key (kbd "A-d") 'duplicate-line)

         (global-set-key (kbd "A-e") 'list-buffers)
         (global-set-key (kbd "A-z") 'undo)
         (global-set-key (kbd "S-A-up") 'transpose-lines)
         (global-set-key (kbd "C-J") 'join-line-below)))

      ((string-equal system-type "darwin")
       (progn
         (setq mac-option-key-is-meta t)
         (setq mac-command-key-is-meta nil)
         (setq mac-command-modifier 'super)
         (setq mac-option-modifier 'meta)

         (global-set-key (kbd "s-d") 'duplicate-line)

         (global-set-key (kbd "s-s") 'save-buffer)
         (global-set-key (kbd "s-c") 'kill-ring-save)
         (global-set-key (kbd "s-x") 'kill-region)
         (global-set-key (kbd "s-v") 'yank)

         (global-set-key (kbd "<s-e>") 'list-buffers)
         (global-set-key (kbd "s-z") 'undo)
         (global-set-key (kbd "<S-s-up>") 'transpose-lines)
         (global-set-key (kbd "C-J") 'join-line-below))))
