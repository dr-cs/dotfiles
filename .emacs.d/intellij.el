;; Helpful keybindings to make switching between IntelliJ and Emacs easier
;; Note: these are for macOS. I map Option to Super.

;; These settings map the IntelliJ Mac OSX 10.5+ keybindings to their
;; Emacs equivalents, where applicable, for the editor features on
;; this page:
;; https://www.jetbrains.com/help/idea/using-code-editor.html

;; From https://www.emacswiki.org/emacs/CancelingInEmacs
;; Map escape to cancel (like C-g)...
(define-key isearch-mode-map [escape] 'isearch-abort)   ;; isearch
(define-key isearch-mode-map "\e" 'isearch-abort)   ;; \e seems to work better for terminals
(global-set-key [escape] 'keyboard-escape-quit)   ;; everywhere else

;; Opening and saving files
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-O") 'find-file)

;; navigating file buffers (editor tabs in IntelliJ)
(global-set-key (kbd "M-w") 'kill-buffer)
(global-set-key (kbd "M-}") 'next-buffer)
(global-set-key (kbd "M-{") 'previous-buffer)
(global-set-key (kbd "<C-tab>") 'list-buffers)
(global-set-key (kbd "<M-e>") 'list-buffers)

;; CUA mode stuff -- I dont'use cua-mode because on macOS M- is used in place of C-
;; M-s is prefix for a few things I don't use, so I don't mind remapping it
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-z") 'undo)


;; After using ESC for keyboard-quit and M-x for cut, need this for
;; extended commands
(global-set-key (kbd "s-x") 'execute-extended-command)

;; Expand selection
(global-set-key (kbd "<s-up>") 'er/expand-region)
(global-set-key (kbd "<s-down>") 'er/contract-region)

;; Multiple cursors
(global-set-key (kbd "C-g") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-G") 'mc/mark-all-like-this)
(global-set-key (kbd "<s-s-down>") 'mc/mark-next-lines)

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
