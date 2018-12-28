;; 取消提示音
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8glw" "GreenLanternWine")
					    ))

;; 取消备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode 1)

(provide 'init-better-defaults)
