Networking SFC plugin for Fuel
=======================

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
| Mirantis OpenStack compatibility | 9.0     |

It is required to install this on vxlans enabled environment. Will not work otherwise.

Installation Guide
==================

Networking SFC plugin installation
---------------------------

To install Networking SFC plugin, follow these steps:

1. Build a plugin `fpb --build dir`

2. Copy the plugin on already installed Fuel Master node; ssh can be used for
    that. If you do not have the Fuel Master node yet, see
    [Quick Start Guide](https://software.mirantis.com/quick-start/) :

        # scp networking-sfc-<version>.noarch.rpm root@<Fuel_Master_ip>:/tmp

3. Install the plugin:

        # cd /tmp
        # fuel plugins --install networking-sfc-<version>.noarch.rpm

4. Check if the plugin was installed successfully:

        # [root@nailgun ~]# fuel plugins
        id | name           | version | package_version | releases
        ---|----------------|---------|-----------------|--------------------
        1  | networking-sfc | 1.0.0   | 4.0.0           | ubuntu (mitaka-9.0)

Networking SFC plugin configuration
----------------------------

1. Create an environment.
2. Enable L2 Population in network tab.
3. Enable the plugin on the Settings tab of the Fuel web UI.
4. Deploy the environment.

Contributors
------------

 * Damian Szeluga <dszeluga@mirantis.com> (developer)
 * Maciej Relewicz <mrelewicz@mirantis.com> (developer)
