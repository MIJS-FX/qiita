# CreateDataForAzureML
# 15分足、60分足、4時間足のCSVデータから
# Azule MLで利用するためのデータ（教師用・テスト用兼）を作成する。

setwd("c:\\Test_ORJ\\data")             # 作業ディレクトリを変更する
getwd()                     # 現在の作業ディレクトリを確認する# 複数のデータファイルを一括してリストに読み込む

table_all <- data.frame()

# 読み込んだcsvをマージする
table_ashi15 <- read.table("GBPJPY15.csv", header=F, sep=",")
table_ashi60 <- read.table("GBPJPY60.csv", header=F, sep=",")
table_ashi240 <- read.table("GBPJPY240.csv", header=F, sep=",")
table_ashicur <- read.table("GBPJPY_CURRENT.csv", header=T, sep=",") # current
nrow_ashi15   <- nrow(table_ashi15)
nrow_ashi60   <- nrow(table_ashi60)
nrow_ashi240 <- nrow(table_ashi240)
nrow_ashicur <- nrow(table_ashicur)
i15 <- 0
i60 <- 0
i240 <- 0
# # 空行テーブル
line_ashi_empty=data.frame("","",0,0,0,0,0)
names(line_ashi_empty) <- c("V1","V2","V3","V4","V5","V6","V7")
# b 前 a 未来
for(i15 in 1:nrow_ashi15){
  #for(i15 in 1:300){
  # どれか１つでも値が取得できない場合は行を作成しない
  is_line_create15 <- 1 #true
  
  line_ashi15   <- if(i15>0){ table_ashi15[c(i15), ]} else {is_line_create15 <- 0;line_ashi_empty}
  line_ashi15b3 <- if(i15-3>0){ table_ashi15[c(i15-3), ]} else {is_line_create15 <- 0;line_ashi_empty}
  line_ashi15b2 <- if(i15-2>0){ table_ashi15[c(i15-2), ]} else {is_line_create15 <- 0;line_ashi_empty}
  line_ashi15b1 <- if(i15-1>0){ table_ashi15[c(i15-1), ]} else {is_line_create15 <- 0;line_ashi_empty}
  line_ashi15a1 <- if(i15 != nrow_ashi15){ table_ashi15[c(i15+1), ]} else {is_line_create15 <- 0;line_ashi_empty}
  mod_temp <- i15 %% 4
  if (mod_temp == 1) {
    i60 <- i60 + 1
    is_line_create60 <- 1 #true
    line_ashi60   <- if(i60>0){ table_ashi60[c(i60), ]} else {is_line_create60 <- 0;line_ashi_empty}
    line_ashi60b3 <- if(i60-3>0){ table_ashi60[c(i60-3), ]} else {is_line_create60 <- 0;line_ashi_empty}
    line_ashi60b2 <- if(i60-2>0){ table_ashi60[c(i60-2), ]} else {is_line_create60 <- 0;line_ashi_empty}
    line_ashi60b1 <- if(i60-1>0){ table_ashi60[c(i60-1), ]} else {is_line_create60 <- 0;line_ashi_empty}
    line_ashi60a1 <- if(i60 != nrow_ashi60){ table_ashi60[c(i60+1), ]} else {is_line_create60 <- 0;line_ashi_empty}
  }
  #mod_temp <- i15 %% 96
  mod_temp <- i15 %% 16
  if (mod_temp == 1) {
    i240 <- i240 + 1
    is_line_create240 <- 1 #true
    line_ashi240   <- if(i240>0){ table_ashi240[c(i240), ]} else {is_line_create240 <- 0;line_ashi_empty}
    line_ashi240b3 <- if(i240-3>0){ table_ashi240[c(i240-3), ]} else {is_line_create240 <- 0;line_ashi_empty}
    line_ashi240b2 <- if(i240-2>0){ table_ashi240[c(i240-2), ]} else {is_line_create240 <- 0;line_ashi_empty}
    line_ashi240b1 <- if(i240-1>0){ table_ashi240[c(i240-1), ]} else {is_line_create240 <- 0;line_ashi_empty}
    line_ashi240a1 <- if(i240 != nrow_ashi240){ table_ashi240[c(i240+1), ]} else {is_line_create240 <- 0;line_ashi_empty}
  }
  # どの行も作られないことがない場合
  if (is_line_create15+is_line_create60+is_line_create240==3) {
    line_all <- data.frame(line_ashi15b3,line_ashi15b2,line_ashi15b1, line_ashi15,line_ashi15a1,
                           line_ashi60b3,line_ashi60b2,line_ashi60b1, line_ashi60,line_ashi60a1,
                           line_ashi240b3,line_ashi240b2,line_ashi240b1, line_ashi240,line_ashi240a1)
    #現在データに置き換え
    line_all$V4.8 <- table_ashicur[i15,"v60t"] #60分高値
    line_all$V5.8 <- table_ashicur[i15,"v60y"] 
    line_all$V6.8 <- table_ashicur[i15,"v60o"] 
    line_all$V4.13 <- table_ashicur[i15,"v24t"] 
    line_all$V5.13 <- table_ashicur[i15,"v24y"] 
    line_all$V6.13 <- table_ashicur[i15,"v24o"] 
    
    #平準化
    #double_genzai <- line_all$V6.3
    sabun <- line_all$V6.3-100
    line_all$V3 <- line_all$V3 - sabun
    line_all$V4 <- line_all$V4 - sabun
    line_all$V5 <- line_all$V5 - sabun
    line_all$V6 <- line_all$V6 - sabun
    line_all$V3.1 <- line_all$V3.1 - sabun
    line_all$V4.1 <- line_all$V4.1 - sabun
    line_all$V5.1 <- line_all$V5.1 - sabun
    line_all$V6.1 <- line_all$V6.1 - sabun
    line_all$V3.2 <- line_all$V3.2 - sabun
    line_all$V4.2 <- line_all$V4.2 - sabun
    line_all$V5.2 <- line_all$V5.2 - sabun
    line_all$V6.2 <- line_all$V6.2 - sabun
    line_all$V3.3 <- line_all$V3.3 - sabun
    line_all$V4.3 <- line_all$V4.3 - sabun
    line_all$V5.3 <- line_all$V5.3 - sabun
    line_all$V6.3 <- line_all$V6.3 - sabun
    line_all$V3.4 <- line_all$V3.4 - sabun
    line_all$V4.4 <- line_all$V4.4 - sabun
    line_all$V5.4 <- line_all$V5.4 - sabun
    line_all$V6.4 <- line_all$V6.4 - sabun
    line_all$V3.5 <- line_all$V3.5 - sabun
    line_all$V4.5 <- line_all$V4.5 - sabun
    line_all$V5.5 <- line_all$V5.5 - sabun
    line_all$V6.5 <- line_all$V6.5 - sabun
    line_all$V3.6 <- line_all$V3.6 - sabun
    line_all$V4.6 <- line_all$V4.6 - sabun
    line_all$V5.6 <- line_all$V5.6 - sabun
    line_all$V6.6 <- line_all$V6.6 - sabun
    line_all$V3.7 <- line_all$V3.7 - sabun
    line_all$V4.7 <- line_all$V4.7 - sabun
    line_all$V5.7 <- line_all$V5.7 - sabun
    line_all$V6.7 <- line_all$V6.7 - sabun
    line_all$V3.8 <- line_all$V3.8 - sabun
    line_all$V4.8 <- line_all$V4.8 - sabun
    line_all$V5.8 <- line_all$V5.8 - sabun
    line_all$V6.8 <- line_all$V6.8 - sabun
    line_all$V3.9 <- line_all$V3.9 - sabun
    line_all$V4.9 <- line_all$V4.9 - sabun
    line_all$V5.9 <- line_all$V5.9 - sabun
    line_all$V6.9 <- line_all$V6.9 - sabun
    line_all$V3.10 <- line_all$V3.10 - sabun
    line_all$V4.10 <- line_all$V4.10 - sabun
    line_all$V5.10 <- line_all$V5.10 - sabun
    line_all$V6.10 <- line_all$V6.10 - sabun
    line_all$V3.11 <- line_all$V3.11 - sabun
    line_all$V4.11 <- line_all$V4.11 - sabun
    line_all$V5.11 <- line_all$V5.11 - sabun
    line_all$V6.11 <- line_all$V6.11 - sabun
    line_all$V3.12 <- line_all$V3.12 - sabun
    line_all$V4.12 <- line_all$V4.12 - sabun
    line_all$V5.12 <- line_all$V5.12 - sabun
    line_all$V6.12 <- line_all$V6.12 - sabun
    line_all$V3.13 <- line_all$V3.13 - sabun
    line_all$V4.13 <- line_all$V4.13 - sabun
    line_all$V5.13 <- line_all$V5.13 - sabun
    line_all$V6.13 <- line_all$V6.13 - sabun
    line_all$V3.14 <- line_all$V3.14 - sabun
    line_all$V4.14 <- line_all$V4.14 - sabun
    line_all$V5.14 <- line_all$V5.14 - sabun
    line_all$V6.14 <- line_all$V6.14 - sabun
    #作成
    table_all <- rbind(table_all,line_all)
  }
  i15 <- i15 + 1
}
write.csv(table_all, "GBPJPYALL.csv", quote=F,row.names=F)
#table_ashi15 <- read.table("GBPJPY15.csv", header=F, sep=",")

#x <- read.table("GBPJPYALL.csv", header=T, sep=",")
#mean(x[,6])
