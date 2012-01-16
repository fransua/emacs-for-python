(setq frame-title-format "%f")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; load gabi things
(load-file "~/.emacs.d/epy-init.el")
(add-to-list 'load-path "~/.emacs.d/") ;; tell where to load the various files
(require 'epy-setup) ;; It will setup other loads, it is required!
(require 'epy-python) ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing) ;; For configurations related to editing [optional]
(require 'epy-bindings) ;; For my suggested keybindings [optional]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(epy-setup-ipython)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-linum-mode 0)
(display-time)
(set-cursor-color "lightgrey")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
; '(pc-selection-mode t nil (pc-select)) ;; REMOVED BECAUSE OTHERWISE UP-DOWN ALT MOVEMENT OF SELECTION DO NO WORK
 '(scroll-bar-mode nil)
 '(setq visible-bell t)
 '(show-paren-mode t)
 '(tool-bar-mode nil nil (tool-bar))
 '(truncate-lines t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; key-bindings
(global-unset-key "\M-g")
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'display-local-help)
(global-set-key [\s-\tab] 'rope-code-assist)
(global-set-key [f6] 'other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; esthetics
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey85" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "cyan"))))
 '(font-lock-comment-face ((t (:foreground "grey50" :slant italic))))
 '(font-lock-doc-string-face ((((class color) (background dark)) (:foreground "#00FA85" :bold t)) ((class color) (:foreground "darkGreen"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "plum" :bold t))))
 '(font-lock-reference-face ((((class color) (background dark)) (:foreground "#FAD987" :bold t)) ((class color) (:foreground "maroon4"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "#00EA75"))))
 '(paren-face-match ((((class color)) (:background "green" :foreground "black"))))
 '(paren-face-mismatch ((((class color)) (:background "black" :foreground "red"))))
 '(paren-face-no-match ((((class color)) (:background "red" :foreground "grey"))))
 '(show-paren-match ((((class color)) (:background "green2"))))
 '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white")))))
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; perl replace
(defun perl-replace (start end)
  "Replace a text pattern in a  region using perl expressions"
  (interactive "*r")
  (setq regexp (read-string "Regexp: "))
  (setq to-string (read-string (concat "[" regexp "] Replacement: ")))
  (setq command (concat "perl -e 's/" regexp "/" to-string "/g' -p"))
  (shell-command-on-region start end command nil 1)
  )
(global-set-key "\M-r" 'perl-replace)
