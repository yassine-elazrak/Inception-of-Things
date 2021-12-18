yum -y remove podman
yum -y remove containers-common


###install docker 
# https://docs.docker.com/engine/install/centos/

### install kubctl
#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
kubectl port-forward redis-master-765d459796-258hz 7000:6379

# ssh -- -L 31526:localhost:31526
# vagrant ssh -- -L 31526:localhost:31526 