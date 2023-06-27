;; -*- mode: Emacs-Lisp -*-

(setq w32-pipe-read-delay 0)
;; all packages

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)
;; Enables basic packaging support
(require 'package)
;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; myPackages contains a list of package names
(defvar myPackages
  '(;;better-defaults                 ;; Set up some better Emacs defaults
    ;; python modules
    elpy                            ;; Emacs Lisp Python Environment
    ein                             ;; Jupyter notebook for Emacs
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken
    ;; jupyter
    ;; Black formatting on save
    ;; java modules
    jdee                            ;; testing, to set up a java dev Environment
    ;; theme modules
    material-theme                  ;; Theme
    doom-themes                     ;; doom-themes
    ;;material-theme                  ;; Theme
    )
  )
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)



;; ===================================
;; Basic Customization
;; ===================================

;; (setq inhibit-startup-message t)    ;; Hide the startup message
(global-display-line-numbers-mode t)   ;; maybe switch to (setq line-number-mode   t)
(setq column-number-mode t)

;; Confirm close
(setq confirm-kill-emacs 'yes-or-no-p)

;; Don't keep duplicate entries in history
(setq history-delete-duplicates t)

;; remember if marked text is highlighted
(setq mark-even-if-inactive t)
					
;; stop annoying half-page scroll
(setq scroll-step 1)

;; Dictionary
(setq ispell-dictionary "british")

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; Faster highlighting of matching brackets
(setq blink-matching-delay 0.3)

;; split horizontally just once, may change later
(split-window-right);


;; ====================================
;; Development Setup
;; ====================================

;; Enable elpy
(elpy-enable)
;; Set the Python executable
(setq python-shell-interpreter "C:/users/jack.amy/anaconda3/pythonw.exe")
(setq python-shell-interpreter-args "-i")
(setq python-pip-executable "C:/users/jack.amy/anaconda3/Scripts/pip.exe")

;; Set the Jedi executable (if available)
;;(setq jedi:server-command '("python" "C:/path/to/jediepcserver.py"))

;; Set the paths to autopep8, yapf, and black executables (if available)
(setq elpy-format-with 'black)
(setq elpy-flake8-path "C:/Users/jack.amy/anaconda3/Scripts/flake8.exe")
(setq elpy-black-path "C:/Users/jack.amy/anaconda3/Scripts/black.exe")
(setq elpy-yapf-path "C:/Users/jack.amy/anaconda3/Scripts/yapf.exe")
(setq elpy-autopep8-path "C:/Users/jack.amy/anaconda3/Scripts/autopep8.exe")

;; Set the syntax checker command (e.g., flake8)
(setq flycheck-python-flake8-executable "C:/Users/jack.amy/anaconda3/Scripts/flake8.exe")

;;Disable RPC virtualenv
;; (setq elpy-rpc-virtualenv-path "C:/Users/user/anaconda3/envs/base")
;; (setq elpy-rpc-virtualenv-path 'nil)
(setq elpy-rpc-python-command "C:/users/jack.amy/anaconda3/python.exe") 
;; if using elpy, don't save pre compiling
(setq compilation-ask-about-save nil)

;; (setq jupyter-repl-echo-eval-p t)


;; ;; Enable autopep8
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ;; Use IPython for REPL
;; (setq python-shell-interpreter "C:/Users/jack.amy/anaconda3/pythonw.exe"
;; ;;(setq python-shell-interpreter "C:/Users/jack.amy/anaconda3/Scripts/jupyter.exe"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")


;; ;; Enable Flycheck
;; (when (require 'flycheck nil t)		
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))




;;  ;;; Settings without corresponding packages
;; (split-window-right)
;; (use-package emacs
;;   :preface
;;   (defvar jack/indent-width 4)
;;   (defun jack/maybe-set-default-browser ()
;;     "When in WSL Emacs, open links in default Windows 11 browser."
;;     (cond
;;      ((eq system-type 'gnu/linux)
;;       (when (string-match "Linux.*microsoft.*Linux"
;;                           (shell-command-to-string "uname -a"))
;;         (setq browse-url-generic-program "/mnt/c/Windows/System32/cmd.exe"
;;               browse-url-generic-args '("/c" "start" "")
;;               browse-url-browser-function 'browse-url-generic)))))
;;   (defun jack/edit-config ()
;;     "Open Emacs settings."
;;     (interactive)
;;     (find-file (concat user-emacs-directory "init.el")))
;;   (defun jack/split-and-follow-horizontally ()
;;     "Split window below."
;;     (interactive)
;;     (split-window-below)
;;     (other-window 1))
;;   (defun jack/split-and-follow-vertically ()
;;     "Split window right."
;;     (interactive)
;;     (split-window-right)
;;     (other-window 1))
;;   :config
;;   (setq user-full-name "Jack A.")
;;   (setq frame-title-format '("Emacs " emacs-version))
;;   (setq python-python-command "C:/Users/jack.amy/anaconda3/python.exe")
;;   (setq-default default-directory "~/")
;;   (setq frame-resize-pixelwise t)
;;   (setq hscroll-margin 0)
;;   (setq load-prefer-newer t)
;;   (setq inhibit-compacting-font-caches t)
;;   (setq echo-keystrokes 0.02)
;;   (setq delete-by-moving-to-trash t)
;;   (put 'downcase-region 'disabled nil)
;;   (put 'upcase-region 'disabled nil)
;;   (put 'scroll-right 'disabled nil)
;;   (put 'scroll-left 'disabled nil)
;;   (global-set-key (kbd "C-x 2") #'jack/split-and-follow-horizontally)
;;   (global-set-key (kbd "C-x 3") #'jack/split-and-follow-vertically)
;;  ;; (global-set-key (kbd "C-s")   #'save-buffer)
;;   (unless (display-graphic-p)
;;     (global-set-key (kbd "C-h") #'backward-kill-word))
;;   (setq-default indent-tabs-mode nil)
;;   (setq-default tab-width 4)
;;   (setq initial-scratch-message "")
;;   (setq split-width-threshold 150)
;;   (setq max-specpdl-size 10000)
;;   (setq max-lisp-eval-depth 10000)
;;   (set-default 'truncate-lines t)
;;   (jack/maybe-set-default-browser)
;;   (setq jit-lock-defer-time 0)
;;   (setq fast-but-imprecise-scrolling t)
;;   (xterm-mouse-mode +1)
;;   (bind-key* (kbd "C-,") #'jack/edit-config)
;;   (bind-key* (kbd "<f4>") #'(lambda ()
;;                               (interactive)
;;                               (if (one-window-p)
;;                                   (kill-current-buffer)
;;                                 (kill-buffer-and-window)))))



;; ;; ;; code for java settings
;; ;; (use-package projectile)
;; ;; (use-package flycheck)
;; ;; (use-package yasnippet :config (yas-global-mode))
;; ;; (use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
;; ;;   :config (setq lsp-completion-enable-additional-text-edit nil))
;; ;; (use-package hydra)
;; ;; (use-package company)
;; ;; (use-package lsp-ui)
;; ;; (use-package which-key :config (which-key-mode))
;; ;; (use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
;; ;; (use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
;; ;; (use-package dap-java :ensure nil)
;; ;; (use-package helm-lsp)
;; ;; (use-package helm
;; ;;   :config (helm-mode))
;; ;; (use-package lsp-treemacs)

;; ;; (use-package projectile
;; ;;     :ensure t
;; ;;     :init (projectile-mode +1)
;; ;;     :config
;; ;;     (define-key
;; ;;         projectile-mode-map
;; ;;         (kbd "C-c p")
;; ;;       'projectile-command-map))

;; ;;(require 'ein)
;; ;;(require 'ein-notebook)

;; (use-package ace-window
;;   :ensure t)

;; ;;(require 'cl)
;; (require 'color)

;; ;; code for python settings 
;; (require 'python-mode)



;; (use-package doom-themes
;;   :ensure t
;;     :config
;;   ;; glob settings (defaults)
;;   (setq doom-themes-enable-bold t)
;; 	;doom-themes-enable-italic t)
;;   (load-theme 'doom-one t)

;;   ;; to enable flashing mode for errors
;;   (doom-themes-visual-bell-config)
;;   ;; to enable neo-tree format
;;   (doom-themes-neotree-config))

(use-package timu-rouge-theme
  :ensure t
  :config
  (load-theme 'timu-rouge t))

(customize-set-variable 'timu-rouge-scale-org-document-title t)
(customize-set-variable 'timu-rouge-scale-org-document-info t)
(customize-set-variable 'timu-rouge-scale-org-level-1 t)
(customize-set-variable 'timu-rouge-scale-org-level-2 t)
(customize-set-variable 'timu-rouge-scale-org-level-3 t)

(customize-set-variable 'timu-rouge-org-intense-colors t)

(customize-set-variable 'timu-rouge-mode-line-border t)






;; (setenv "WORKON_HOME" "C:/Users/jack.amy/anaconda3") ; /anaconda3 || /miniconda || wathever path your conda installation is located at
;; (pyvenv-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(timu-rouge-theme which-key wc-mode use-package sweet-theme quiz python-mode pyenv-mode py-autopep8 projectile material-theme markdown-preview-mode lsp-ui lsp-pyright lsp-java jedi jdee helm-lsp elpy eink-theme ein doom-themes blacken better-defaults))
 '(warning-suppress-types '(((flymake flymake)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )
