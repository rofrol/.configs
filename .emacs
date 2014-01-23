;;{{{ Packages
; http://ergoemacs.org/emacs/emacs_package_system.html
; http://stackoverflow.com/questions/14836958/updating-packages-in-emacs
(require 'package)
;add-to-list 'package-archives 
;   '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

; auto-refresh only first-time
(when (not package-archive-contents)
  (package-refresh-contents))

; Within Emacs, use M-x list-packages to list all packages which will automatically refresh the archive contents. Afterwards use U to mark all upgradable packages to be upgraded, and x to actually perform the new updates. Emacs will then fetch and install all upgrades, and ask you to whether to remove the old, obsolete versions afterwards. http://stackoverflow.com/a/14838781/588759

;For manually installed packages in ~/.emacs.d
;http://ergoemacs.org/emacs/emacs_installing_packages.html
(add-to-list 'load-path "~/.emacs.d/")
;;}}}

;;{{{ Theme
(load-theme 'solarized-dark t)
;;}}}
 ;;{{{ Undo
;http://www.dr-qubit.org/emacs.php#undo-tree
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-z") 'undo-tree-redo)
;;}}}
;;{{{ Folding
; http://www.emacswiki.org/FoldingMode
; 
;(setq folding-default-keys-function
;      'folding-bind-backward-compatible-keys)

(if (load "folding" 'nomessage 'noerror)
     (folding-mode-add-find-file-hook))
;(global-set-key (kbd "<f1>") 'folding-show-current-subtree)
;(global-set-key (kbd "<f2>") 'folding-hide-current-subtree)
(add-hook 'emacs-lisp-mode-hook 'folding-mode)

(require 'fold-dwim)
(global-set-key (kbd "<f1>") 'fold-dwim-toggle)
(global-set-key (kbd "<f2>") 'fold-dwim-hide-all)
(global-set-key (kbd "<f3>") 'fold-dwim-show-all)
;;}}}

;;{{{ Misc
; http://ergoemacs.org/emacs/emacs_make_modern.html
(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression
(global-linum-mode 1) ; display line numbers in margin
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
;;}}}
