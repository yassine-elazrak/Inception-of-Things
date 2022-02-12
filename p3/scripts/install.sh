
#create cluster
sudo k3d cluster create dev-cluster --api-port 6443 -p 80:80@loadbalancer --agents 1 --wait

#create namespace argocd dev
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

#install argocd
sudo kubectl apply -f  install.yaml -n argocd 
sudo kubectl wait --for=condition=Ready pods --all -n argocd

## ingress
sudo kubectl apply -f  ingress.yaml -n argocd 
sudo kubectl wait --for=condition=Ready pods --all -n argocd

##  run application
sudo kubectl apply -f application.yaml -n argocd
sudo kubectl wait --for=condition=Ready pods --all -n argocd
## sudo  k3d cluster delete --all
##sudo  k3d cluster delete --all

