;; mu4e configuration

(when (string= system-type "darwin")
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e"))

(when (string= system-type "gnu/linux")
  (add-to-list 'load-path "/usr/share/emacs24/site-lisp/mu4e/"))

(require 'mu4e)

;; acount defaults
(setq mu4e-sent-folder "/gmail/Sent Messages"
      mu4e-drafts-folder "/gmail/Drafts"
      mu4e-trash-folder "/gmail/Trash"
      user-mail-address "chris.simpkins@gmail.com"
      mu4e-compose-signature (concat
                              "Chris Simpkins\n"
                              "Mobile: 404-663-4946\n")
      message-send-mail-function 'smtpmail-send-it
      smtpmail-auth-credentials '(("smtp.gmail.com"
                                   587
                                   "chris.simpkins@gmail.com"
                                   (shell-command-to-string
                                    "keyring get gmail.com chris.simpkins@gmail.com")))
      ;;starttls-use-gnutls t
      smtpmail-stream-type 'tls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-local-domain "gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; multiple acounts
(defvar my-mu4e-account-alist
  '(("gmail"
     (mu4e-sent-folder "/gmail/Sent Messages")
     (mu4e-drafts-folder "/gmail/Drafts")
     (mu4e-trash-folder "/gmail/Trash")
     (user-mail-address "chris.simpkins@gmail.com")
     (smtpmail-local-domain "gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-auth-credentials '(("smtp.gmail.com"
                                   587
                                   "chris.simpkins@gmail.com"
                                   (shell-command-to-string
                                    "keyring get gmail.com chris.simpkins@gmail.com"))))
     (mu4e-compose-signature (concat
                              "Chris Simpkins\n"
                              "Mobile: 404-663-4946\n")))
    ("drcs"
     (mu4e-sent-folder "/drcs/Sent Messages")
     (mu4e-drafts-folder "/drcs/Drafts")
     (mu4e-trash-folder "/drcs/Trash")
     (user-mail-address "chris.simpkins@gatech.edu")
     (smtpmail-local-domain "gatech.edu")
     (smtpmail-smtp-server "sccl.cc.gatech.edu")
     (smtpmail-auth-credentials '(("sccl.cc.gatech.edu"
                                   465
                                   "cs257"
                                   (shell-command-to-string
                                    "keyring get gatech.edu cs257"))))
     (mu4e-compose-signature (concat
                              "Chris Simpkins, Lecturer\n"
                              "College of Computing, Room 133\n"
                              "GT Scuba Instructor, PADI # 347984\n"
                              "Georgia Institute of Technology\n"
                              "Mobile: 404-663-4946\n"
                              "http://www.cc.gatech.edu/~simpkins/\n")))
    ("o365"
     (mu4e-sent-folder "/o365/Sent Messages")
     (mu4e-drafts-folder "/o365/Drafts")
     (mu4e-trash-folder "/o365/Trash")
     (user-mail-address "simpkins@cc.gatech.edu")
     (smtpmail-local-domain "office365.com")
     (smtpmail-smtp-server "smtp.office365.com")
     (smtpmail-auth-credentials '(("smtp.office365.com"
                                   587
                                   "cs257@gatech.edu"
                                   (shell-command-to-string
                                    "keyring get gatech.edu cs257"))))
     (mu4e-compose-signature (concat
                              "Chris Simpkins, Lecturer\n"
                              "College of Computing, Room 133\n"
                              "GT Scuba Instructor, PADI # 347984\n"
                              "Georgia Institute of Technology\n"
                              "Mobile: 404-663-4946\n"
                              "http://www.cc.gatech.edu/~simpkins/\n")))
    ("prost"
     (mu4e-sent-folder "/prost/Sent Messages")
     (mu4e-drafts-folder "/prost/Drafts")
     (mu4e-trash-folder "/prost/Trash")
     (user-mail-address "chris@proscuba.training")
     (smtpmail-local-domain "dreamhost.com")
     (smtpmail-smtp-server "sub4.mail.dreamhost.com")
     (smtpmail-auth-credentials '(("sub4.mail.dreamhost.com"
                                   587
                                   "chris@proscuba.training"
                                   (shell-command-to-string
                                    "keyring get proscuba.training chris@proscuba.training"))))
     (mu4e-compose-signature (concat
                              "Chris Simpkins"
                              "PADI Master Scuba Diver Trainer 347984"
                              "SSI Divemaster Instructor 72876"
                              "DAN DEMP, DFA Pro Instructor 15550"
                              "Tel. 678-827-FINS (3467)"
                              "http://proscuba.training/\n")))
    ("chris@simpkins.org"
     (mu4e-sent-folder "/chris@simpkins.org/Sent Messages")
     (mu4e-drafts-folder "/chris@simpkins.org/Drafts")
     (mu4e-trash-folder "/chris@simpkins.org/Trash")
     (user-mail-address "chris@simpkins.org")
     (smtpmail-local-domain "dreamhost.com")
     (smtpmail-smtp-server "sub4.mail.dreamhost.com")
     (smtpmail-auth-credentials '(("sub4.mail.dreamhost.com"
                                   587
                                   "management@2061kinridgetrail.com"
                                   (shell-command-to-string
                                    "keyring get 2061kinridgetrail.com management@2061kinridgetrail.com"))))
     (mu4e-compose-signature (concat
                              "Chris Simpkins\n"
                              "chris@simpkins.org\n")))
    ("management@2061kinridgetrail.com"
     (mu4e-sent-folder "/management@2061kinridgetrail.com/Sent Messages")
     (mu4e-drafts-folder "/management@2061kinridgetrail.com/Drafts")
     (mu4e-trash-folder "/management@2061kinridgetrail.com/Trash")
     (user-mail-address "management@2061kinridgetrail.com")
     (smtpmail-local-domain "dreamhost.com")
     (smtpmail-smtp-server "sub4.mail.dreamhost.com")
     (mu4e-compose-signature (concat
                              "Chris Simpkins\n"
                              "Management@2061KinridgeTrail.com\n")))))

