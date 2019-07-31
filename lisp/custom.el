

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
 '(company-minimum-prefix-length 1)
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


;;输入 <s 再按TAB键





;;(require 'smex) ; Not needed if you use package.el
;;  (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;					; when Smex is auto-initialized on its first run.
;;(global-set-key (kbd "M-x") 'smex)

(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)

;; example of setting env var named “path”, by appending a new path to existing path
(setenv "PATH"
  (concat
   "C:\\Program Files\\nodejs\\" ";"
   "C:\\Program Files\\Git\\cmd\\" ";"
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

