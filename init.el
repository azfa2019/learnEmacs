(package-initialize)
(require 'cl)

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "initorg.org" user-emacs-directory))
;;(org-babel-load-file "initorg.org")

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
;; git clone https://github.com/azfa2019/learnEmacs.git
;; move the .emacs.d folder up
;; make changes, then git add ., git commit -m 'notes'
;; git push origin master, done
