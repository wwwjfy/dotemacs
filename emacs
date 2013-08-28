(global-hl-line-mode 1)
(setq inhibit-startup-message 1)
(setq scroll-step 1)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)
(setq visible-bell t)
(global-font-lock-mode 1)
(menu-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(setq-default fill-column 80)
(setq auto-fill-mode 1)
(add-hook 'c-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq sentence-end-double-space nil)
(setq-default indicate-empty-lines t)
(global-linum-mode 1)
(setq blink-matching-paren-distance nil)
(setq show-paren-style 'expression)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(load-theme 'solarized-dark 1)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(ido-mode t)
(setq ido-enable-flex-matching t)

(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
        (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region-or-line)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq apropos-do-all t
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `((".*" . ,(concat user-emacs-directory "backups"))))

;; (global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-x\C-b" 'ibuffer)

(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

(require 'auto-complete-config)
(ac-config-default)

(global-set-key (kbd "RET") 'newline-and-indent)

(require 'autopair)
(autopair-global-mode)
;; (load-file "~/tmp/emacs/emacs-for-python/epy-init.el")
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(add-to-list 'load-path "~/Develop/emacs-fish")
(require 'fish-mode)

(visual-line-mode)

(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)
