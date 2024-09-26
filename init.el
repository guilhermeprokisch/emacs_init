;; Remove welcome from startup
(setq inhibit-startup-message t)

;; Remove icons and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line numbers
(global-display-line-numbers-mode t)

;; Remove the scroll bar
(scroll-bar-mode -1)

;; Font size
(set-face-attribute 'default nil :height 120)

;; Ativar repositórios de pacotes
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Atualizar a lista de pacotes
(unless package-archive-contents
  (package-refresh-contents))

;; Garantir que o use-package está instalado
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Ativar o use-package
(require 'use-package)
(setq use-package-always-ensure t)

;; Instalar e configurar o Magit
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

;; Python
(use-package python
  :ensure t)

;; Instalar e configurar o tema solarized
;; Usar tema diferente no terminal
(if (display-graphic-p)
    ;; Se estiver no modo gráfico, carregar Kuronami
    (use-package kuronami-theme
      :ensure t
      :config
      (load-theme 'kuronami t))
  ;; Se estiver no terminal, carregar um tema mais simples
  (load-theme 'wombat t))  ;; Ou outro tema que preferir

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (compat seq solarized-theme magit use-package try elpy auto-package-update))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

