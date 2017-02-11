dns:
  main_interface: eth0
admin_email: contact@nathan-delhaye.fr
timezone: Europe/Paris
salt:
  minion_version: 2016.11.2+ds-1
packages:
  htop:
  telnet:
  file:
  iputils-ping:
  dnsutils:
  mtr-tiny:
  ntpdate:
  ntp:
  nano:
  nload:
  lsof:
  strace:
  ltrace:
  curl:
  wget:
  tcpdump:
  iotop:
  bzip2:
  sysstat:
  unzip:
  unrar:

servers:
  ssh:
    ports:
      main: 22

users:
  ndelhaye:
    sudo: True
    keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfGspMpZCtE8Qt7PIQuRg7IbrFT0IJ9+KvtbS34XlI74vZnPBP8RUyy2US7emYBUdhQsv5zEeck6I+LwzzM92jN9Yr2NNhY91X/t2Q1omkvN99qTOSXw8bq+f87CwO6WScMHPE3M8xu9Vc+eiTelAxlrYs4CkI+UYPOBYOluR2NeobICQz9G0B/u/b9FKQkHsi8A52bg50mHdraQ0XoaPR6q7c4Teq2pqrord9nkLqWk0sm4iBj72MNLF/UPt8yo+2KHlTZ+mCd5gfm56rUO7K62Hg9EscYstpB1bbKFuxOt7t5SfFD57cWz8nMJE/5+QOjqxx5YNlrJGHfOzLktfp

firewall:
  allow_output:
    - service
    - nat
    - public
    - management
  ips:

mine_functions:
  grains.get: [nodename]
  network.ip_addrs: []
