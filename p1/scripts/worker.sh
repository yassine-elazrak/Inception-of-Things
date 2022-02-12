curl -sfL https://get.k3s.io | sh -s - agent --server https://$1:6443 --token-file /vagrant/shared/node-token --node-ip $2
echo "alias k=\"kubectl\"" >> ~/.bashrc
source ~/.bashrc
