#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo snap install microk8s --classic
sudo microk8s enable dashboard dns registry istio
sudo microk8s kubectl get all --all-namespaces

echo "alias kubectl='sudo microk8s kubectl'" | sudo tee -a /home/$USER/.bash_aliases
source /home/$USER/.bash_aliases

KUBECONFIG=`ls /var/snap/microk8s/$(ls /var/snap/microk8s/ | grep [0000-9999])/credentials/client.config`
sudo cp $KUBECONFIG /home/$USER/kubeconfig
