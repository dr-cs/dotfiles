;; Helpful keybindings to make switching between IntelliJ and Emacs easier
;; Note: these are for macOS

;; These settings map the IntelliJ Mac OSX 10.5+ keybindings to their
;; Emacs equivalents, where applicable, for the editor features on
;; this page:
;; https://www.jetbrains.com/help/idea/using-code-editor.html


(global-set-key (kbd "<M-e>") 'list-buffers)


(global-set-key (kbd "M-z") 'undo)

;; Expand selection
(global-set-key (kbd "<s-up>") 'er/expand-region)
(global-set-key (kbd "<s-down>") 'er/contract-region)

;; Multiple cursors
(global-set-key (kbd "C-g") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-G") 'mc/mark-all-like-this)
(global-set-key (kbd "<M-M-down>") 'mc/mark-next-lines)

(global-set-key (kbd "<S-s-up>") 'transpose-lines)

(global-set-key (kbd "C-J") 'join-line)
(global-set-key (kbd "M-g") 'goto-line)

;; Other stuff
(global-set-key (kbd "M-f") 'isearch-forward)
(global-set-key (kbd "M-f") 'isearch-forward)

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
(global-set-key (kbd "M-d") 'duplicate-line)
