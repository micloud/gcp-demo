#!/bin/bash
kubectl delete rc/frontend
kubectl delete services/frontend
kubectl delete rc/redis-worker-controller
kubectl delete services/redis-worker
kubectl delete services/redis-master
kubectl delete pods/redis-master

sleep 5

gcloud beta container clusters delete guestbook -q
