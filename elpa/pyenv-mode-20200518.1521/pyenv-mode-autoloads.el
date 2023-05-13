;;; pyenv-mode-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (file-name-directory load-file-name)) (car load-path)))



;;; Generated autoloads from pyenv-mode.el

(autoload 'pyenv-mode-set "pyenv-mode" "\
Set python shell VERSION.

(fn VERSION)" t)
(autoload 'pyenv-mode-unset "pyenv-mode" "\
Unset python shell version." t)
(defvar pyenv-mode nil "\
Non-nil if Pyenv mode is enabled.
See the `pyenv-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pyenv-mode'.")
(custom-autoload 'pyenv-mode "pyenv-mode" nil)
(autoload 'pyenv-mode "pyenv-mode" "\
Minor mode for pyenv interaction.

\\{pyenv-mode-map}

This is a global minor mode.  If called interactively, toggle the
`Pyenv mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='pyenv-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "pyenv-mode" '("pyenv-mode-"))

;;; End of scraped data

(provide 'pyenv-mode-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; pyenv-mode-autoloads.el ends here
