;; -*-coding: utf-8-*-

;; d-pe: describe-personal-keybindings
;; ev-b: eval-buffer

;; package-archives
(setq-default package-archives
	      '(("melpa" . "http://elpa.emacs-china.org/melpa/")
		("gnu" . "http://elpa.emacs-china.org/gnu/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; It is not necessary to adjust ‘load-path’ or ‘require’ the
;; individual packages after calling ‘package-initialize’ -- this is
;; taken care of by ‘package-initialize’.

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; different configuration for different platform

(cond ((string-equal system-type "darwin")
       (setq-default font-name "Monaco-20"
		     frame-width 110
		     width-height 120))
      ((string-equal system-type "gnu/linux")
       (message "I am on Linux"))
      (t
       (message "I am on Windows")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'default-frame-alist
	     `(font . ,font-name))

(setq-default initial-frame-alist
	      `((top . 1) (left . 1) (width . ,frame-width) (height . ,width-height))
	      fill-column 80)

(load-theme 'tsdh-dark t)

(add-hook 'text-mode-hook 'auto-fill-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (lispy helm magit ace-jump-mode use-package)))
 '(use-package-always-ensure t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package ace-jump-mode
  :bind
  (("C-. c" . ace-jump-mode)
   ("C-. l" . ace-jump-line-mode)
   ("C-. w" . ace-jump-word-mode))
  :config
  (setq-default ace-jump-word-mode-use-query-char nil))

(use-package magit)
(use-package helm)
(use-package lispy)
