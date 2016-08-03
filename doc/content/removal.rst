==================
Removal Guide
==================

Networking SFC plugin removal
============================================

To uninstall Networking SFC plugin, follow these steps:

1. Disable plugin in all environments which are using it.
2. Uninstall the plugin:

   # fuel plugins --remove networking-sfc==1.0.0

3. Check if the plugin was uninstalled successfully:

   # fuel plugins
    id | name                      | version  | package_version
    ---|---------------------------|----------|----------------
