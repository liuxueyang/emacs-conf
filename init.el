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

;; (when (or (string-equal system-type "darwin")
;; 	  (string-equal system-type "gnu/linux"))
;;   (let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
;;     (setenv "PATH" path)
;;     (setq exec-path
;; 	  (append
;; 	   (split-string-and-unquote path ":")
;; 	   exec-path))
;;     ;; used by pyvenv plugin
;;     (setenv "WORKON_HOME"
;; 	    (shell-command-to-string ". ~/.zshrc; echo -n $WORKON_HOME"))
;;     (setenv
;;      "VIRTUALENVWRAPPER_PYTHON"
;;      (shell-command-to-string ". ~/.zshrc; echo -n $VIRTUALENVWRAPPER_PYTHON"))
;;     ;; used by elpy
;;     (setenv
;;      "PATH_TO_PYTHON"
;;      (shell-command-to-string ". ~/.zshrc; echo -n $PATH_TO_PYTHON"))))

;; (load-theme 'tsdh-dark t)
(use-package solarized-theme
  :ensure t)
(load-theme 'solarized-light t)
;; (menu-bar-mode -1)
(menu-bar-mode 1)
(tool-bar-mode -1)
(column-number-mode 1)
(scroll-bar-mode -1)
(global-linum-mode 1)

(display-time-mode 1)
(setq-default display-time-day-and-date t)

(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(add-hook 'org-mode-hook 'auto-fill-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-save t t)
 '(TeX-master nil t)
 '(TeX-parse-self t t)
 '(aw-keys (quote (97 115 100 102 103 104 106 107 108)))
 '(elpy-rpc-backend "rope" t)
 '(package-selected-packages
   (quote
    (markdown-mode tuareg utop merlin counsel yaml-mode swiper-helm helm-ag sphinx-doc yanippet yasnippet-snippets py-yapf elpy rust-playground rust-mode diff-hl hl-sexp solarized-theme rainbow-blocks rainbow-delimiters lispy helm magit ace-jump-mode use-package)))
 '(reftex-plug-into-AUCTeX t t)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-blocks-depth-1-face ((t (:foreground "red"))))
 '(rainbow-blocks-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-blocks-depth-3-face ((t (:foreground "SkyBlue1"))))
 '(rainbow-blocks-depth-4-face ((t (:foreground "green"))))
 '(rainbow-blocks-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-blocks-depth-6-face ((t (:foreground "deep sky blue"))))
 '(rainbow-blocks-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-blocks-depth-8-face ((t (:foreground "green yellow"))))
 '(rainbow-blocks-depth-9-face ((t (:foreground "DarkOrange2"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "SkyBlue1"))))
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

;; --------------------------------------------------
;; Maybe there is some bug in helm for Emacs 24.5? So
;; I switch to swiper

;; (use-package helm
;;   :ensure t
;;   :bind
;;   (("M-x" . helm-M-x)
;;    ("M-<f5>" . helm-find-files)
;;    ([f10] . helm-buffers-list)
;;    ([S-f10] . helm-recentf)
;;    ("C-x r b" . helm-filtered-bookmarks)
;;    ;; ("C-x C-f" . helm-find-files)
;;    ("M-s o" . helm-occur)
;;    ("C-x C-b" . helm-buffers-list)
;;    ("M-/" . helm-dabbrev))
;;   :config
;;   (helm-mode 1))

;; --------------------------------------------------

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-selectable-prompt t)
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :bind
  (("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-c k" . counsel-ag)))

(use-package swiper
  :ensure t
  :bind
  (("C-s" . swiper)))

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

;; --------------------------------------------------
;; rust
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'")

(use-package rust-playground
  :ensure t)
;; --------------------------------------------------

;; --------------------------------------------------
;; python
(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  :custom
  (;; (elpy-rpc-python-command (getenv ""))
   (elpy-rpc-backend "rope")))

(use-package py-yapf
  :ensure t
  :hook
  (python-mode . py-yapf-enable-on-save))

(use-package sphinx-doc
  :ensure t
  :hook
  (python-mode . sphinx-doc-mode))
;; --------------------------------------------------

(use-package yasnippet-snippets
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(use-package auctex
  :ensure t
  :no-require t
  :custom
  ((TeX-auto-save t)
   (TeX-parse-self t)
   (TeX-master nil)
   (reftex-plug-into-AUCTeX t))
  :hook
  ((LaTeX-mode . auto-fill-mode)
   (LaTeX-mode . flyspell-mode)
   (LaTeX-mode . LaTeX-math-mode)
   (LaTeX-mode . turn-on-reftex)))

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)))

(use-package helm-ag
  :ensure t)

(use-package swiper-helm
  :ensure t
  :bind
  (("C-s" . swiper-helm)))

(use-package yaml-mode
  :ensure t
  :mode "\\.yaml\\'"
  :bind
  ("C-m" . newline-and-indent))

;; --------------------------------------------------
;; OCaml
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line

(let ((opam-user-setup-path "~/.emacs.d/opam-user-setup.el"))
  (when (file-exists-p opam-user-setup-path)
    (require 'opam-user-setup opam-user-setup-path)))

;; ## end of OPAM user-setup addition for emacs / base ## keep this line
;; --------------------------------------------------

;; --------------------------------------------------
;; Markdown
;; "https://jblevins.org/projects/markdown-mode/"
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
;; --------------------------------------------------

;; --------------------------------------------------
;; C
(add-hook 'c-mode-hook (lambda () (c-set-style "linux")))
;; --------------------------------------------------
