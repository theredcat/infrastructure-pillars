### Installing a salt-sculpture from scratch

This a ssume you're using Debian Jessie for all your hypervisors and VM

## Notes

In this readme, used domains are from nodster.cloud. Replace all domains with your owns.

Servers naming convention is : <server-name>-<numeric-id>.<env>.<datacenter>.<domain>
  - <server-name> is : [a-z0-9-]+
  - <numeric-id> is : [0-9]+ 
  - <env> is : [a-z0-9-]+
  - <datacenter> is : [a-z0-9-]+
  - <domain> is : a domain (obviously) 

## Setup database

We're going to use a redis database. To setup the first minion, you can get a redis database for free here : https://redislabs.com/pricing/redis-cloud/. 

Here is few reasons why this choise was made in this tutorial : 
  - It's a free 30mb redis database, which is plenty of room to store few IP adresses to bootstrap your infrastructure.
  - You won't have more than 30mb of data soon (we'll use it for hypervisor=>vm mapping + ip adresses)
  - Redis is easy to migrate to your own database
  - When your master will be up and running, this database will be regenerable from mine data

## Provide initial data
First you need to connect to you redis and populate it with startup data :

<code>
redis-cli -h redis-host.cloud.redislabs.com -p your_port -a your_password
redis-host.cloud.redislabs.com:your_port> hset lxc:hypervisor-01.infra.fr1.nodster.cloud salt-01.infra.fr2.nodster.cloud '{"memory":"512m", "cpu":1, "disk": "10G"}'
</code>

## Setup first hypervisor
Since this is for installing a infrastructure from scratch, we supose that you just have an empty server with debian installed

First run this to setup minimal bootstrap configuration:
<code>
wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub |apt-key add -
echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" >> /etc/apt/sources.list
apt-get install salt-minion python-git python-redis
cat <<EOF > /etc/salt/minion
file_client: local

file_roots:
  base:
    - /srv/salt-master/

fileserver_backend:
  - git

gitfs_remotes:
  - https://github.com/theredcat/infrastructure-pillars.git

grains:
  roles:
    - hypervisor
  datacenter: fr2
EOF
</code>