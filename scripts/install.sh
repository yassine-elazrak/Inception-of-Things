kubectl apply -f  deploy.yaml
kubectl apply -f  service.yaml 
kubectl apply -f  ingress.yaml

kubectl wait --for=condition=Ready pods --all 