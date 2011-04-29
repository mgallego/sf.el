;;;###autoload
(defgroup sf nil
  "Convenience functions for working with Symfony 2"
  :prefix "symfony-"
  :group 'convenience
)


(require 'eproject)
(require 'eproject-extras)

(define-project-type sf (generic)
  (look-for "app/AppKernel.php")
  :relevant-files ("src/" "app/config/" "app/autoload.php" "app/AppKernel.php")
  :main-file "app/AppKernel.php"
)

(add-hook 'sf-project-file-visit-hook
          'sf-minor-mode-on
)

;;open sf files
(defun sf-open-file (filename)
  "open a file relative to this projects root"
  (find-file (expand-file-name filename (eproject-root)))
)


;;open the app config file in a new buffer
(defun sf-app-config ()
  "open the app config file in a new buffer"
  (interactive)
  (sf-open-file "app/config/config.yml")
)

;;open the app parameters in a new buffer
(defun sf-app-parameters ()
  "open the app parameters in a new buffer"
  (interactive)
  (sf-open-file "app/config/parameters.ini")
)

;;open the security configuration file in a new buffer
(defun sf-app-security ()
  "open the security configuration file in a new buffer"
  (interactive)
  (sf-open-file "app/config/security.yml")
)

;;open the app routing file in a new buffer
(defun sf-app-routing ()
  "open the app routing file in a new buffer"
  (interactive)
  (sf-open-file "app/config/routing.yml")
)

;;open the AppKernel file in a new buffer
(defun sf-app-kernel ()
  "open the AppKernel file in a new buffer"
  (interactive)
  (sf-open-file "app/AppKernel.php")
)

;;open the app autoload file in a new buffer
(defun sf-app-autoload ()
  "open the app autoload file in a new buffer"
  (interactive)
  (sf-open-file "app/autoload.php")
)

;;delete the  cache
(defun sf-cache-clear ()
  "delete-cache"
  (interactive)
  (shell-command
   (concat
    "php "
    (expand-file-name "app/console " (eproject-root))
    "cache:clear"))
)

;;console
(defun sf-console (parameter)
  "call the console of Sf"
  (interactive "sParameters:")
  (shell-command
   (concat
    "php "
    (expand-file-name "app/console" (eproject-root))
    " " parameter))
)

(defvar sf-mode-keymap (make-keymap)
  "keymappings for sf-mode"
)

(define-key sf-mode-keymap
  (kbd "C-c C-s c")
  'sf-app-config
)

(define-key sf-mode-keymap
  (kbd "C-c C-s p")
  'sf-app-parameters
)

(define-key sf-mode-keymap
  (kbd "C-c C-s s")
  'sf-app-security
)

(define-key sf-mode-keymap
  (kbd "C-c C-s r")
  'sf-app-routing
)

(define-key sf-mode-keymap
  (kbd "C-c C-s k")
  'sf-app-kernel
)

(define-key sf-mode-keymap
  (kbd "C-c C-s a")
  'sf-app-autoload
)

(define-key sf-mode-keymap
  (kbd "C-c C-s d")
  'sf-cache-clear
)

(define-key sf-mode-keymap
  (kbd "C-c C-s r")
  'sf-console
)

;;;###autoload
(define-minor-mode sf-minor-mode
  nil                  ;default docstring
  nil                  ;initial value
  "[sf2]"              ;mode line indicator
  sf-mode-keymap ;keymap
  :group 'sf
)

(defun sf-minor-mode-on ()
  (interactive)
  (sf-minor-mode t)
)

(defun sf-minor-mode-off ()
  (interactive)
  (sf-minor-mode nil)
)

(provide 'sf)
;;;sf.el ends here
