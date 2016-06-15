#    Copyright 2016 Mirantis, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
notice('MODULAR: networking-sfc/networking-sfc-compute.pp')

$use_neutron = hiera('use_neutron', false)

if $use_neutron {
  include ::neutron::params

  $neutron_config = hiera_hash('neutron_config')

  $default_service_plugins = [
     'neutron.services.l3_router.l3_router_plugin.L3RouterPlugin',
     'neutron.services.metering.metering_plugin.MeteringPlugin',
  ]
  $sfc_plugins = [
    'networking_sfc.services.flowclassifier.plugin.FlowClassifierPlugin',
    'networking_sfc.services.sfc.plugin.SfcPlugin',
  ]

  $enabled_plugins = inline_template("<%= (@default_service_plugins + @sfc_plugins).join(',') %>")

  service {'neutron-openvswitch-agent':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }

  package {'python-networking-sfc':
      ensure => installed,
  } ->

  neutron_config { 'DEFAULT/service_plugins': value => $enabled_plugins } ->

  neutron_plugin_ml2 { 'securitygroup/enable_security_group': value => 'False'} ->
  neutron_plugin_ml2 { 'securitygroup/enable_ipset': value => 'False'} ->
  neutron_plugin_ml2 { 'securitygroup/firewall_driver': value => 'neutron.agent.firewall.NoopFirewallDriver'} ->

  file_line { 'Add OSV section to neutron.conf':
    path => '/etc/neutron/neutron.conf',
    line => "\n[sfc]\ndrivers = ovs\n",
  } ->

  exec { 'Modify neutron-openvswitch-agent.conf':
    command => "sed -i 's|/usr/bin|/usr/local/bin|g' /etc/init/neutron-openvswitch-agent.conf",
    path    => '/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin',
    notify  => Service['neutron-openvswitch-agent']
  }
}
