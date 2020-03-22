(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode)
)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(defalias 'list-buffers 'ibuffer)

(setq backup-directory-alist
     `(("." . ,(concat user-emacs-directory "backups"))))

(add-hook 'prog-mode-hook 
          (lambda () (setq-local display-line-numbers 'visual)))

(setq-default indent-tabs-mode nil)
(use-package dtrt-indent
  :ensure t)

(setq-default show-trailing-whitespace t)
(setq-default whitespace-line-colomn 80)
(setq whitespace-style 
    '(face spaces tabs trailing lines-tail space-mark tab-mark)
)
(global-whitespace-mode t)
(add-hook 'prog-mode-hook 
          (lambda () (set-face-attribute 'whitespace-line nil 
                      :background "#360000" :foreground nil)
 ))

(use-package rainbow-delimiters
  :ensure t
  :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

(use-package highlight-indent-guides
      :ensure t
      :config
        (setq highlight-indent-guides-method 'character)
        (setq highlight-indent-guides-responsive 'stack)
        (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    )

;;    (defun my-highlighter (level responsive display)
;;      DeepSkyBlue
;;      DarkSeaGreen
;;      LightGoldenRod
;;      DarkOrange
;;      MediumOrchid

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
;; Suggested set faces that I didn't like
;;    (custom-set-faces
;;   '(aw-leading-char-face
;;     ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package dracula-theme
  :ensure t)

(load-theme 'dracula t)

(use-package counsel
:ensure t)

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(use-package htmlize
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
    (setq jedi:setup-keys t)
  :config
    (add-hook 'python-mode-hook 'jedi:setup)
    (add-hook 'python-mode-hook 'jedi:ac-setup)
    (setq jedi:complete-on-dot t)
 )

(use-package elpy
  :ensure t
  :init
    (elpy-enable)
    (setq elpy-rpc-backend "jedi"))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(unless (package-installed-p 'evil)
  (package-install ' evil))

(require 'evil)
(evil-mode 1)
(setq-default evil-cross-lines t)

(desktop-save-mode 1)
