;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Theme
(load-theme 'doom-tomorrow-night t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default web-mode-indent-style 2)
(setq-default web-mode-code-indent-offset 2)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'json-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)
(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

;; Connfigure groovy-mode
(add-hook 'groovy-mode-hook
          (lambda ()
            (setq groovy-indent-offset 2)
            (setq indent-line-function 'indent-relative)))

;; Assign typescript-mode to .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  (eldoc-mode +1)
  (tide-format-before-save )
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; Assign typescript-mode to .tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; Create submodules for multiple major modes
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 0) ;; Turn off background highlight

;; Add css mode for CSS in JS blocks
(mmm-add-classes
  '((mmm-styled-mode
    :submode css-mode
    :front "[a-pr-zA-PR-Z0-9\(\)_]?[a-km-zA-KM-Z0-9\(\)<>(ul)_]+`\n"
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-styled-mode)

;; Add submodule for graphql blocks
(mmm-add-classes
  '((mmm-graphql-mode
    :submode graphql-mode
    :front "gr?a?p?h?ql`\n" ;; Add additional aliases like `gql` if needed
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-graphql-mode)

;; Add JSX submodule, because typescript-mode is not that great at it
(mmm-add-classes
  '((mmm-jsx-mode
    :front "\s\([\n<]"
    :back "[\s>]\);\n"
    :submode web-mode)))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-jsx-mode)

(defun mmm-reapply ()
  (mmm-mode)
  (mmm-mode))

(add-hook 'after-save-hook 'mmm-reapply)

;; Assign slim-mode to .slim files
(add-to-list 'auto-mode-alist '("\\.slim\\'" . slim-mode))

;; Gherkin feature support
(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))
