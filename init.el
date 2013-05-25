;; set environments
(setenv "PATH" "/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin")
(setenv "PYTHONPATH" "/opt/local/bin/python") 
(setenv "PYMACS_PYTHON" "/opt/local/bin/python") ;;为pymacs指定有效的python

(add-to-list 'load-path
	     "~/.emacs.d/plugins")

;;show line number
(line-number-mode t) ;; 在状态栏显示行
(column-number-mode t) ;; 在状态栏显示列

;; color theme
(require 'color-theme)
(color-theme-robin-hood)

;; package manager
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; 加载yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")


;; python mode 设置
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist(cons '("python" . python-mode)
				  interpreter-mode-alist))
(setq py-python-command "/opt/local/bin/python")
(setq python-python-command "/opt/local/bin/python")
(autoload 'python-mode "python-mode" "python editing mode." t)
;; 加载,rope,pymacs,ropmacs

(eval-after-load "python-mode"
  '(progn
     (autoload 'pymacs-apply "pymacs")
     (autoload 'pymacs-call "pymacs")
     (autoload 'pymacs-eval "pymacs" nil t)
     (autoload 'pymacs-exec "pymacs" nil t)
     (autoload 'pymacs-load "pymacs" nil t)
     (require 'pycomplete)
     (message  "loading repomacs")
     (pymacs-load "ropemacs" "rope-")
     (setq ropemacs-enable-autoimport t)))

;; 用户自定义变量

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(py-pychecker-command "pychecker.sh")
 '(py-pychecker-command-args (quote ("")))
 '(python-check-command "pychecker.sh")
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;; 把备份文件保存在别的地方,而不是当前目录下

(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; auto fill
(setq default-fill-column 256)
(setq-default auto-fill-function 'do-auto-fill)

;; lisp config
(add-to-list 'load-path "~/.emacs.d/plugins/slime")
(setq inferior-lisp-program "/usr/local/bin/sbcl") 
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
(put 'upcase-region 'disabled nil)
;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'parenthesis) ; highlight just parens
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))


(autoload 'graphviz-dot-mode "graphviz-dot-mode.el" "graphviz mode" t)
(setq auto-mode-alist
      (cons '("\\.dot" . graphviz-dot-mode) auto-mode-alist))


