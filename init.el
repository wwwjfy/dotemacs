;;; Basic configuration
(global-hl-line-mode 1)
(setq inhibit-startup-message 1)
(setq scroll-step 1)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)
(setq visible-bell t)
(global-font-lock-mode 1)
(menu-bar-mode -1)
(column-number-mode 1)
(setq-default fill-column 79)
(setq auto-fill-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq sentence-end-double-space nil)
(setq-default indicate-empty-lines t)
(setq blink-matching-paren-distance nil)
(setq show-paren-style 'expression)
(setq vc-follow-symlinks t)
(setq confirm-nonexistent-file-or-buffer nil)

(add-to-list 'load-path "~/.emacs.d/init")

;;; third-party package
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(load-theme 'solarized-dark t)
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
      backup-directory-alist `((".*" . ,(concat user-emacs-directory "backups/")))
      auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "backups/") t)))

(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-x\C-b" 'ibuffer)

(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

(global-set-key "\C-xw" 'visual-line-mode)

(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")

(defun join-next-line ()
  (interactive)
  (next-line)
  (join-line))
(global-set-key "\C-j" 'join-next-line)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(visual-line-mode)

(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)

;; org-mode
;(require 'org)
;(define-key global-map "\C-cl" 'org-store-link)
;(define-key global-map "\C-ca" 'org-agenda)
;(setq org-log-done t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun beginning-of-line-or-first-char ()
  (interactive)
  (let ((oldcol (current-column)))
    (back-to-indentation)
    (if (= oldcol (current-column))
        (beginning-of-line))))
(global-set-key "\C-a" 'beginning-of-line-or-first-char)

(load "init-smartparens")

(require 'fic-mode)
(turn-on-fic-mode)

(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style '(face spaces tabs trailing))

(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'helm-config)
(helm-mode 1)

(global-undo-tree-mode)

(global-set-key "\C-x\C-\\" 'goto-last-change)

(setq nlinum-format "%d ")
(global-nlinum-mode)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)

(custom-set-faces
 '(whitespace-trailing ((t (:background "#cd0000")))))
