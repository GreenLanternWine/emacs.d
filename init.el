
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

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
               swiper
               counsel
               smartparens
               ;; --- Major Mode --q-
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
    (message "%s" "Refreshing package daqtabase...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 用来自动补全括号用的配置 smartparens插件
(require 'smartparens-config)
(smartparens-global-mode t)

;; config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 取消菜单栏上的按钮
(tool-bar-mode -1)
;; 取消滚动条
(scroll-bar-mode -1)
;; 开启行号显示
(linum-mode 1)
;; 取消emacs的启动画面
(setq inhibit-splash-screen t)
;; 设置f2快捷键打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 全局开启company模式
(global-company-mode t)

;; 设置默认的光标的样式
(setq-default cursor-type 'bar)

;; 取消备份文件
(setq make-backup-files nil)

;; 设置打开最近打开文件的快捷键，以及设定保存记录的条数
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(delete-selection-mode 1)

;; 启动自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 高亮显示光标所在行
(global-hl-line-mode 1)
;; 应用主题的地方
(load-theme 'monokai 1)

;; 设置全局快捷键 查看方法、变量、以及快捷键
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 设置org-agenda的默认文件夹位置
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 用customize-group设定插件参数的一些自定义配置会自动添加到下面
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "#b7b7b7")))))
