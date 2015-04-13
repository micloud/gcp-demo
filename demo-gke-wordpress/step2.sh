export PRJ_ID=mitac-cp300-taipei101
export CLUSTER_NAME=workshop
export ZONE=asia-east1-c

export KUBECONFIG=$HOME/.config/gcloud/kubernetes/kubeconfig
kubectl config use-context gke_${CLUSTER_NAME}_${ZONE}_${CLUSTER_NAME}

gcloud config set container/cluster $CLUSTER_NAME 
gcloud config set compute/zone $ZONE

