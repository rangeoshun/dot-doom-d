;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Theme
(load-theme 'doom-tomorrow-night t)

;; Assign typescript-mode to .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tide-mode))

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default js-indent-level 2)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'json-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)
(add-hook 'css-mode-hook 'prettier-js-mode)

;; Connfigure groovy-mode
(add-hook 'groovy-mode-hook
          (lambda ()
            (setq groovy-indent-offset 2)
            (setq indent-line-function 'indent-relative)))
