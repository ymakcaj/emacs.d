;;; quiz-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (file-name-directory load-file-name)) (car load-path)))



;;; Generated autoloads from quiz.el

(autoload 'quiz "quiz" "\
Play a multiple choice trivia quiz with COUNT questions.

If non-blank, questions from only CATEGORY will be asked.

Questions will be at most as hard as DIFFICULTY.

(fn COUNT CATEGORY DIFFICULTY)" t)
(register-definition-prefixes "quiz" '("quiz-"))

;;; End of scraped data

(provide 'quiz-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; quiz-autoloads.el ends here
