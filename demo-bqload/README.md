# BigQuery demo - 上傳CSV檔案到BigQuery

此部分範例教大家如何上傳一份CSV文件到BigQuery，在這邊我們透過Google Cloud Storage作暫存，然後再load到BigQuery的儲存裝置，過程中需要定義CSV文件的Schema...

## 上載單一檔案

### 準備

* 您需要有Google Cloud Project，並且已經安裝好Google Cloud SDK
* 檔案說明：
  * sample.csv: 這是逗號隔開的CSV文件，為預計要上傳得資料格式
  * load-sample.sh: 這事載入資料的Shell腳本，使用前請先修改export部分為您的環境

### 步驟說明

建立Dataset  

```
  bq mk $DATASET
``` 

建立Table

``` 
bq mk $DATASET.$TABLE
```

當dataset與table都沒有問題之後，接下來就可以把資料上傳到cloud storage

```
gsutil cp $FILE $GCS_BUCKET
```

在上傳cloud storage之後，就可以透過bq load將資料從cloud storage上傳到bigquery

```
bq load $PROJECT:$DATASET.$TABLE $GCS_BUCKET/$FILE $SCHEMA 
```

### 執行

```
bash -x load-sample.sh
```

## 上載多個檔案

承上，我們可以改寫load-sample.sh來一次讀一個資料夾，我們假設資料都放在files目錄下，當處理完成，我們就把檔案搬到backup目錄下，然後把程式改成：

```
for name in `ls $FOLDER` ; do
gsutil cp $FOLDER/$name $GCS_BUCKET && \
	bq load $PROJECT:$DATASET.$TABLE $GCS_BUCKET/$name $SCHEMA && \
	mv $FOLDER/$name $BACKUP
done
```

### 執行

```
bash -x load-folder.sh
```

## 其他參考：

除了使用Shell，當然有許多的程式可以輔助資料的上傳，這邊蒐集一些範例，給大家參考：

* Java Sample: https://github.com/GoogleCloudPlatform/bigquery-samples-java
* Python Sample: https://github.com/GoogleCloudPlatform/kubernetes-bigquery-python
* Fluentd Sample: https://github.com/GoogleCloudPlatform/bigquery-fluentd-docker-sample
* Fluentd Sample (中文): http://peihsinsu.gitbooks.io/fluentd-in-action/content/google_bigquery_output.html
