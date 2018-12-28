;; cl - Common Lisp Extension
(require 'cl)


(when (>= emacs-major-version 24)
    (require 'package)

    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像


;; Add Packages
(defvar GreenLanternWine/packages '(
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
	       popwin
               ) "Default packages")

(setq package-selected-packages GreenLanternWine/packages)

(defun GreenLanternWine/packages-installed-p ()
    (loop for pkg in GreenLanternWine/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t))) 

(unless (GreenLanternWine/packages-installed-p)
    (message "%s" "Refreshing package daqtabase...")
    (package-refresh-contents)
    (dolist (pkg GreenLanternWine/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 用来自动补全括号用的配置 smartparens插件
(smartparens-global-mode t)

(global-hungry-delete-mode)

;; config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 全局开启company模式
(global-company-mode t)

;; 应用主题的地方
(load-theme 'monokai 1)


(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
