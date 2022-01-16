# # yum -y remove podman
# # yum -y remove containers-common

# # sudo apt-get update -y && sudo apt-get upgrade -y
# # sudo apt-get install -y git
# # # start docker
# # echo "starting docker..."
# # sudo apt install -y docker.io
# # # #add user to docker group
# # sudo usermod -aG docker $USER
# # sudo systemctl enable docker
# # sudo systemctl start docker
# # # start docker-compose
# # echo "starting docker-compose ..."
# # sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# # sudo chmod +x /usr/local/bin/docker-compose
# # sudo docker-compose --version
# # # install make
# # echo "installing make..."
# # sudo apt install -y make
# # sudo apt install -y make-guile
# # sudo reboot now
# # # install k3d
# # echo "installing k3d..."
# # curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# # ###install docker 
# # # https://docs.docker.com/engine/install/centos/

# # ### install kubctl
# # #https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
# # kubectl port-forward redis-master-765d459796-258hz 7000:6379

# # # ssh -- -L 31526:localhost:31526
# # # vagrant ssh -- -L 31526:localhost:31526 

# #!/bin/bash

# echo "update packages..."

# sudo apt-get update -y && sudo apt-get upgrade -y
# sudo apt-get install -y git
# # start docker
# echo "starting docker..."
# sudo apt install -y docker.io
# # #add user to docker group
# sudo usermod -aG docker $USER
# sudo systemctl enable docker
# sudo systemctl start docker
# # start docker-compose
# echo "starting docker-compose ..."
# sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose
# sudo docker-compose --version
# # install make
# echo "installing make..."
# sudo apt install -y make
# sudo apt install -y make-guile
# #install k3d 

# curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
# #install kubectl 
# curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
# kubectl version --client
# sudo systemctl enable docker
# sudo systemctl restart docker
# sudo systemctl enable k3d
# sudo systemctl restart k3d
#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

## Installing curl

sudo apt install curl -y

## Installing Docker

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
# sudo systemctl start docker
# sudo groupadd docker
sudo usermod -aG docker $(whoami)

## Installing Kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin

## K3d

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

echo "Installing the auto-completion scripts for k3d"
echo "source <(k3d completion bash)" >> ~/.bashrc

echo "..::OK::.."
