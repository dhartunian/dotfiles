;; Visual tweaks
(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)

;; Font
(set-face-attribute 'default nil :font "JetBrains Mono" :height 150)

;; Theme
(load-theme 'tango-dark)

;; Set up use-package (via: https://github.com/daviwil/emacs-from-scratch/blob/master/init.el)
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode 1)
;; (global-hl-line-mode 1)
(global-visual-line-mode 1)

(global-whitespace-mode 1)

;; via knz: https://dr-knz.net/a-tour-of-emacs-as-go-editor.html
(setq
   whitespace-style
   '(face ; viz via faces
     trailing ; trailing blanks visualized
     ;; lines-tail ; lines beyond
                ; whitespace-line-column
     space-before-tab
     space-after-tab
     newline ; lines with only blanks
     indentation ; spaces used for indent
                 ; when config wants tabs
     empty ; empty lines at beginning or end
     )
   ;; whitespace-line-column 100 ; column at which
        ; whitespace-mode says the line is too long
)

(show-paren-mode 1)

(use-package "swiper")
(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper-backward)

(use-package "go-mode")
(add-hook 'go-mode-hook (lambda ()
    (setq tab-width 4)))

(use-package "yasnippet")
(yas-global-mode 1)

(use-package "flycheck")
(global-flycheck-mode 1)

(use-package "lsp-mode")
(add-hook 'go-mode-hook #'lsp)

(add-hook 'before-save-hook 'gofmt-before-save)

(setq mac-option-modifier 'meta)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(use-package "projectile")
(use-package "magit")
