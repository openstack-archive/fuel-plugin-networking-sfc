..
 This work is licensed under the Apache License, Version 2.0.

 http://www.apache.org/licenses/LICENSE-2.0

=============================
Networking sfc plugin
=============================

Fuel Networking SFC plugin extends Mirantis OpenStack functionality by
installing networking sfc support.

Problem description
===================

Currently, Fuel has no support for  Networking SFC. Networking sfc plugin aims
to provide support for it.

Proposed change
===============

Implement a Fuel plugin that will install Networking SFC support.

Alternatives
------------

None

Data model impact
-----------------

None

REST API impact
---------------

None

Upgrade impact
--------------

None

Security impact
---------------

None

Notifications impact
--------------------

None

Other end user impact
---------------------

None

Performance Impact
------------------

Networking SFC plugin has no direct performance impact on OpenStack, but it
consumes additional resources (CPU, memory, database) and this should be
considered and tested on a test environment before production use.

Other deployer impact
---------------------

None

Developer impact
----------------

None

Implementation
==============

Plugin delivers Networking SFC support for Fuel. Plugin has several tasks:

* The first task changes package fuel-ha-utils which comes from base Fuel 9.0
  to package with applied fix https://review.openstack.org/#/c/334415.
  It's needed for proper Networking SFC deployment with Fuel 9.0.
* The second task concerns controllers. Installs networking-sfc package on
  controllers and configures Fuel to use it.
* The third task concerns computes nodes. Installs networking-sfc package on
  computes and configures Fuel to use it.

Networking SFC is installed on all environments which have plugin enabled.
Plugin configures all needed Openstack services.

Assignee(s)
-----------

| Szymon Bańka <sbanka@mirantis.com> (PM)
| Maciej Relewicz <mrelewicz@mirantis.com> (developer)
| Bartosz Kupidura <bkupidura@mirantis.com> (developer)
| Damian Szeluga <dszeluga@mirantis.com> (developer)

Work Items
----------

* Implement the Fuel plugin.
* Implement the Puppet manifests.
* Testing.
* Write the documentation.

Dependencies
============

* Fuel 9.0

Testing
=======

* Prepare a test plan.
* Test the plugin by deploying environments with all Fuel deployment modes.

Documentation Impact
====================

* Deployment Guide (how to install the plugin, how to configure and deploy an
  OpenStack environment with the plugin).
* User Guide (which features the plugin provides, how to use them in the
  deployed OpenStack environment).
* Test Plan.
* Test Report.

References
==========

* `Official networking sfc repository
  <https://github.com/openstack/networking-sfc>`_
