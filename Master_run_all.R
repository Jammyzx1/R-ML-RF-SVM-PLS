runML <- function(inpath, op, corr,numdatapoints){

# Get the os and os file separator
  os <- .Platform$OS.type
  fs <- .Platform$file.sep
    
# Deal with . and .. as directories  
  for (subdir in list.dirs(path=".", full.names=FALSE, recursive = FALSE)){
    message('subdir is ',subdir)
    if(subdir=="."){
      message("skipping")
    }else if(subdir==".."){
      message("skipping")
    }else{

# Deal with the directories we are interested in which is any sub-directry of the directory the 
# script was launched from windows includes current working directory with the dir name hence name[2].  
      try(name <- unlist(strsplit(subdir,fs)),silent=FALSE)
      message(name)
      if(os=='unix'){
	      homepath = paste(inpath,name, sep=fs)
	    }else{
	      homepath = paste(inpath,name[2], sep=fs)
	    }
		  message('homepath is ',homepath)
		  setwd(homepath)

      
# Source all callable functions these should be in each sub-directory of data
      source("cross_validate.R")
      source("utilities.R")
      source("run.R")
      source("var_imp.R")
      source("MLplot.R")
      
# Change directory to a sub-directory ofthe launch directory 
      setwd(homepath)

# Find the csv file in the sub-directory and read in as data            
      for(infile in list.files(path=".",pattern="*.csv")){
        input=infile
        message(input)
        data = read.table(input, sep = ",", header = T, row.names = 1)
        
# Feature reduction based on correlation cut off
        tmp <- cor(data)
        tmp[upper.tri(tmp)] <- 0
        diag(tmp) <- 0
        datanew <- data[,!apply(tmp,2,function(x) any(abs(x) > corr))] # Don't apply any feature with an absolute correlation > user value
        write.csv(datanew, file = "reduced_dataset.txt", row.names = TRUE)

# Run the ML methods with; 
# 1 = scale descriptors to uniform standard deviation and mean
# 2 = scale descriptors to uniform standard deviation and mean and second run with PCA
# 3 = scale descriptors to uniform standard deviation and mean, second run with PCA, third run raw data
        for (option in (1:op)){
          message(homepath)
          message(infile)
          run(datanew,option,homepath)
        }
        
# For each results directory (dataset_*) run general analysis provides figure of average predictions
# csv file of the average predictions for each method 
# provide a figure of the feature importance from Random Forest.
# NOTE: to make publication images of the average regressions requires the plotting script to be run in
#       each directory separatley providing the information needed to make meaningful axis titles. 
        for( dir in list.dirs(path = ".",recursive=FALSE)){
          datapath <- paste(homepath,dir, sep=fs)
          setwd(datapath)
          var_imp()
          MLplot(datapath,numdatapoints)
        }
        
      }
      setwd(inpath)
    }
  }
}
