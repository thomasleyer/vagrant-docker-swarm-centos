#!/bin/bash


MANAGER_IP=$1

yum install docker -y
sed -i 's/true/false/g' /etc/docker/daemon.json
systemctl daemon-reload
systemctl start docker
gpasswd -a vagrant docker
docker swarm init --listen-addr ${MANAGER_IP}:2377 --advertise-addr ${MANAGER_IP}
docker swarm join-token -q worker > /vagrant/worker_token

