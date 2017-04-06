#!/bin/bash


MANAGER_IP=$1
NODE_IP=$2
TOKEN=`cat /vagrant/worker_token`

yum install docker -y
sed -i 's/true/false/g' /etc/docker/daemon.json
systemctl daemon-reload
systemctl start docker
gpasswd -a vagrant docker
docker swarm join --listen-addr ${NODE_IP}:2377 --advertise-addr ${NODE_IP} --token=$TOKEN ${MANAGER_IP}:2377


