(add-to-list 'load-path "~/.emacs.d/lisp/")
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )


(require  'init-packages)
(require  'initUI)
(require  'init-better-defaults)
(require  'init-orgmode)
(require  'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
;; 7/31/2019
