# GKE Wordpress範例

GKE = Google Container Engine，為Google提供給Docker instance執行的一個Cluster環境。下面是官網所實作的GKE環境執行Wordpress image的一篇文章。

## 原文出處

* 預先設定：https://cloud.google.com/container-engine/docs/before-you-begin#enable_the_api
* Wordpress建立說明：https://cloud.google.com/container-engine/docs/hello-wordpress

## 執行步驟

建立的部分，依照step1.sh~step4.sh直行即可，試驗完成後，如果要清除資源，可以使用clear.sh清除環境。

* step1.sh: 建立GKE cluster 
* step2.sh: 設定該cluster下的一些gcloud用到的環境
* step3.sh: 建立wordpress pods
* step4.sh: 建立firewall rule
* clear.sh: 將建立完成的環境砍掉

