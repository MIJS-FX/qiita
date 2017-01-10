# CreateCurrentData
# 現在値データは経過時間に適合したリアル時間の内容とする
# →過去チャートでは１５分単位に取得すると４時間後のデータが取得される。
# 例 12:15 の終値、４時間足の終値は本来12:15 の終値と同値であるが、過去データでは、16:00のデータが取れてしまう。
# 過去データを置き換えるために、現在値データを別途作成しておく

setwd("c:\\Test_ORJ\\data")             # 作業ディレクトリを変更する
getwd()                     # 現在の作業ディレクトリを確認する# 複数のデータファイルを一括してリストに読み込む

tableall <- data.frame()

table_ashi15 <- read.table("GBPJPY15.csv", header=F, sep=",")
nrow_ashi15   <- nrow(table_ashi15)
i15 <- 0
hajimene60 <- 0
takane60 <- 0
yasune60 <- 999
owarine60 <- 0
hajimene24 <- 0
takane24 <- 0
yasune24 <- 999
owarine24 <- 0
# # 空行テーブル
line_ashi_empty=data.frame("","",0,0,0,0,0)
names(line_ashi_empty) <- c("V1","V2","V3","V4","V5","V6","V7")
for(i15 in 1:nrow_ashi15){

  line_ashi15 <- table_ashi15[c(i15), ]
  hajimene60 <- if(hajimene60 == 0){line_ashi15[1,3]}else{hajimene60}
  takane60 <- if(takane60 < line_ashi15[1,4]){line_ashi15[1,4]}else{takane60}
  yasune60 <- if(yasune60 > line_ashi15[1,5]){line_ashi15[1,5]}else{yasune60}
  owarine60 <- line_ashi15[1,6]
  hajimene24 <- if(hajimene24 == 0){line_ashi15[1,3]}else{hajimene24}
  takane24 <- if(takane24 < line_ashi15[1,4]){line_ashi15[1,4]}else{takane24}
  yasune24 <- if(yasune24 > line_ashi15[1,5]){line_ashi15[1,5]}else{yasune24}
  owarine24 <- line_ashi15[1,6]
  
  #列の追加
  lineall <- line_ashi15
  lineall$v60h<-hajimene60
  lineall$v60t<-takane60
  lineall$v60y<-yasune60
  lineall$v60o<-owarine60
  lineall$v24h<-hajimene24
  lineall$v24t<-takane24
  lineall$v24y<-yasune24
  lineall$v24o<-owarine24

  tableall <- rbind(tableall,lineall)
  
  mod_temp <- i15 %% 4
  if (mod_temp == 0) {
    hajimene60 <- 0
    takane60 <- 0
    yasune60 <- 999
    owarine60 <- 0
  }
  # 24 のままだが、中身は4H
  # mod_temp <- i15 %% 96
  mod_temp <- i15 %% 16
  if (mod_temp == 0) {
    hajimene24 <- 0
    takane24 <- 0
    yasune24 <- 999
    owarine24 <- 0
  }
  i15 <- i15 + 1
}
# write.table(table_all, "output.txt", quote=F,col.names=F, append=F,row.names=F)
write.csv(tableall, "GBPJPY_CURRENT.csv", quote=F,row.names=F)

