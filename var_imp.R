var_imp<- function(){
  fs=.Platform$file.sep
  pathhome <- getwd()
  setwd(pathhome)
  addcol <-"empty"
  for(count in 1:10){
    if(count==1){
      path <- paste(pathhome,"dataset_seed_102",sep = fs)
      message(path)
      setwd(path)
      data1 <- read.table("variable_importance_102.txt", sep="", header=F, skip=279,nrows=20)
      data2 <- read.table("variable_importance_102.txt", sep="", header=F, skip=306,nrows=20)
      data3 <- read.table("variable_importance_102.txt", sep="", header=F, skip=333,nrows=20)
      data4 <- read.table("variable_importance_102.txt", sep="", header=F, skip=360,nrows=20)
      data5 <- read.table("variable_importance_102.txt", sep="", header=F, skip=387,nrows=20)
      data6 <- read.table("variable_importance_102.txt", sep="", header=F, skip=414,nrows=20)
      data7 <- read.table("variable_importance_102.txt", sep="", header=F, skip=441,nrows=20)
      data8 <- read.table("variable_importance_102.txt", sep="", header=F, skip=468,nrows=20)
      data9 <- read.table("variable_importance_102.txt", sep="", header=F, skip=495,nrows=20)
      data10 <- read.table("variable_importance_102.txt", sep="", header=F, skip=522,nrows=20)
      all1 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
      setwd(pathhome)
      }
    if(count==2){
      path <- paste(pathhome,"dataset_seed_459",sep = fs)
      message(path)
      setwd(path)
      data1 <- read.table("variable_importance_459.txt", sep="", header=F, skip=279,nrows=20)
      data2 <- read.table("variable_importance_459.txt", sep="", header=F, skip=306,nrows=20)
      data3 <- read.table("variable_importance_459.txt", sep="", header=F, skip=333,nrows=20)
      data4 <- read.table("variable_importance_459.txt", sep="", header=F, skip=360,nrows=20)
      data5 <- read.table("variable_importance_459.txt", sep="", header=F, skip=387,nrows=20)
      data6 <- read.table("variable_importance_459.txt", sep="", header=F, skip=414,nrows=20)
      data7 <- read.table("variable_importance_459.txt", sep="", header=F, skip=441,nrows=20)
      data8 <- read.table("variable_importance_459.txt", sep="", header=F, skip=468,nrows=20)
      data9 <- read.table("variable_importance_459.txt", sep="", header=F, skip=495,nrows=20)
      data10 <- read.table("variable_importance_459.txt", sep="", header=F, skip=522,nrows=20)
      all2 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
      setwd(pathhome)
    }
    if(count==3){
      path <- paste(pathhome,"dataset_seed_745",sep = fs)
      message(path)
      setwd(path)
      data1 <- read.table("variable_importance_745.txt", sep="", header=F, skip=279,nrows=20)
      data2 <- read.table("variable_importance_745.txt", sep="", header=F, skip=306,nrows=20)
      data3 <- read.table("variable_importance_745.txt", sep="", header=F, skip=333,nrows=20)
      data4 <- read.table("variable_importance_745.txt", sep="", header=F, skip=360,nrows=20)
      data5 <- read.table("variable_importance_745.txt", sep="", header=F, skip=387,nrows=20)
      data6 <- read.table("variable_importance_745.txt", sep="", header=F, skip=414,nrows=20)
      data7 <- read.table("variable_importance_745.txt", sep="", header=F, skip=441,nrows=20)
      data8 <- read.table("variable_importance_745.txt", sep="", header=F, skip=468,nrows=20)
      data9 <- read.table("variable_importance_745.txt", sep="", header=F, skip=495,nrows=20)
      data10 <- read.table("variable_importance_745.txt", sep="", header=F, skip=522,nrows=20)
      all3 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
      setwd(pathhome)
    }
  if(count==4){
     path <- paste(pathhome,"dataset_seed_854",sep = fs)
     message(path)
     setwd(path)
     data1 <- read.table("variable_importance_854.txt", sep="", header=F, skip=279,nrows=20)
     data2 <- read.table("variable_importance_854.txt", sep="", header=F, skip=306,nrows=20)
     data3 <- read.table("variable_importance_854.txt", sep="", header=F, skip=333,nrows=20)
     data4 <- read.table("variable_importance_854.txt", sep="", header=F, skip=360,nrows=20)
     data5 <- read.table("variable_importance_854.txt", sep="", header=F, skip=387,nrows=20)
     data6 <- read.table("variable_importance_854.txt", sep="", header=F, skip=414,nrows=20)
     data7 <- read.table("variable_importance_854.txt", sep="", header=F, skip=441,nrows=20)
     data8 <- read.table("variable_importance_854.txt", sep="", header=F, skip=468,nrows=20)
     data9 <- read.table("variable_importance_854.txt", sep="", header=F, skip=495,nrows=20)
     data10 <- read.table("variable_importance_854.txt", sep="", header=F, skip=522,nrows=20)
     all4 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
     setwd(pathhome)
  }
  if(count==5){
     path <- paste(pathhome,"dataset_seed_912",sep = fs)
    message(path)
    setwd(path)
    data1 <- read.table("variable_importance_912.txt", sep="", header=F, skip=279,nrows=20)
    data2 <- read.table("variable_importance_912.txt", sep="", header=F, skip=306,nrows=20)
    data3 <- read.table("variable_importance_912.txt", sep="", header=F, skip=333,nrows=20)
    data4 <- read.table("variable_importance_912.txt", sep="", header=F, skip=360,nrows=20)
    data5 <- read.table("variable_importance_912.txt", sep="", header=F, skip=387,nrows=20)
    data6 <- read.table("variable_importance_912.txt", sep="", header=F, skip=414,nrows=20)
    data7 <- read.table("variable_importance_912.txt", sep="", header=F, skip=441,nrows=20)
    data8 <- read.table("variable_importance_912.txt", sep="", header=F, skip=468,nrows=20)
    data9 <- read.table("variable_importance_912.txt", sep="", header=F, skip=495,nrows=20)
    data10 <- read.table("variable_importance_912.txt", sep="", header=F, skip=522,nrows=20)
    all5 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
    setwd(pathhome)
  }
  if(count==6){
    path <- paste(pathhome,"dataset_seed_1257",sep = fs)
    message(path)
    setwd(path)
    data1 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=279,nrows=20)
    data2 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=306,nrows=20)
    data3 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=333,nrows=20)
    data4 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=360,nrows=20)
    data5 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=387,nrows=20)
    data6 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=414,nrows=20)
    data7 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=441,nrows=20)
    data8 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=468,nrows=20)
    data9 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=495,nrows=20)
    data10 <- read.table("variable_importance_1257.txt", sep="", header=F, skip=522,nrows=20)
    all6 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
    setwd(pathhome)
  }
  if(count==7){
     path <- paste(pathhome,"dataset_seed_2456",sep = fs)
     message(path)
    setwd(path)
    data1 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=279,nrows=20)
    data2 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=306,nrows=20)
    data3 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=333,nrows=20)
    data4 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=360,nrows=20)
    data5 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=387,nrows=20)
    data6 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=414,nrows=20)
    data7 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=441,nrows=20)
    data8 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=468,nrows=20)
    data9 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=495,nrows=20)
    data10 <- read.table("variable_importance_2456.txt", sep="", header=F, skip=522,nrows=20)
    all7 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
    setwd(pathhome)
  }
  if(count==8){
    path <- paste(pathhome,"dataset_seed_2937",sep = fs)
    message(path)
    setwd(path)
    data1 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=279,nrows=20)
    data2 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=306,nrows=20)
    data3 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=333,nrows=20)
    data4 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=360,nrows=20)
    data5 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=387,nrows=20)
    data6 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=414,nrows=20)
    data7 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=441,nrows=20)
    data8 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=468,nrows=20)
    data9 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=495,nrows=20)
    data10 <- read.table("variable_importance_2937.txt", sep="", header=F, skip=522,nrows=20)
    all8 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
    setwd(pathhome)
  }
  if(count==9){
    path <- paste(pathhome,"dataset_seed_3651",sep = fs)
    message(path)
    setwd(path)
    data1 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=279,nrows=20)
    data2 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=306,nrows=20)
    data3 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=333,nrows=20)
    data4 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=360,nrows=20)
    data5 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=387,nrows=20)
    data6 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=414,nrows=20)
    data7 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=441,nrows=20)
    data8 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=468,nrows=20)
    data9 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=495,nrows=20)
    data10 <- read.table("variable_importance_3651.txt", sep="", header=F, skip=522,nrows=20)
    all9 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
    setwd(pathhome)
  }
  if(count==10){
    path <- paste(pathhome,"dataset_seed_6524",sep = fs)
    message(path)
    setwd(path)
    data1 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=279,nrows=20)
    data2 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=306,nrows=20)
    data3 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=333,nrows=20)
    data4 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=360,nrows=20)
    data5 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=387,nrows=20)
    data6 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=414,nrows=20)
    data7 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=441,nrows=20)
    data8 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=468,nrows=20)
    data9 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=495,nrows=20)
    data10 <- read.table("variable_importance_6524.txt", sep="", header=F, skip=522,nrows=20)
    all10 <- data.frame(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
    setwd(pathhome)
  }
 }
 finaldf <- data.frame(all1, all2, all3, all4, all5, all6, all7, all8, all9, all10)
 write.table(finaldf, file="RF_var_imp.csv",sep=",")
 
 temppath <- getwd()
 message(temppath)
 RF_imp <- NULL
 RF_imp <- read.table("RF_var_imp.csv",sep=",",header=T)
 
 RF_imp_1 <- sort(table(unlist(RF_imp[,seq(1,200,2)])),decreasing = T)
 
 #top 20 variables that are popularly chosen in each fold cv
 RF_imp1 <- RF_imp_1[1:10]
 
 pos <- add_temp<-0
 temp <- matrix(0,nrow=10,ncol=100)
 rownames(temp)=names(RF_imp1)
 for(j in 1:length(RF_imp1))
 {
   k=1
   for(i in seq(1,200,2))
   {
     pos<- which(RF_imp[,i] == names(RF_imp1)[j])
     if(length(pos)>0)
     {
       temp[j,k]<-RF_imp[pos,i+1]
     }
     k=k+1
   }
 }
 temp1<-temp[order(apply(temp,1,sum)),]
 

 png("RF-variable-importance.png",width = 9, height = 7, unit = 'in', res = 300)
 par(mar=c(4,12,4,2))
 boxplot(t(temp1),besides = T,las = 2, pch=15, cex = 1,
         col = "lightblue", ylim = c(0,100), xlab="Variable Importance",
         border ="blue", boxwex = 0.3,horizontal = T)
 dev.off()
 mar = c(5, 4, 4, 2) + 0.1
}
