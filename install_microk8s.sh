#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo snap install microk8s --classic
sudo microk8s enable dashboard dns registry istio
sudo microk8s kubectl get all --all-namespaces

echo "alias kubectl='sudo microk8s kubectl'" | sudo tee -a /home/$USER/.bash_aliases
source /home/$USER/.bash_aliases
