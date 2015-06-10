# GKE Guestbook範例

GKE = Google Container Engine，為Google提供給Docker instance執行的一個Cluster環境。下面是官網所實作的GKE環境執行Guestbook的一篇文章。在該文中，透過K8S的Service, Repication Controller, Pods之間的運作關係，讓我們可以更清楚如何在K8S中建置更彈性的服務。

## 原文出處

* 預先設定：https://cloud.google.com/container-engine/docs/before-you-begin#enable_the_api
* 官方建立說明：https://cloud.google.com/container-engine/docs/tutorials/guestbook

## 執行步驟

建立的部分，依照step*.sh直行即可，試驗完成後，如果要清除資源，可以使用clear.sh清除環境。

### Configure files

* redis-master-pod.json : 建立redis master pod的設定檔 
* redis-master-service.json : 建立redis master service的設定檔
* redis-worker-controller.json : 建立redis slave的設定檔，透過controller讓slave server可以auto replicate
* redis-worker-service.json : 建立redis worker service，將redis slave以service封裝
* guestbook-controller.json : 建立guestbook replication controller，並指定Container預計使用的template
* guestbook-service.json : 建立guestbook的service封裝

### Steps

建立GKE cluster
* step1-create-gke-cluster.sh

建立redis master
* step2-create-redis-master-pod.sh
* step3-create-redis-master-service.sh

建立redis slave
* step4-create-redis-worker-controller.sh
* step5-create-redis-worker-service.sh

建立guestbook application server
* step6-create-guestbook-controller.sh
* step7-create-guestbook-service.sh

設定GKE外部防火牆
* step8-create-gce-firewall.sh

## 附註

如果您的GKE是透過Web Console建立，kubectl指令與GKE之間需要做個鏈結的動作，可以參考：https://cloud.google.com/container-engine/docs/before-you-begin#pass_credentials_to_kubectl

```
$ gcloud alpha container get-credentials
    [--zone ZONE] [--cluster CLUSTER_NAME]
```
