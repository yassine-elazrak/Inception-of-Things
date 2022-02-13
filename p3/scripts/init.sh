# # # yum -y remove podman
# # # yum -y remove containers-common

# ##install docker
# sudo yum install -y docker
# sudo systemctl enable docker
# sudo systemctl restart  docker
# sudo setfacl -m user:$USER:rw /var/run/docker.sock

# ## Installing Kubectl

# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# chmod +x kubectl
# sudo mv ./kubectl /usr/local/bin

# ## Installing k3d
# curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
# echo "source <(k3d completion bash)" >> ~/.bashrc

# echo "..::OK::.."

sudo apt-get remove docker docker-engine docker.io containerd runc 

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io -y


sudo usermod -aG docker $USER

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash


