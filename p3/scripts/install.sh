
#create cluster
 k3d cluster create dev-cluster --api-port 6443 -p 80:80@loadbalancer --agents 1 --wait

#create namespace argocd dev
 kubectl create namespace argocd
 kubectl create namespace dev

#install argocd
 kubectl apply -f  install.yaml -n argocd 
 kubectl wait --for=condition=Ready pods --all -n argocd

## ingress
 kubectl apply -f  ingress.yaml -n argocd 
 kubectl wait --for=condition=Ready pods --all -n argocd

##  run application
 kubectl apply -f application.yaml -n argocd
 kubectl wait --for=condition=Ready pods --all -n argocd
##   k3d cluster delete --all
##  k3d cluster delete --all

#get password
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


