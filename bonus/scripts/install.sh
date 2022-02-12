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

sudo apt-get install docker-ce docker-ce-cli containerd.io


sudo usermod -aG docker $USER

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

k3d cluster create zchatouaCluster

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm repo add gitlab https://charts.gitlab.io/


helm upgrade --install gitlab gitlab/gitlab -f /vagrant/values.yaml -n gitlab

kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' -n gitlab | base64 --decode ; echo

kubectl port-forward svc/gitlab-webservice-default -n gitlab 8181:8181 --address="0.0.0.0" >/dev/null 2>&1 &
kubectl port-forward svc/gitlab-gitlab-shell -n gitlab 32022:32022 --address="0.0.0.0"  >/dev/null 2>&1 &