;; (See the documentation for `mu4e-sent-messages-behavior' if you have
;; additional non-Gmail addresses and want assign them different
;; behavior.)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
      '( ("/gmail/Inbox"                            . ?g)
         ("/drcs/Inbox"                             . ?d)
         ("/o365/Inbox"                             . ?o)
         ("/chris@simpkins.org/Inbox"               . ?s)
         ("/chris@proscuba.training/Inbox"          . ?p)
         ("/management@2061kinridgetrail.com/Inbox" . ?k)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Getting mail/syncing Maildir

(setq mu4e-get-mail-command "mbsync -a"
      mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout"
      ;mu4e-update-interval 120
      ;mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Headers view

(setq mu4e-headers-fields
    '( (:human-date     .  10)    ;; alternatively, use :human-date
       (:flags          .   6)
       (:from           .  22)
       (:thread-subject .  nil))) ;; alternatively, use :subject

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Viewing Messages

;; render html as html
(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)

;; don't save messages to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)

;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/Downloads/mu4e-attachments")

;; show images
(setq mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Composing

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (auto-fill-mode -1)
           (flyspell-mode)))


(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(defun my-choose-smtp-account ()
  (if (message-mail-p)
      (save-excursion
        (let*
            ((from (save-restriction
                   (message-narrow-to-headers)
                   (message-fetch-field "from")))
             (account
              (cond
               ((string-match "chris.simpkins@gmail.com" from)
                "gmail")
               ((string-match "chris.simpkins@gatech.edu" from)
                "drcs")
               ((string-match "chris@proscuba.training" from)
                "prost")
               ((string-match "chris@simpkins.org" from)
                "chris@simpkins.org")
               ((string-match "management@2061kinridgetrail.com" from)
                "management@2061kinridgetrail.com"))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(add-hook 'mu4e-compose-pre-hook 'my-choose-smtp-account)
