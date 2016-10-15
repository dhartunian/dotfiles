;;; packages.el --- positiondev layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: David Hartunian <david@dh-mbp.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `positiondev-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `positiondev/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `positiondev/pre-init-PACKAGE' and/or
;;   `positiondev/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst positiondev-packages
  '(
    helm
    helm-projectile
    helm-configuration
    )
  "The list of Lisp packages required by the positiondev layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; helm-y things
(defun helm-my-mini ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer
     (if (eq nil (ignore-errors (projectile-project-root)))
         '(helm-source-buffers-list
           helm-source-recentf
           helm-source-files-in-current-dir
           helm-source-buffer-not-found)
       '(helm-source-projectile-buffers-list
         helm-source-projectile-recentf-list
         helm-source-projectile-files-list
         helm-source-buffers-list
         helm-source-recentf
         helm-source-buffer-not-found))
     "*helm-my-mini*")))

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-x b")   'helm-my-mini)
(global-set-key (kbd "C-x C-b") 'helm-my-mini)

(global-set-key (kbd "C-c g o") 'helm-occur)
(global-set-key (kbd "C-c g s") 'helm-projectile-ag)

(global-set-key (kbd "C-x g") 'magit-status)

;; haskell things
(setq haskell-stylish-on-save t)

;; autosave things
(setq auto-save-interval 20)
(setq auto-save-timeout 1)
(setq auto-revert-interval 1)
(setq auto-save-visited-file-name t)
(setq create-lockfiles nil)
(setq global-auto-revert-mode t)
(setq make-backup-files nil)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;; packages.el ends here
