# utilities
debug <- FALSE
filePathSeparator <- .Platform$file.sep

# operating system file separator #################
#if(debug) message("Operating system: ", R.version$platform, ", file path separator: ", s)

#regressionSumOfSquares <- function(predicted, observed){
  # The regression SumOfSquares 
#}

closeFile <- function(filePath){
  # Closes the file with the path specified.
  f <- file(filePath)
  close(f)
}

coefficientOfDetermination <- function(pred=pred, obs=obs){
  # The coefficient of determination (also called R2, R² or R squared). One minus (residualSumOfSquares / totalSumOfSquares).
  r2 <- 1 - (substractSquareAndSum(obs, pred) / substractSquareAndSum(obs, mean(obs)) )
  return(round(r2, digits = 4))
}

createFolder <- function(folderName, seed){
  # Function to create a folder for each different seed value.
  #if(debug) message("Operating system: ", R.version$platform, ", file path separator: ", filePathSeparator)
  fn <- paste(getwd(), filePathSeparator, folderName, "_", seed, sep="")
  dir.create(fn)
  return(fn)
}

createAndSetFolder <- function(folderName, seed){
  # Creates a folder name containing the seed value and sets it as working directory.
  if(folderName == "dataset"){
    xy <- createFolder(folderName, seed)
    fullPath <- paste(getwd(), filePathSeparator, folderName, "_", seed, sep="")
    setwd(fullPath)
    message("Working directory created and set to: ", fullPath)
  }else{
    xy <- createFolder(folderName, seed)
    message("Directory created as: ", xy)
  }
  return(xy)
}

createZerosTable <- function(rowNames, columnNames){
  # Creates a tables using the row and column names provided and fills it with zero values.
  table <- matrix(0, nrow=length(rowNames), ncol=length(columnNames))
  rownames(table) <- c(rowNames)
  colnames(table) <- c(columnNames)
  for (i in 1:length(rownames)){
    message(table[i,])
  }
  return(table)
}


mean <- function(data){
  # The mean of the numerical data.
  sum <- sum(data)
  if(debug) message("function mean. sum: ", sum)
  
  n <- length(data)
  if(debug) message("function mean. number of poins n: ", n)
  
  mean <- sum/n
  if(debug) message("function mean. mean: ", mean)
  
  return(sum/n)
}

pearsonRSquared <- function(x=x, y=y){
  xMinusMean <- x - mean(x)
  if(debug) message("pearson. xMinusMean: ", xMinusMean)
  
  yMinusMean <- y - mean(y)
  if(debug) message("pearson. yMinusMean: ", yMinusMean)
  
  r <- sum(xMinusMean * yMinusMean) / ( sum(xMinusMean^2) * sum(yMinusMean^2) )^(1/2)
  if(debug) message("pearson. r (not squared): ", r)
  
  r2 <- r^2
  if(debug) message("pearson. r2 (squared): ", r2)
  
  return(round(r2, digits=4))
  
}

rmse <- function(pred=pred, obs=obs){
  # Root mean square error
  if(debug) message("rmse. pred: ", pred)
  if(debug) message("rmse. obs: ", obs)
  message("in rmse")
  obsMinusPred <- obs - pred
  if(debug) message("rmse. obsMinusPred: ", obsMinusPred)
  
  sq <- (obsMinusPred)^2
  if(debug) message("rmse. obsMinusPred^2: ", sq)
  
  sumOfSquares <- sum(sq, na.rm=F) / length(obs)
  if(debug) message("rmse. length(obs): ", length(obs))
  if(debug) message("rmse. sum of squares: ", sumOfSquares)
  
  rmse <- sumOfSquares^(1/2)
  if(debug) message("rmse. RMSE: ", rmse)
   
  return(round(rmse, digits = 4))
}

substractSquareAndSum <- function(x, y){
  # Square each number in the vector or matrix, and then sum them.
  return(sum((x-y)^2))
}

txtSeedFileName <- function(folder, fileName=fileName, seed=""){
  # Creates a full file path including: a folder path, a file name containing a seed (or other identifier), a .txt ending.
  return(paste(folder, filePathSeparator, fileName, seed, ".txt", sep=""))
}

writeErrorMetricsTable <- function(table, seed=seed, description=description, filePath=filePath){
  # Takes a table containing the error values (with the error metric as rows and the algorithm as column) and
  # writes to file a line for each table element in the form: 
  # random_seed, error_metric_description (fold-by-fold or overall), algorithm (support vector machine, random forest etc), error_metric (RMSE or R²), error_numerical_value
  s <- ","
  line <- paste(seed, description, sep=s)
  for(rowName in rownames(table)){
    for(colName in colnames(table)){
      line <- paste(line, colName, rowName, table[rowName, colName], sep=s)
      writeLineToFile(line, filePath)
      line <- paste(seed, description, sep=s)
    }
  }
}

writeLineToFile <- function(line, filePath){
  # Writes a line and a carriage return to the file specified .
  cat(line, file=filePath, sep="\n", append=TRUE)
}

writeTable <- function(table, filePath=filePath){
  # write a table to file
  write.table(table, file=filePath, sep="\t", append=TRUE)
}


#######
### Function to creat folder with different seed value
#######



folder <- function(folder.name,seed){
  
  FN <- substitute(folder.name)
  FN <- as.character(FN)
  
  if(FN == "dataset")
  {
    FN <- substitute(folder.name)
    FN <- as.character(FN)
    xy <- paste(getwd(),"/",FN,"_",seed, sep="")
    dir.create(xy)
    setwd(paste(getwd(),"/",FN,"_",seed, sep=""))
  }
  else
  {
    
    FN <- substitute(folder.name)
    FN <- as.character(FN)
    xy <- paste(getwd(),"/", FN,"_",seed, sep="")
    dir.create(xy)
  }
}
