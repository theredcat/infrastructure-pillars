#!mako|yaml
base:
  '*':
    - generic.general
    - provider.interfaces
    - datacenter.${grains['datacenter']}

  'virtual:lxc':
    - match: grains
    - generic.vm.lxc
  'virtual:kvm':
    - match: grains
    - generic.vm.kvm

  'roles:salt-master':
    - match: grains
    - infra.salt-master

