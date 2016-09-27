
run <- function(data1, op, path){
  
  ###################################################
  ### Libraries
  ###################################################
  # Libraries needed:  caret, dismo, kernlab, randomForest, reshape, rJava, pls, pROC
  
  library(caret)
  library(dismo)
  library(kernlab)
  library(lattice)
  library(plyr)
  library(pls)
  library(pROC)
  library(randomForest)
  library(raster)
  library(reshape)
  library(rJava)
  library(sp)
  
  debug <- FALSE
  
  ###################################################
  ### Path
  ###################################################
  setwd(path)
  message("Working directory: ", path)
  #### data set should be in csv format
  
  data <- data1 	
  ###################################################
  ### Data Pre-Processing
  ###################################################
  if(debug) message("raw data: ", data)
  x1 <- data[, -(ncol(data))]
  
  if (op==1) {
    #####Scaling the data
    message("scaling the data with st. deviation and mean")
    xmean <- apply(x1, 2, mean)
    xstd <- apply(x1, 2, sd)
    x <- scale(x1, xmean, xstd)
    folder(dataset, 1)

  } else if (op==2) { 
    #####Scaling with PCA
    message("Scaling the data using PCA features")
    designMatrix <- preProcess(x1, "pca")
    x <- predict(designMatrix, x1)
    folder(dataset, 2)
    
  } else {
    ##### No Scaling 
    message("using the raw data for regression analysis")
    x <- x1
    createAndSetFolder(dataset, 3)
  }
  if(debug) message("post-scaling data: ", x)
  
  crossValidate(x, data[, ncol(data)])
}

