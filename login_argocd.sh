export PSWD=$(sudo microk8s kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 --decode)

export HOST=$(hostname -I | awk '{print $1}')
            
sudo argocd login $HOST:32145 --username admin --password $PSWD --insecure

echo 'Fetching argocd version'
sudo argocd version
