#!/bin/bash
export PROJECT=mitac-cp300-taipei101
export DATASET=sample
export TABLE=apache_log
export FILE=sample.csv
export GCS_BUCKET=gs://my-bucket-test
export SCHEMA=IP:STRING,DNS:STRING,TS:STRING,URL:STRING
# Test db

if [ `bq ls $DATASET | grep "Not found" | wc -l` = "1" ] ; then
	echo "dataset not found..."
	bq mk $DATASET
fi

if [ `bq ls $DATASET | grep $TABLE | wc -l` = "1" ] ; then
	echo "table not found..."
	bq mk $DATASET.$TABLE $SCHENA
fi

# Load data to cloud storage
gsutil cp $FILE $GCS_BUCKET

# Load data from storage to bigquery 
bq load $PROJECT:$DATASET.$TABLE $GCS_BUCKET/$FILE $SCHEMA
