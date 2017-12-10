;; -*-coding: utf-8-*-

;; d-pe: describe-personal-keybindings
;; ev-b: eval-buffer
;; l-pac: list-packages

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
;; TODO: install use-package automatically if necessary

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; different configuration for different platform

(cond ((string-equal system-type "darwin")
       (setq-default font-name "Monaco-20"
		     frame-width 110
		     width-height 120))
      ((string-equal system-type "gnu/linux")
       (setq-default font-name "Source Code Pro-15"
		     frame-width 110
		     width-height 30))
      (t
       (message "I am on Windows")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'default-frame-alist
	     `(font . ,font-name))

(setq-default initial-frame-alist
	      `((top . 1) (left . 1) (width . ,frame-width) (height . ,width-height))
	      fill-column 80)

;; (load-theme 'tsdh-dark t)
(use-package solarized-theme
  :ensure t)
(load-theme 'solarized-dark t)
;; (menu-bar-mode -1)
(menu-bar-mode 1)
(tool-bar-mode -1)

(add-hook 'text-mode-hook 'auto-fill-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (diff-hl hl-sexp solarized-theme rainbow-blocks rainbow-delimiters lispy helm magit ace-jump-mode use-package)))
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-blocks-depth-1-face ((t (:foreground "red"))))
 '(rainbow-blocks-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-blocks-depth-3-face ((t (:foreground "blue"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "green"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-blocks-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-blocks-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face :background "green"))))
 '(rainbow-delimiters-unmatched-face ((t (:background "yellow")))))

(use-package ace-jump-mode
  :ensure t
  :bind
  (("C-. c" . ace-jump-mode)
   ("C-. l" . ace-jump-line-mode)
   ("C-. w" . ace-jump-word-mode))
  :config
  (setq-default ace-jump-word-mode-use-query-char nil))

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)))

(use-package helm
  :ensure t
  :bind
  (("M-x" . helm-M-x)
   ("M-<f5>" . helm-find-files)
   ([f10] . helm-buffers-list)
   ([S-f10] . helm-recentf)))

(use-package lispy
  :ensure t
  :hook
  ((emacs-lisp-mode lisp-mode) . lispy-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook ((lisp-mode emacs-lisp-mode) . rainbow-delimiters-mode))

(use-package rainbow-blocks
  :ensure t
  :hook ((lisp-mode emacs-lisp-mode) . rainbow-blocks-mode))

(use-package hl-sexp
  :ensure t
  :hook ((lisp-mode emacs-lisp-mode) . hl-sexp-mode))

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . turn-on-diff-hl-mode)
	 (dired-mode . diff-hl-dired-mode))
  :init
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))

(use-package ace-window
  :ensure t
  :bind
  (("M-p" . ace-window))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package rust-playground)
