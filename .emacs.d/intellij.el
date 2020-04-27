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
  (yank)
)

system-type

(cond ((boundp 'aquamacs-version)
       (progn
         ;; In Aquamacs, A- is Mac Command key, M- is Mac Option key
         (global-set-key (kbd "A-d") 'duplicate-line)

         (global-set-key (kbd "A-e") 'list-buffers)
         (global-set-key (kbd "A-z") 'undo)
                                        ;(global-set-key (kbd "M-s-up") 'transpose-lines)
         (global-set-key (kbd "C-J") 'join-line)
         (global-set-key (kbd "A-g") 'goto-line)

         ;; Expand selection
         (global-set-key (kbd "<A-up>") 'er/expand-region)
         (global-set-key (kbd "<A-down>") 'er/contract-region)

         ;; Multiple cursors
         (global-set-key (kbd "<M-M-down>") 'mc/mark-next-lines)))

      ((system-type "darwin")
       (progn
         (setq mac-option-key-is-meta t)
         (setq mac-command-key-is-meta nil)
         (setq mac-command-modifier 'super)
         (setq mac-option-modifier 'meta)

         (global-set-key (kbd "S-d") 'duplicate-line)

         (global-set-key (kbd "S-s") 'save-buffer)
         (global-set-key (kbd "S-x") 'cua-copy-region)
         (global-set-key (kbd "S-c") 'cua-cut-region)
         (global-set-key (kbd "S-v") 'cua-paste)

         (global-set-key (kbd "<S-e>") 'list-buffers)
         (global-set-key (kbd "S-z") 'undo)
                                        ;(global-set-key (kbd "<S-s-up>") 'transpose-lines)
         (global-set-key (kbd "C-J") 'join-line)
         (global-set-key (kbd "S-g") 'goto-line)

         ;; Other stuff
         (global-set-key (kbd "S-f") 'isearch-forward)
         (global-set-key (kbd "S-f") 'isearch-forward)


         ;; Expand selection
         (global-set-key (kbd "<S-up>") 'er/expand-region)
         (global-set-key (kbd "<S-down>") 'er/contract-region)

         ;; Multiple cursors
         (global-set-key (kbd "<M-M-down>") 'mc/mark-next-lines)
         )))
