;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; (package-initialize)
;; (package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "1b1e54d9e0b607010937d697556cd5ea66ec9c01e555bb7acea776471da59055" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (haste flycheck-gometalinter solarized-theme flycheck darkokai-theme go-playground company auto-complete all-the-icons neotree go-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Icons
;; https://github.com/domtronn/all-the-icons.el
(require 'all-the-icons)

;; Neo Tree
;; https://www.emacswiki.org/emacs/NeoTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Golang
'(package-selected-packages (quote (go-mode)))
(add-hook 'before-save-hook 'gofmt-before-save)

;; https://github.com/auto-complete/auto-complete
;; https://github.com/nsf/gocode/blob/master/emacs/go-autocomplete.el
(add-to-list 'load-path (concat
			       (getenv "GOPATH")
			       "/src/github.com/nsf/gocode/emacs"))

(load "go-autocomplete")
(require 'auto-complete-config)
(require 'go-autocomplete)
(ac-config-default)

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; https://github.com/alecthomas/gometalinter#installing
(require 'flycheck-gometalinter)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

;; https://github.com/syohex/emacs-go-eldoc
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;;; Emacs general config ;;;

;; No bell
(setq ring-bell-function 'ignore)
(setq bell-volume 0)

;; Hightline current line
(global-hl-line-mode t)

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; windows management
(winner-mode 1)

(menu-bar-mode 0)                        ; no file/edit/blabla top menu.
(setq inhibit-startup-message t)         ; no splash display.
(setq-default truncate-lines t)          ; no wrapping.
(fset 'yes-or-no-p 'y-or-n-p)            ; yes/no shortcut.
(when (require 'ido nil t) (ido-mode t)) ; (much) better file/buffer browsing.
(global-font-lock-mode t)		 ; default enable syntax coloration.
(setq initial-scratch-message "")	 ; remove the default text within the scratch buffer

;; Display current line/column
(column-number-mode 1)
(line-number-mode 1)

;; Theme
;; https://github.com/sjrmanning/darkokai
(load-theme 'darkokai t)

;; Default tab width
(setq tab-width 4)
(setq-default c-basic-offset 4)

;; Hastebin
(autoload 'haste "haste" nil t)
