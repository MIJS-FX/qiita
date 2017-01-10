#CallAzureAPI.R 
# MT4のデータフォルダ AzureのAPIキー は個別に環境設定が必要です。

#install.packages("RCurl", dependencies = TRUE)
#install.packages("rjson", dependencies = TRUE)

library("RCurl")
library("rjson")

# Accept SSL certificates issued by public Certificate Authorities
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

h = basicTextGatherer()
hdr = basicHeaderGatherer()

setwd("C:\\Users\\sisco\\AppData\\Roaming\\MetaQuotes\\Terminal\\FCCD626CCEAFA0C866593963E6A400F0\\MQL4\\Files")             # 作業ディレクトリを変更する
#setwd("c:\\Test_ORJ\\data")             # 作業ディレクトリを変更する
getwd()                     # 現在の作業ディレクトリを確認する# 複数のデータファイルを一括してリストに読み込む

f1<-file("GBPJPY_REAL3.csv","r")
f2<-file("GBPJPY_REAL2.csv","w")
i <- 0
dt_line<-readLines(f1)
for(i in 1:2){
  #write(dt_line[i],file="GBPJPY_REAL2.csv",append=TRUE)
  Tmp1<-dt_line[i]
  cat(paste(Tmp1,"\n",sep=""), file=f2, append=TRUE)
}
close(f1)
close(f2)

dt_test <- read.table("GBPJPY_REAL2.csv", header=T, sep=",")
#dt_test <- read.table("GBPJPY_REAL3.csv", header=T, sep=",")
nrow_dt_test   <- nrow(dt_test)


