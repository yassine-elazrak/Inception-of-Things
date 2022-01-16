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
# sudo reboot now
# # install k3d
# echo "installing k3d..."
# curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# # create k3d cluster
# k3d cluster create mycluster
# #install kubectl and k3d
echo "installing kubectl and k3d..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl