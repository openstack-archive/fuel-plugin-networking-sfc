==================
Installation Guide
==================

Networking SFC plugin installation
============================================

To install Networking SFC plugin, follow these steps:

#. Install all needed dependencies::

     # yum install createrepo rpm rpm-build dpkg-devel git ruby-devel createrepo
     dpkg-devel dpkg-dev rpm rpm-build python-pip
     # pip install fuel-plugin-builder
     # gem install fpm

#. Download plugin source code from github::

     # git clone https://github.com/openstack/fuel-plugin-networking-sfc
     # cd fuel-plugin-networking-sfc

#. 1.0 branch should be used on Fuel 9.0::

     # git checkout 1.0

#. Build a plugin::

     # fpb --build ./

#. Copy the plugin to already installed Fuel Master node; ssh can be used for
   that. If you do not have the Fuel Master node yet, see `Quick Start Guide
   <https://docs.mirantis.com/openstack/fuel/fuel-8.0/quickstart-guide.html>`_::

     # scp networking-sfc-<version>.noarch.rpm root@<Fuel_Master_ip>:/tmp

#. Install the plugin::

     # cd /tmp
     # fuel plugins --install networking-sfc-<version>.noarch.rpm

#. Check if the plugin was installed successfully::

     # fuel plugins
     id | name           | version | package_version | releases
     ---|----------------|---------|-----------------|--------------------
     1  | networking-sfc | 1.0.0   | 4.0.0           | ubuntu (mitaka-9.0)