for (i in 1:nrow_dt_test) {
  req = list(
    
    Inputs = list(
      
      
      "input2" = list(
        "ColumnNames" = list("V3", "V4", "V5", "V6", "V3.1", "V4.1", "V5.1", "V6.1", "V3.2", "V4.2", "V5.2", "V6.2", "V3.3", "V4.3", "V5.3", "V6.3", "V3.5", "V4.5", "V5.5", "V6.5", "V3.6", "V4.6", "V5.6", "V6.6", "V3.7", "V4.7", "V5.7", "V6.7", "V3.8", "V4.8", "V5.8", "V6.8", "V3.10", "V4.10", "V5.10", "V6.10", "V3.11", "V4.11", "V5.11", "V6.11", "V3.12", "V4.12", "V5.12", "V6.12", "V3.13", "V4.13", "V5.13", "V6.13"),
        "Values" = list( list( dt_test$V3[i],dt_test$V4[i],dt_test$V5[i],dt_test$V6[i],dt_test$V3.1[i],dt_test$V4.1[i],dt_test$V5.1[i],dt_test$V6.1[i],dt_test$V3.2[i],dt_test$V4.2[i],dt_test$V5.2[i],dt_test$V6.2[i],dt_test$V3.3[i],dt_test$V4.3[i],dt_test$V5.3[i],dt_test$V6.3[i],dt_test$V3.5[i],dt_test$V4.5[i],dt_test$V5.5[i],dt_test$V6.5[i],dt_test$V3.6[i],dt_test$V4.6[i],dt_test$V5.6[i],dt_test$V6.6[i],dt_test$V3.7[i],dt_test$V4.7[i],dt_test$V5.7[i],dt_test$V6.7[i],dt_test$V3.8[i],dt_test$V4.8[i],dt_test$V5.8[i],dt_test$V6.8[i],dt_test$V3.10[i],dt_test$V4.10[i],dt_test$V5.10[i],dt_test$V6.10[i],dt_test$V3.11[i],dt_test$V4.11[i],dt_test$V5.11[i],dt_test$V6.11[i],dt_test$V3.12[i],dt_test$V4.12[i],dt_test$V5.12[i],dt_test$V6.12[i],dt_test$V3.13[i],dt_test$V4.13[i],dt_test$V5.13[i],dt_test$V6.13[i] )  )
      ),         
      "input1" = list(
        "ColumnNames" = list("V3", "V4", "V5", "V6", "V3.1", "V4.1", "V5.1", "V6.1", "V3.2", "V4.2", "V5.2", "V6.2", "V3.3", "V4.3", "V5.3", "V6.3", "V3.5", "V4.5", "V5.5", "V6.5", "V3.6", "V4.6", "V5.6", "V6.6", "V3.7", "V4.7", "V5.7", "V6.7", "V3.8", "V4.8", "V5.8", "V6.8", "V3.10", "V4.10", "V5.10", "V6.10", "V3.11", "V4.11", "V5.11", "V6.11", "V3.12", "V4.12", "V5.12", "V6.12", "V3.13", "V4.13", "V5.13", "V6.13"),
        "Values" = list( list( dt_test$V3[i],dt_test$V4[i],dt_test$V5[i],dt_test$V6[i],dt_test$V3.1[i],dt_test$V4.1[i],dt_test$V5.1[i],dt_test$V6.1[i],dt_test$V3.2[i],dt_test$V4.2[i],dt_test$V5.2[i],dt_test$V6.2[i],dt_test$V3.3[i],dt_test$V4.3[i],dt_test$V5.3[i],dt_test$V6.3[i],dt_test$V3.5[i],dt_test$V4.5[i],dt_test$V5.5[i],dt_test$V6.5[i],dt_test$V3.6[i],dt_test$V4.6[i],dt_test$V5.6[i],dt_test$V6.6[i],dt_test$V3.7[i],dt_test$V4.7[i],dt_test$V5.7[i],dt_test$V6.7[i],dt_test$V3.8[i],dt_test$V4.8[i],dt_test$V5.8[i],dt_test$V6.8[i],dt_test$V3.10[i],dt_test$V4.10[i],dt_test$V5.10[i],dt_test$V6.10[i],dt_test$V3.11[i],dt_test$V4.11[i],dt_test$V5.11[i],dt_test$V6.11[i],dt_test$V3.12[i],dt_test$V4.12[i],dt_test$V5.12[i],dt_test$V6.12[i],dt_test$V3.13[i],dt_test$V4.13[i],dt_test$V5.13[i],dt_test$V6.13[i] )  )
      ),         
      "input3" = list(
        "ColumnNames" = list("V3", "V4", "V5", "V6", "V3.1", "V4.1", "V5.1", "V6.1", "V3.2", "V4.2", "V5.2", "V6.2", "V3.3", "V4.3", "V5.3", "V6.3", "V3.5", "V4.5", "V5.5", "V6.5", "V3.6", "V4.6", "V5.6", "V6.6", "V3.7", "V4.7", "V5.7", "V6.7", "V3.8", "V4.8", "V5.8", "V6.8", "V3.10", "V4.10", "V5.10", "V6.10", "V3.11", "V4.11", "V5.11", "V6.11", "V3.12", "V4.12", "V5.12", "V6.12", "V3.13", "V4.13", "V5.13", "V6.13"),
        "Values" = list( list( dt_test$V3[i],dt_test$V4[i],dt_test$V5[i],dt_test$V6[i],dt_test$V3.1[i],dt_test$V4.1[i],dt_test$V5.1[i],dt_test$V6.1[i],dt_test$V3.2[i],dt_test$V4.2[i],dt_test$V5.2[i],dt_test$V6.2[i],dt_test$V3.3[i],dt_test$V4.3[i],dt_test$V5.3[i],dt_test$V6.3[i],dt_test$V3.5[i],dt_test$V4.5[i],dt_test$V5.5[i],dt_test$V6.5[i],dt_test$V3.6[i],dt_test$V4.6[i],dt_test$V5.6[i],dt_test$V6.6[i],dt_test$V3.7[i],dt_test$V4.7[i],dt_test$V5.7[i],dt_test$V6.7[i],dt_test$V3.8[i],dt_test$V4.8[i],dt_test$V5.8[i],dt_test$V6.8[i],dt_test$V3.10[i],dt_test$V4.10[i],dt_test$V5.10[i],dt_test$V6.10[i],dt_test$V3.11[i],dt_test$V4.11[i],dt_test$V5.11[i],dt_test$V6.11[i],dt_test$V3.12[i],dt_test$V4.12[i],dt_test$V5.12[i],dt_test$V6.12[i],dt_test$V3.13[i],dt_test$V4.13[i],dt_test$V5.13[i],dt_test$V6.13[i] )  )
      )                ),
    GlobalParameters = setNames(fromJSON('{}'), character(0))
  )
  
  body = enc2utf8(toJSON(req))
  api_key = "ここにAzureのAPIKeyをいれてください" # Replace this with the API key for the web service
  authz_hdr = paste('Bearer', api_key, sep=' ')
  
  h$reset()
  curlPerform(url = "https://asiasoutheast.services.azureml.net/workspaces/dd957fd2dd4b49c4b3078b9c3e6e8aab/services/824f2c5eee6744cf9563c71a4e244e32/execute?api-version=2.0&details=true",
              httpheader=c('Content-Type' = "application/json", 'Authorization' = authz_hdr),
              postfields=body,
              writefunction = h$update,
              headerfunction = hdr$update,
              verbose = FALSE
  )
  
  headers = hdr$value()
  httpStatus = headers["status"]
  if (httpStatus >= 400)
  {
    #print(paste("The request failed with status code:", httpStatus, sep=" "))
    
    # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
    #print(headers)
  }
  
  #print("Result:")
  result = h$value()
  #print(fromJSON(result))
  list_result <- fromJSON(result)
  out_result<-c(as.double(list_result$Results$output1$value$Values[[1]][1:2]),as.double(list_result$Results$output2$value$Values[[1]][1]),as.double(list_result$Results$output3$value$Values[[1]][1]))
  out_action <- "STAY"
  if(out_result[1]-out_result[2]>0 & out_result[1]-out_result[3]>0 & out_result[1]-out_result[4]>0){out_action<-"SELL"}
  if(out_result[1]-out_result[2]<0 & out_result[1]-out_result[3]<0 & out_result[1]-out_result[4]<0){out_action<-"BUY"}

  #out_action <- "BUY"

  out_result_str <- out_result
  mode(out_result_str) <- "character"
  out_result_str[5] <- out_action
  print(out_result_str)
  #out_result_dt<- data.frame(t(out_result_str))
  (today <- Sys.time()) 
  cat(format(today,"%Y-%m-%d %H:%M:%S," ),sep=",", file = "GBPJPY_RESULT_VALUE.txt", append = TRUE)
  cat(out_result_str,sep=",", file = "GBPJPY_RESULT_VALUE.txt", append = TRUE)
  cat("\n",sep="",file="GBPJPY_RESULT_VALUE.txt", append = TRUE)
  cat(out_action, file = "GBPJPY_RESULT.txt", append = FALSE)
}

