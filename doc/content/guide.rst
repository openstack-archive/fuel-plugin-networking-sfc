==========
User Guide
==========

Environment configuration
=========================

#. Create an environment with vxlans support. For more information about
   environment creation, see `Mirantis OpenStack User Guide
   <http://docs.mirantis.com/openstack/fuel/fuel-9.0
   /user-guide.html#create-a-new-openstack-environment>`_.

#. In *Environments* tab choose an environment for which you want to install
   Networking SFC plugin.

#. Enable plugin by  *Service Function Chaining Extension for OpenStack
   Networking* on *Settings* tab in section *Other*.

   .. image:: images/enableplugin.png
      :width: 50%

#. Enable L2 Population in *Network* tab in section *Other*.

   .. image:: images/enablel2.png
      :width: 50%

#. Plugin reguire Xenial kernel. Because it is not in Fuel 9.0 by default it's
   should be installed by changing LTS kernel stack on *Settings* tab in
   section *General*. On the bootom is section *Provision*, in text box named
   *Initial packages* change packages from linux-headers-generic-lts-trusty and
   linux-image-generic-lts-trusty to linux-headers-generic-lts-xenial and
   linux-image-generic-lts-xenial.


   .. image:: images/xenial.png
      :width: 50%

   .. image:: images/xenial2.png
      :width: 50%

#. Adjust other environment settings to your requirements and deploy the
   environment. For more information, see
   `Mirantis OpenStack User Guide <http://docs.mirantis.com/openstack/fuel
   /fuel-9.0/user-guide.html#create-a-new-openstack-environment>`_.
