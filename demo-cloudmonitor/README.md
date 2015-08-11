# Cloud Monitor Get Network Metrics Demo

這是一個透過Cloud Monitor來取出某個專案在某個時間範圍內的網路傳出流量的範例(sent_bytes_count)，他只是個html檔案，透過Oauth2的三方認證來使用您的權限以取出流量資料...

## 使用前

* 您必須先有Google Cloud Platform專案
* 您必須在專案內申請Service Account，並且在Service Account的Callback URL中設定您返回server的位置，例如：您的服務跑在http://localhost:8888的話，則需要在Service Account的JavaScript Origins填上http://localhost:8888
* 您必須先行修改該html內的相關專案與Service Account資訊，以符合您的使用

## 操作說明

專案資料夾是web，這是個node.js的專案，使用時切換到該目錄下，執行：

```
npm istall
```

然後透過下面方式啟動專案：

```
npm start
```

然後連線http://localhost:8888/sample.html來執行這個網頁...

網頁連上後，如果瀏覽器尚未通過Oauth2的認證，則會出現認證的按鈕，讓您點選，點選後完成認證，則頁面會出現所撈回來的資料...
