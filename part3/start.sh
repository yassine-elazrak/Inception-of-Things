k3d cluster create --api-port 6550 -p "8081:80@loadbalancer" --agents 2

kubectl apply -f ingress.yaml 
kubectl apply -f install -n argocd 

