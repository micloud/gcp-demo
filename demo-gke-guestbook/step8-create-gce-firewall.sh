#!/bin/bash
gcloud compute firewall-rules create guestbook-node-3000 --allow=tcp:3000 \
	    --target-tags k8s-guestbook-node
