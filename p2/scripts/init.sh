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
sudo yum update -y
sudo yum upgrade -y

## Installing curl

sudo yum install curl -y
sudo yum install net-tools -y


## Installing Kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/bin/kubectl

