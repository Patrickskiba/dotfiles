(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

(general-auto-unbind-keys t)

(setq enable-recursive-minibuffers t)

(require 'use-package)

(use-package evil
  :ensure t)

(evil-mode 1)

(global-set-key (kbd "C-u") 'evil-scroll-up)

(use-package general
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-idle-delay 0.25))

(use-package gruvbox-theme
  :ensure t)

(load-theme 'gruvbox-dark-soft t)

(use-package avy
  :ensure t)

(use-package ace-window
  :ensure t)

(use-package projectile
  :ensure t)

(projectile-mode +1)

(use-package counsel
  :ensure t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(use-package counsel-projectile
  :ensure t)

(counsel-projectile-mode 1)

(use-package smex
  :ensure t)

(general-define-key
 :prefix "SPC"
 :states 'normal
 :keymaps 'global
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

(use-package lsp-mode
  :hook (rjsx-mode . lsp)
  :commands lsp)

(setq lsp-enable-snippet nil)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

(use-package rjsx-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("/.*\\.js\\'" . rjsx-mode))

(use-package prettier-js
  :ensure t)

(add-hook 'js-mode-hook 'prettier-js-mode)

(setq prettier-js-args '(
  "--trailing-comma" "all"
  "--bracket-spacing" "true"
  "--single-quote" "true"
  "--no-semi" "true"
  "--jsx-single-quote" "true"
  "--no-bracket-spacing" "false"
))


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
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
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
(setq jump-char-lazy-highlight-face nil)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
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
(setq gc-cons-threshold 20000000)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; 80 chars is a good width.
(set-default 'fill-column 80)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(js2-missing-semi-one-line-override nil)
 '(js2-strict-missing-semi-warning nil)
 '(lsp-ui-doc-alignment (quote window))
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-sideline-enable nil)
 '(org-agenda-files (quote ("~/Dropbox")))
 '(package-selected-packages
   (quote
    (smex evil xah-fly-keys counsel-projectile projectile change-inner which-key whick-key use-key general hydra prettier-js rjsx-mode web-mode yasnippet lsp-ui lsp-javascript-typescript spinner lsp-mode counsel ivy use-package gruvbox-theme ace-window)))
 '(projectile-git-command
   "comm -23 <(git ls-files -co --exclude-standard | sort) <(git ls-files -d | sort) | tr '\\n' '\\0'"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
