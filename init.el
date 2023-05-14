
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company helm projectile yasnippet sweet-theme avy ## lsp-java lsp-ui pyenv-mode doom-themes ace-window bind-key ein eink-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 ;;; Settings without corresponding packages

(use-package emacs
  :preface
  (defvar jack/indent-width 4)
  (defun jack/maybe-set-default-browser ()
    "When in WSL Emacs, open links in default Windows 11 browser."
    (cond
     ((eq system-type 'gnu/linux)
      (when (string-match "Linux.*microsoft.*Linux"
                          (shell-command-to-string "uname -a"))
        (setq browse-url-generic-program "/mnt/c/Windows/System32/cmd.exe"
              browse-url-generic-args '("/c" "start" "")
              browse-url-browser-function 'browse-url-generic)))))
  (defun jack/edit-config ()
    "Open Emacs settings."
    (interactive)
    (find-file (concat user-emacs-directory "init.el")))
  (defun jack/split-and-follow-horizontally ()
    "Split window below."
    (interactive)
    (split-window-below)
    (other-window 1))
  (defun jack/split-and-follow-vertically ()
    "Split window right."
    (interactive)
    (split-window-right)
    (other-window 1))
  :config
  (setq user-full-name "Jack A.")
  (setq frame-title-format '("Emacs " emacs-version))
  (setq python-python-command "C:/Users/jack.amy/anaconda3/python.exe")
  (setq-default default-directory "~/")
  (setq frame-resize-pixelwise t)
  (setq hscroll-margin 0)
  (setq load-prefer-newer t)
  (setq inhibit-compacting-font-caches t)
  (setq echo-keystrokes 0.02)
  (setq delete-by-moving-to-trash t)
  (put 'downcase-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'scroll-right 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (global-set-key (kbd "C-x 2") #'jack/split-and-follow-horizontally)
  (global-set-key (kbd "C-x 3") #'jack/split-and-follow-vertically)
  (global-set-key (kbd "C-s")   #'save-buffer)
  (unless (display-graphic-p)
    (global-set-key (kbd "C-h") #'backward-kill-word))
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq initial-scratch-message "")
  (setq split-width-threshold 150)
  (setq max-specpdl-size 10000)
  (setq max-lisp-eval-depth 10000)
  (set-default 'truncate-lines t)
  (jack/maybe-set-default-browser)
  (setq jit-lock-defer-time 0)
  (setq fast-but-imprecise-scrolling t)
  (xterm-mouse-mode +1)
  (bind-key* (kbd "C-,") #'jack/edit-config)
  (bind-key* (kbd "<f4>") #'(lambda ()
                              (interactive)
                              (if (one-window-p)
                                  (kill-current-buffer)
                                (kill-buffer-and-window)))))


(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (setq use-package-always-ensure t)
   (require 'use-package)))

;;(require 'ein)
;;(require 'ein-notebook)

(use-package ace-window
  :ensure t)

(require 'cl)
(require 'color)




;(use-package doom-themes
 ; :ensure t
  ;:config
  ;; glob settings (defaults)
  ;(setq doom-themes-enable-bold t
	;doom-themes-enable-italic t)
  ;(load-theme 'doom-one t)

  ;; to enable flashing mode for errors
  ;(doom-themes-visual-bell-config)
  ;; to enable neo-tree formate
  ;(doom-themes-neotree-config))
  
(use-package projectile)
(use-package flycheck)
(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package company)
(use-package lsp-ui)
(use-package which-key :config (which-key-mode))
(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)
(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs)

;; (setenv "WORKON_HOME" "C:/Users/jack.amy/anaconda3") ; /anaconda3 || /miniconda || wathever path your conda installation is located at
;; (pyvenv-mode 1)
