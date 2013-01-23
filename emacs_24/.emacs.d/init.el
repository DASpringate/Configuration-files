(setq visible-bell t)
; Packages
(add-to-list 'load-path "~/.emacs.d")

(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))
(require 'tree-mode)
(require 'windata)
(require 'dirtree)
;; You can use desktop to save window configuration between different
;; session:
(require 'desktop)
(add-to-list 'desktop-globals-to-save 'windata-named-winconf)
(autoload 'dirtree "dirtree" "Add directory to tree view")
(require 'nrepl)
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*") 

(defvar my-packages '(clojure-mode
		      nrepl
		      expand-region
		      magit
		      markdown-mode
		      php-mode
		      slime
		      yasnippet
		      paredit))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Add top level emacs.d directory to load path

; Fonts
;;(set-default-font "xft:Bitstream Vera Sans Mono-8")
;;(set-face-attribute 'default nil :font "Droid Sans Mono-10")

; ido
;(require 'ido)
;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;(ido-mode 1)

; No backup files
(setq make-backup-files nil)

; Key customizations
; (global-set-key [(control delete)] 'ibuffer)
(global-set-key [C-delete] 'ibuffer)
(global-set-key [C-kp-delete] 'ibuffer)
(global-set-key [f1] 'magit-status)
(global-set-key [f2] 'term)
(global-set-key [f8] 'undo)

; Save the buffers
(desktop-save-mode t)

;; scroll one line at a time (less "jumpy" than defaults)
    
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    
    (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
    (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
    (setq scroll-step 1) ;; keyboard scroll one line at a time

(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))


(load-theme 'tsdh-dark t)


(cua-mode 1)

; Org mode
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)

; Shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq shell-file-name "bash")

; Markdown mode
(setq auto-mode-alist
  (cons '("\\.markdown" . markdown-mode) auto-mode-alist))


; SCSS
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

; Clojure mode
(require 'clojure-mode)

; Expand region mode
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

; Paredit
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook    'enable-paredit-mode)
(show-paren-mode 1)
(setq show-paren-delay 0)
; Emacs server
(server-start)

(tool-bar-mode -1)

; custom variables DO NOT EDIT
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
