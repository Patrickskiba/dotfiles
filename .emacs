;;; .emacs --- Patrick Skiba
;;; Commentary:
;; This file contains my Emacs configation
;;
;;; Code:
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(99 90))
(add-to-list 'default-frame-alist '(alpha 99 90))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

(setq enable-recursive-minibuffers t)

(require 'use-package)

(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(defun setup-tide-mode ()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :config
  (defvar company-tooltip-align-annotations)
  (setq company-tooltip-align-annotations t)

  (add-hook 'js-mode-hook #'setup-tide-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t)

(with-eval-after-load 'term (evil-collection-term-setup))



(use-package general
  :ensure t
  :config
  (general-auto-unbind-keys t))

(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-idle-delay 0.25))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(when (display-graphic-p)
      (load-theme 'doom-one t))

(use-package avy
  :ensure t)

(use-package ace-window
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package counsel
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))


(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode 1))

(use-package smex
  :ensure t)


(general-define-key
 :prefix "SPC"
 :states 'normal
 :keymaps '(global dired-mode-map emacs)
 "s" '(swiper :which-key "swiper")
 "a" '(counsel-M-x :which-key "funcs")
 "p" '(projectile-command-map :which-key "project")
 "f" '(counsel-find-file :which-key "find file")
 "j" '(avy-goto-char-timer :which-key "go to char")
 "l" '(avy-goto-line :which-key "jump to line")
 "b" '(switch-to-buffer :which-key "switch buffer")
 "B" '(list-buffers :which-key "list bufferes")
 "w" '(:ignore t :which-key "window")
 "wo" '(ace-window :which-key "other window")
 "ws" '(split-window-below :which-key "split window below")
 "wv" '(split-window-right :which-key "split window vertically")
 "w=" '(balance-windows :which-key "balance windows")
 "wd" '(ace-delete-window :which-key "delete window")
 "wD" '(ace-delete-other-windows :which-key "delete other windows")
 "t" '(:ignore t :which-key "text")
 "tz" '(hydra-zoom/body :which-key "zoom"))

(general-define-key
 :states 'insert
 :keymaps 'term-raw-map
 "C-w" '(backward-kill-word :which-key "delete backwards"))

(general-define-key
 :prefix "SPC"
 :states 'normal
 :keymaps 'js-mode-map
 "m" '(:ignore t :which-key "major mode")
 "mj" '(tide-jump-to-definition :which-key "jump to definition")
 "mh" '(tide-documentation-at-point :which-key "documentation at point")
 "mf" '(tide-references :which-key "references")
 "mr" '(tide-rename-symbol :which-key "rename symbol"))

(general-define-key
 :prefix "SPC"
 :states 'normal
 :keymaps 'org-mode-map
 "m" '(:ignore t :which-key "major mode")
 "mt" '(org-todo :which-key "Toggle Todo"))

(use-package prettier-js
  :ensure t
  :hook (js-mode . prettier-js-mode)
  :init
  (setq prettier-js-args '(
  "--trailing-comma" "none"
  "--bracket-spacing" "true"
  "--single-quote" "true"
  "--no-semi" "true"
  "--jsx-single-quote" "true"
  "--jsx-bracket-same-line" "true"
  "--print-width" "100")))

;;Hide UI cruft
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;Hide the splash screen
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

;;Emacs auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;SANE DEFAULTS
;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Allow pasting selection outside of Emacs
(setq select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(defvar global-auto-revert-non-file-buffers)
(setq global-auto-revert-non-file-buffers t)

(defvar auto-revert-verbose)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)


;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Don't highlight matches with jump-char - it's distracting
(defvar jump-char-lazy-highlight-face)
(setq jump-char-lazy-highlight-face nil)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(defvar recentf-max-saved-items)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 200000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(defvar org-replace-disputed-keys)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(defvar org-src-fontify-natively)
(setq org-src-fontify-natively t)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; 80 chars is a good width.
(set-default 'fill-column 80)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(defvar ediff-diff-options)
(setq ediff-diff-options "-w")

(defvar ediff-split-window-function)
(setq ediff-split-window-function 'split-window-horizontally)

(defvar ediff-window-setup-function)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "9c27124b3a653d43b3ffa088cd092c34f3f82296cf0d5d4f719c0c0817e1afa6" "ab9456aaeab81ba46a815c00930345ada223e1e7c7ab839659b382b52437b9ea" "1a6d627434899f6d21e35b85fee62079db55ef04ecd9b70b82e5d475406d9c69" default)))
 '(flycheck-javascript-standard-executable "/usr/bin/standardx")
 '(js-indent-level 2)
 '(js2-missing-semi-one-line-override nil)
 '(js2-strict-missing-semi-warning nil)
 '(org-agenda-files (quote ("~/Dropbox")))
 '(package-selected-packages
   (quote
    (pass company-mode doom-themes doom-modeline evil-magit magit evil-collection rainbow-delimiters tide flycheck smex evil counsel-projectile projectile which-key general prettier-js web-mode counsel ivy use-package gruvbox-theme ace-window)))
 '(projectile-git-command
   "comm -23 <(git ls-files -co --exclude-standard | sort) <(git ls-files -d | sort) | tr '\\n' '\\0'"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; .emacs ends here
