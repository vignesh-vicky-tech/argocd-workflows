

export HOST=$(hostname -I | awk '{print $1}')
            
sudo argocd login $HOST:32145 --username admin --password Password@1 --insecure

echo 'Fetching argocd version'
sudo argocd version
