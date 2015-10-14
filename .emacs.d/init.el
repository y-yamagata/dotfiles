;; encoding
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; basic settings
(setq inhibit-startup-message t)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; highlight
(transient-mark-mode t)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)
(setq-default show-trailing-whitespace t)

;; history
(setq history-length 10000)
(savehist-mode t)
(setq recentf-max-saved-items 10000)

;; for windows emacs
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; keybinding
(keyboard-translate ?\C-h ?\C-?)
(keyboard-translate ?\C-w ?\M-\d)

;; load path settings
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

(defun add-to-load-path(&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
          (expand-file-name (concat user-emacs-directory path))))
    (add-to-list 'load-path default-directory)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
        (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf")
