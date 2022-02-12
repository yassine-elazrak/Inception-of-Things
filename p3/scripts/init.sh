# # yum -y remove podman
# # yum -y remove containers-common

##install docker
sudo yum install -y docker
sudo systemctl enable docker
sudo setfacl -m user:$USER:rw /var/run/docker.sock

## Installing Kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin

## Installing k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
echo "source <(k3d completion bash)" >> ~/.bashrc

echo "..::OK::.."


