(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
;;		smex
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
;; (when (memq window-system '(mac ns))
;; (exec-path-from-shell-initialize))

(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(electric-indent-mode 1)
(global-linum-mode t)
(setq inhibit-splash-screen t)
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(global-set-key (kbd "<f2>") 'open-my-init-file)

;;(require 'package)
;;(package-initialize)
;;(add-to-list 'package-archives'
;; ("melpa" . "http://melpa.milkbox.net/packages/")
;; t)
;;(add-to-list 'package-archives'
;; ("melpa1" . "https://melpa.org/packages/")
;; t)

(setq inhibit-compacting-font-caches t); Don’t compact font caches during GC.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 ;;'(package-selected-packages (quote (company)))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-company-mode t)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)

;;输入 <s 再按TAB键
(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(delete-selection-mode t)
;;
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode t)
(load-theme 'monokai t)
(global-hungry-delete-mode)

;;(require 'smex) ; Not needed if you use package.el
;;  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;					; when Smex is auto-initialized on its first run.
;;(global-set-key (kbd "M-x") 'smex)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(add-hook 'org-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;; example of setting env var named “path”, by appending a new path to existing path
(setenv "env"
  (concat
   "C:\\Program Files\\nodejs\\" ";"
   (getenv "PATH")
   )
  )

(defun locate-current-file-in-explorer ()
  (interactive)
  (cond
   ;; In buffers with file name
   ((buffer-file-name)
    (shell-command (concat "start explorer /e,/select,\"" (replace-regexp-in-string "/" "\\\\" (buffer-file-name)) "\"")))
   ;; In dired mode
   ((eq major-mode 'dired-mode)
    (shell-command (concat "start explorer /e,\"" (replace-regexp-in-string "/" "\\\\" (dired-current-directory)) "\"")))
   ;; In eshell mode
   ((eq major-mode 'eshell-mode)
    (shell-command (concat "start explorer /e,\"" (replace-regexp-in-string "/" "\\\\" (eshell/pwd)) "\"")))
   ;; Use default-directory as last resource
   (t
    (shell-command (concat "start explorer /e,\"" (replace-regexp-in-string "/" "\\\\" default-directory) "\"")))))
(global-set-key (kbd "C-x C-a") 'locate-current-file-in-explorer)
