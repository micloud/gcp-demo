#!/bin/bash
kubectl delete rc/guestbook-controller
kubectl delete services/guestbook
kubectl delete rc/redis-worker-controller
kubectl delete services/redis-worker
kubectl delete services/redis-master
kubectl delete pods/redis-master

sleep 5

gcloud alpha container clusters delete guestbook -q
