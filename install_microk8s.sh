#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo snap install microk8s --classic
sudo microk8s enable dashboard dns registry istio
sudo microk8s kubectl get all --all-namespaces

#echo "alias kubectl='sudo microk8s kubectl'" | sudo tee -a /home/$USER/.bash_aliases
#source /home/$USER/.bash_aliases

sudo microk8s config > /home/$USER/kubeconfig

# Install Kubectl

sudo apt-get install -y ca-certificates curl
sudo apt-get install -y apt-transport-https
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
