;;open the app config file in a new buffer
(defun sf-app-config ()
  "open the app config file in a new buffer"
  (interactive)
  (find-file (concat SFPath "app/config/config.yml"))
)

;;open the app parameters in a new buffer
(defun sf-app-parameters ()
  "open the app parameters in a new buffer"
  (interactive) 
  (find-file (concat SFPath "app/config/parameters.ini"))
)

;;open the security configuration file in a new buffer
(defun sf-app-security ()
  "open the security configuration file in a new buffer"
  (interactive) 
  (find-file (concat SFPath "app/config/security.yml"))
)

;;open the app routing file in a new buffer
(defun sf-app-routing ()
  "open the app routing file in a new buffer"
  (interactive) 
  (find-file (concat SFPath "app/config/routing.yml"))
)

;;open the AppKernel file in a new buffer
(defun sf-app-kernel ()
  "open the AppKernel file in a new buffer"
  (interactive) 
  (find-file (concat SFPath "app/AppKernel.php"))
)

;;open the app autoload file in a new buffer
(defun sf-app-autoload ()
  "open the app autoload file in a new buffer"
  (interactive) 
  (find-file (concat SFPath "app/autoload.php"))
)

;;delete the  cache
(defun sf-cache-clear ()
  "delete-cache"
  (interactive)
  (shell-command (concat "php " SFPath "app/console cache:clear"))
)

;;console
(defun sf-console (parameter)
  "call the console of Symfony2"
  (interactive "sParameters:")
  (shell-command (concat "php " SFPath "app/console " parameter))
)