export PRJ_ID=mitac-cp300-taipei101
export CLUSTER_NAME=workshop

gcloud --project=$PRJ_ID compute firewall-rules \
    create $CLUSTER_NAME-node-80 \
    --allow tcp:80 \
    --target-tags k8s-$CLUSTER_NAME-node


