##################################################################################################################################################################################
# Created by J. L. McDonagh 2015 at the Univeristy of St Andrews/Univeristy of Manchester UK                                                                                     #
# path1 should be the path where this script is                                                                                                                                  #
# numsample should be the number of predicted quanities 
# property should be a text label for the graph axis and title
##################################################################################################################################################################################

MLplot <- function(path1,numsample,property){
  fs=.Platform$file.sep
  count <- 1
  setwd(path1)
  addcol <- "empty"
  ave <- "average"
  property1 = property
  message(property)
  for(count in 1:10){
    if(count==1) {
      Path <- paste(path1,"dataset_seed_102",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_102.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls1 <- dfpls[ order(dfpls[,1]),]
      rf1 <- dfrf[ order(dfrf[,1]),]
      svm1 <- dfsvm[ order(dfsvm[,1]),]
      pls1[,addcol] <- NA
      rf1[,addcol] <- NA
      svm1[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==2) {
      Path <- paste(path1,"dataset_seed_459",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_459.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls2 <- dfpls[ order(dfpls[,1]),]
      rf2 <- dfrf[ order(dfrf[,1]),]
      svm2 <- dfsvm[ order(dfsvm[,1]),]
      pls2[,addcol] <- NA
      rf2[,addcol] <- NA
      svm2[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==3) {
      Path <- paste(path1,"dataset_seed_745",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_745.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls3 <- dfpls[ order(dfpls[,1]),]
      rf3 <- dfrf[ order(dfrf[,1]),]
      svm3 <- dfsvm[ order(dfsvm[,1]),]
      pls3[,addcol] <- NA
      rf3[,addcol] <- NA
      svm3[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==4) {
      Path <- paste(path1,"dataset_seed_854",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_854.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls4 <- dfpls[ order(dfpls[,1]),]
      rf4 <- dfrf[ order(dfrf[,1]),]
      svm4 <- dfsvm[ order(dfsvm[,1]),]
      pls4[,addcol] <- NA
      rf4[,addcol] <- NA
      svm4[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==5) {
      Path <- paste(path1,"dataset_seed_912",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_912.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls5 <- dfpls[ order(dfpls[,1]),]
      rf5 <- dfrf[ order(dfrf[,1]),]
      svm5 <- dfsvm[ order(dfsvm[,1]),]
      pls5[,addcol] <- NA
      rf5[,addcol] <- NA
      svm5[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==6) {
      Path <- paste(path1,"dataset_seed_1257",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_1257.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls6 <- dfpls[ order(dfpls[,1]),]
      rf6 <- dfrf[ order(dfrf[,1]),]
      svm6 <- dfsvm[ order(dfsvm[,1]),]
      pls6[,addcol] <- NA
      rf6[,addcol] <- NA
      svm6[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==7) {
      Path <- paste(path1,"dataset_seed_2456",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_2456.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls7 <- dfpls[ order(dfpls[,1]),]
      rf7 <- dfrf[ order(dfrf[,1]),]
      svm7 <- dfsvm[ order(dfsvm[,1]),]
      pls7[,addcol] <- NA
      rf7[,addcol] <- NA
      svm7[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==8) {
      Path <- paste(path1,"dataset_seed_2937",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_2937.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls8 <- dfpls[ order(dfpls[,1]),]
      rf8 <- dfrf[ order(dfrf[,1]),]
      svm8 <- dfsvm[ order(dfsvm[,1]),]
      pls8[,addcol] <- NA
      rf8[,addcol] <- NA
      svm8[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==9) {
      Path <- paste(path1,"dataset_seed_3651",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_3651.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls9 <- dfpls[ order(dfpls[,1]),]
      rf9 <- dfrf[ order(dfrf[,1]),]
      svm9 <- dfsvm[ order(dfsvm[,1]),]
      pls9[,addcol] <- NA
      rf9[,addcol] <- NA
      svm9[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else if(count==10) {
      Path <- paste(path1,"dataset_seed_6524",sep = fs)
      message(Path)
      setwd(Path)
      data <- read.table("testset_prediction_6524.txt",sep="\t", header=T)
      attach(data)
      sorteddd<- data[ order(data[,6]),]
      df <- split(sorteddd,sorteddd$model)
      dfpls <- df[[1]]
      dfrf <- df[[2]]
      dfsvm <- df[[3]]
      pls10 <- dfpls[ order(dfpls[,1]),]
      rf10 <- dfrf[ order(dfrf[,1]),]
      svm10 <- dfsvm[ order(dfsvm[,1]),]
      pls10[,addcol] <- NA
      rf10[,addcol] <- NA
      svm10[,addcol] <- NA
      detach(data)
      setwd(path1)
    } else {
      stop("Counter past 10")
    }
  }
  lab_x <- paste("Experimental ", property1," (kJ/mol)")
  lab_y <- paste("Predicted ",property1, " (kJ/mol)")
  compls <- data.frame(pls1,pls2,pls3,pls4,pls5,pls6,pls7,pls8,pls9,pls10)
  for(i in (1:numsample)){
    sumav = sum(compls[i,3],compls[i,10],compls[i,17],compls[i,24],compls[i,31],compls[i,38],compls[i,45],compls[i,52],compls[i,59],compls[i,66])
    plsav = sumav/10
    compls$average[i] = plsav
  }
  attach(compls)
  plsab <- lm(average~obs)
  png("pls.png",width = 10, height = 7, units = 'in', res = 300)
  plot(obs,average,main=paste("Experimental ", property1, "Against PLS Prediction"), xlab = lab_x, ylab = lab_y)
  abline(plsab)
  dev.off()
  detach(compls)
  comrf <- data.frame(rf1,rf2,rf3,rf4,rf5,rf6,rf7,rf8,rf9,rf10)
  for(i in (1:numsample)){
    sumav = sum(comrf[i,3],comrf[i,10],comrf[i,17],comrf[i,24],comrf[i,31],comrf[i,38],comrf[i,45],comrf[i,52],comrf[i,59],comrf[i,66])
    rfav = sumav/10
    comrf$average[i] = rfav
  }
  attach(comrf)
  rfab <- lm(average~obs)
  png("rf.png",width = 10, height = 7, units = 'in', res = 300)
  plot(obs,average,main=paste("Experimental ", property1, "Against RF Prediction"), xlab = lab_x, ylab = lab_y)
  abline(rfab)
  dev.off()
  detach(comrf)
  comsvm <- data.frame(svm1,svm2,svm3,svm4,svm5,svm6,svm7,svm8,svm9,svm10)
  for(i in (1:numsample)){
    sumav = sum(comsvm[i,3],comsvm[i,10],comsvm[i,17],comsvm[i,24],comsvm[i,31],comsvm[i,38],comsvm[i,45],comsvm[i,52],comsvm[i,59],comsvm[i,66])
    svmav = sumav/10
    comsvm$average[i] = svmav
  }
  attach(comsvm)
  svmab <- lm(average~obs)
  png("svm.png",width = 10, height = 7, units = 'in', res = 300)
  plot(obs,average,main=paste("Experimental ", property1, "Against SVM Prediction"), xlab = lab_x, ylab = lab_y)
  abline(svmab)
  dev.off()
  detach(comsvm)
  write.csv(compls,file="PLS-predictions.csv")
  write.csv(comrf,file="RF-predictions.csv")
  write.csv(comsvm,file="SVM-predictions.csv")
  message("FINISHED")
}
    