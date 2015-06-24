export PRJ_ID=mitac-cp300-taipei101
export CLUSTER_NAME=workshop

gcloud --project=$PRJ_ID beta container clusters delete $CLUSTER_NAME
gcloud --project=$PRJ_ID compute firewall-rules delete ${CLUSTER_NAME}-node-80
