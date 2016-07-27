Networking SFC plugin for Fuel
==============================

Networking SFC
--------------

One of the foundations for NFV enabled clouds is to have
Networking Service Function Chaining which provides an
ability to define an ordered list of network services
which to form a “chain” of services. This could be used
by f.e. Telcos to simplify management of their infrastructure.

This plugin extends MOS with Networking SFC.

Requirements
------------

| Requirement                      | Version |
|:---------------------------------|:--------|
| Mirantis OpenStack compatibility |   10.0  |

It is required to install this on vxlans/gre enabled environment. Will not work otherwise.
Neutron L2 population setting should be also enabled.


Installation Guide
==================

Networking SFC plugin installation
----------------------------------

To install Networking SFC plugin, follow these steps:

1. Install all needed dependencies

        # yum install createrepo rpm rpm-build dpkg-devel git ruby-devel createrepo dpkg-devel dpkg-dev rpm rpm-build python-pip
        # pip install fuel-plugin-builder
        # gem install fpm

2. Build a plugin `fpb --build dir`

3. Copy the plugin on already installed Fuel Master node; ssh can be used for
    that. If you do not have the Fuel Master node yet, see
    [Quick Start Guide](https://software.mirantis.com/quick-start/) :

        # scp networking-sfc-<version>.noarch.rpm root@<Fuel_Master_ip>:/tmp

4. Install the plugin:

        # cd /tmp
        # fuel plugins --install networking-sfc-<version>.noarch.rpm

5. Check if the plugin was installed successfully:

        # [root@nailgun ~]# fuel plugins
        id | name           | version | package_version | releases
        ---|----------------|---------|-----------------|--------------------
        1  | networking-sfc | 2.0.0   | 4.0.0           | ubuntu (newton-10.0)

Networking SFC plugin configuration
-----------------------------------

1. Create an environment with vxlans support.
2. Enable L2 Population in network tab.
3. Enable the plugin on the Settings tab of the Fuel web UI.
4. In tab 'Settings', in section 'General' -> 'Provision' -> 'Initial packages' please change the name of the installed kernel stack from trusty to xenial. For both packages, from linux-headers-generic-lts-trusty and linux-image-generic-lts-trusty to linux-headers-generic-lts-xenial and linux-image-generic-lts-xenial.
5. Deploy the environment.

Known issues
------------

1. Networking SFC is very dynamic project, because of that we stick to last known working commit.

Contributors
------------

 * Damian Szeluga <dszeluga@mirantis.com> (developer)
 * Maciej Relewicz <mrelewicz@mirantis.com> (developer)
 * Bartosz Kupidura <bkupidura@mirantis.com> (developer)
