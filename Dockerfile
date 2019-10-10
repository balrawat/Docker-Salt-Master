#
# Salt Stack Salt Master Container
#

FROM ubuntu:18.04
MAINTAINER Balvinder <bal.rawat@gmail.com>

# Update System
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Add PPA

RUN apt-get install -y software-properties-common dmidecode
RUN echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/2019.2 bionic main" >> /etc/apt/sources.list.d/saltstack.list

RUN apt-get update

# Install Salt

RUN apt-get install -y salt-master salt-minion

# Volumes

VOLUME ['/etc/salt/pki', '/var/cache/salt', '/var/logs/salt', '/etc/salt/master.d', '/srv/salt']

# Add Run File

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Ports

EXPOSE 4505 4506

# Run Command

CMD "/usr/local/bin/run.sh"
