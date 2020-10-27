;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Theme
(load-theme 'doom-tomorrow-night t)

(setq doom-font (font-spec :family "Fira Code Light" :size 13))

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default js-indent-level 2)
(setq-default typescript-indent-level 2)
(setq-default web-mode-indent-style 2)
(setq-default web-mode-code-indent-offset 2)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'json-mode-hook 'prettier-js-mode)
(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'graphql-mode-hook 'prettier-js-mode)

(add-hook 'after-init-hook 'global-company-mode)

;; Connfigure groovy-mode
(add-hook 'groovy-mode-hook
          (lambda ()
            (setq groovy-indent-offset 2)
            (setq indent-line-function 'indent-relative)))

;; Create submodules for multiple major modes
(require 'mmm-mode)
(setq mmm-global-mode t)
(setq mmm-submode-decoration-level 1) ;; Turn off background highlight
(setq mmm-parse-when-idle t)

;; Add css mode for CSS in JS blocks
(mmm-add-classes
  '((mmm-styled-mode
    :submode css-mode
    :front "\\(styled\\|css\\)[.()<>[:alnum:]]?+`"
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-styled-mode)

;; Add submodule for graphql blocks
(mmm-add-classes
  '((mmm-graphql-mode
    :submode graphql-mode
    :front "gr?a?p?h?ql`" ;; Add additional aliases like `gql` if needed
    :back "`;")))

(mmm-add-mode-ext-class 'typescript-mode nil 'mmm-graphql-mode)

;; Assign slim-mode to .slim files
(add-to-list 'auto-mode-alist '("\\.slim\\'" . slim-mode))

;; Gherkin feature support
(add-to-list 'auto-mode-alist '("\\.feature\\'" . feature-mode))

;; Ruby for crypted files
(add-to-list 'auto-mode-alist '("\\.rb.key\\'" . ruby-mode))

;; Assign yaml-mode to .yaml and .yml files
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))

;; Assign yaml-mode to .yaml and .yml files
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "fe76f3d5094967034192f6a505085db8db6deb0e135749d9a54dc488d6d3ee2f" "001c2ff8afde9c3e707a2eb3e810a0a36fb2b466e96377ac95968e7f8930a7c5" "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "332e009a832c4d18d92b3a9440671873187ca5b73c2a42fbd4fc67ecf0379b8c" "018c8326bced5102b4c1b84e1739ba3c7602019c645875459f5e6dfc6b9d9437" "a2286409934b11f2f3b7d89b1eaebb965fd63bc1e0be1c159c02e396afb893c8" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" default))
 '(package-selected-packages '(dockerfile-mode yaml-mode pretty-mode rubocop rubocopfmt)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
