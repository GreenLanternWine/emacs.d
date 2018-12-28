;; 取消菜单栏上的按钮
(tool-bar-mode -1)
;; 取消滚动条
(scroll-bar-mode -1)
;; 开启行号显示
(global-linum-mode t)
;; 取消emacs的启动画面
(setq inhibit-splash-screen t)
;; 设置默认的光标的样式
(setq-default cursor-type 'bar)
;; 启动自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 高亮显示光标所在行
(global-hl-line-mode 1)

(provide 'init-ui)
