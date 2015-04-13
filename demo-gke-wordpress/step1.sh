export CLUSTER_NAME=workshop
export INST_SIZE=2
export TYPE=g1-small
export ZONE=asia-east1-c

gcloud alpha \
  container clusters create $CLUSTER_NAME \
  --num-nodes $INST_SIZE \
  --machine-type $TYPE \
  --zone $ZONE

