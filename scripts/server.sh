# systemctl stop firewalld
# systemctl disable firewalld
curl -sfL https://get.k3s.io | sh -s - server --write-kubeconfig-mode 644 #--node-ip 13.37.234.183 #$1 

echo "alias k=\"k3s kubectl\"" >> ~/.bashrc
source ~/.bashrc
# k3s kubectl wait node/server --for=condition=Ready