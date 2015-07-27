#!/bin/bash
export PROJECT=mitac-cp300-taipei101
export DATASET=sample
export TABLE=apache_log
export GCS_BUCKET=gs://my-bucket-test
export SCHEMA=IP:STRING,DNS:STRING,TS:STRING,URL:STRING
export FOLDER=./files
export BACKUP=./backup
# Test db

if [ `bq ls $DATASET | grep "Not found" | wc -l` = "1" ] ; then
	echo "dataset not found..."
	bq mk $DATASET
fi

if [ `bq ls $DATASET | grep $TABLE | wc -l` = "0" ] ; then
	echo "table not found..."
	bq mk $DATASET.$TABLE $SCHENA
fi


for name in `ls $FOLDER` ; do
gsutil cp $FOLDER/$name $GCS_BUCKET && \
	bq load $PROJECT:$DATASET.$TABLE $GCS_BUCKET/$name $SCHEMA && \
	mv $FOLDER/$name $BACKUP 
done
