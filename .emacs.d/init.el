;; encoding
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; back space key is <C-h>
(global-set-key "\C-h" 'delete-backward-char)

(transient-mark-mode 1)

;; parentheses highlight
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

(setq-default show-trailing-whitespace t)
 
(custom-set-variables '(global-linum-mode t))
 
(setq kill-whole-line t)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
 
(setq make-backup-files nil)
(setq auto-save-default nil)
 
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(icomplete-mode 1)
 
(setq history-length 10000)
(savehist-mode 1)
(setq recentf-max-saved-items 10000)