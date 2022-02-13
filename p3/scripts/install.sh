
#create cluster
 k3d cluster create yelazrakCluster  -p 8080:80@server:0 -p 8888:8888@server:0  --wait


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


#get password
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


