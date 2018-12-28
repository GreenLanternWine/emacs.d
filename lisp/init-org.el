(require 'org)

(setq org-src-fontify-natively t)

;; 设置org-agenda的默认文件夹位置
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
