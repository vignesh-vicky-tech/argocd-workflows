# echo 'Check microk8s status'
# sudo microk8s status --wait-ready

# sleep 10

# echo 'which microk8s -> ' which microk8s

# echo 'PATH -> ' $PATH

kubectl get nodes

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort", "ports": [{"nodePort": 32145, "port": 80}]}}'

kubectl get svc -n argocd -o wide    
            
hostname -I

curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
            
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
            
rm argocd-linux-amd64

echo 'Waiting for Argocd pods to be running for 90 secs'

sleep 90
