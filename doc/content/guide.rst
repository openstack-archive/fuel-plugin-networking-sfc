==========
User Guide
==========

Environment configuration
=========================

#. Create an environment with vxlans support. For more information about
   environment creation, see `Fuel User Guide <http://docs.openstack.org
   /developer/fuel-docs/userdocs/fuel-user-guide/create-environment.html>`_.

#. In *Environments* tab choose an environment for which you want to install
   Networking SFC plugin.

#. Enable L2 Population in *Network* tab in *Other* section.

   .. image:: images/enablel2.png
      :width: 50%

#. Enable plugin by  *Service Function Chaining Extension for OpenStack
   Networking* on *Settings* tab in *Other* section.

   .. image:: images/enableplugin.png
      :width: 50%

#. Plugin reguire Xenial kernel. Because it is not available in Fuel 9.0 by
   default, it should be installed by changing LTS kernel stack on *Settings*
   tab in *General* section. On the bootom is *Provision* section, in text box
   named *Initial packages* change packages from
   linux-headers-generic-lts-trusty and linux-image-generic-lts-trusty to
   linux-headers-generic-lts-xenial and linux-image-generic-lts-xenial.


   .. image:: images/xenial.png
      :width: 50%

   .. image:: images/xenial2.png
      :width: 50%

#. Adjust other environment settings to your requirements and deploy it. For
   more information, see `Configure your Environment <http://docs.openstack.org
   /developer/fuel-docs/userdocs/fuel-user-guide/configure-environment.html>`_.
