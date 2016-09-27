
s <- .Platform$file.sep # file path separator

crossValidate <- function(data1, trueClassColumn){
  #######################################
  ## Overall function variables
  #######################################
  debug <- FALSE # Debug mode (T=True, F=False)
  svm_ok <- TRUE # whether to use SVM during testing (requires extra data for optimisation)
  
  # DATA ############################
  data  <- data1
  columnWithRowNames <- row.names(data) # unique row names column (molecule-name column)
 
  # ALGORITHMS ######################
  algorithms <- c("svmradial", "rf", "pls")
  if (!svm_ok){
    algorithms <- c("rf", "pls")
  } 
  
  # ERROR METRICS (RMSE & R²) ###################
  stats <- c("RMSE", "RSQUARED")
  allStats <- c(stats, "Coefficient_of_determination")
  #desc_foldbyfold <- "fold-by-fold" # metric calculated over each fold (and possibly then averaged)
  desc_overall <- "over_all_predictions_for_this_random_seed" # error metric calculated over all the predictions of one random seed
  errorFile <- paste(".", s, "error_stats.csv", sep="")
  writeLineToFile("random_seed,description,error_metric,algorithm,error_value", errorFile) # file header of data columns names)
  
  ## the column index of RMSE and R² in the output of the function postResample (from the caret package code at https://r-forge.r-project.org/scm/viewvc.php/pkg/caret/R/postResample.R?view=markup&root=caret&sortby=rev)
  rmseIndex <- 1
  rSquaredIndex <- 2
  
  ## initialising the table of the error metrics with 0 values
  completeErrorResults <- NULL
  #foldByFoldTotalResults <- NULL
  completeErrorResults <- createZerosTable(algorithms, allStats)
  #foldByFoldTotalResults <- createZerosTable(algorithms, stats)

  # SEED, FOLDS AND TUNING VALUES #########################
  seeds <- c(102, 912, 854, 1257, 459, 3651, 2456, 2937, 745, 6524)
  numberOfFolds <- 10
  tuneCycles <- 20
  
  if(debug){
    numberOfFolds <- 4
    tuneCycles <- 2
    seeds <- c(102, 912)
  }
  ###########################################################
  ## Evaluate over various random seeds and regression models
  ###########################################################
  for(r in 1:length(seeds))
  {
    seed <- seeds[r]  
    set.seed(seed)
    message("== Evaluating seed ", r , " of ", length(seeds), ", seed value=", seed , " ============================")
    
    ############################################
    ## Variable initialisation for this run
    ############################################
    svmFold <- svmResult <- NULL
    rvmFold <- rvmResult <- NULL
    rfFold <- rfResult <- NULL
    plsFold <- plsResult <- NULL
    postResamplePerformance<- NULL
    trainingPredictions <- testsetPredictions <- NULL
    svmVariableImportance <- rfVariableImportance <- plsVariableImportance <- NULL
    allPred <- NULL
    allFoldsPredAndObs <- NULL 
    
    # test split assigment for n fold cross validation
    folds <- kfold(data, numberOfFolds) 
    foldWithRowNames <- cbind(columnWithRowNames, folds)
    
    # create a folder for each dataset and seed
    outputFolder <- createAndSetFolder("dataset_seed", seed) 
    
    # initialise a table & file for the error metrics (RMSE & R²) of each fold of this seed
    #thisSeedErrorStatsByFold <- createZerosTable(algorithms, stats)  
    #thisSeedRmseFile <- txtSeedFileName(outputFolder, fileName=paste("error_for_each_", numberOfFolds, "_CVfolds_of_seed_", sep=""), seed=seed)
    #writeLineToFile("fold,seed,algorithm,error_metric,error_value", filePath=thisSeedRmseFile)

    ##########################
    ## For each data fold
    ##########################
    for(k in 1:numberOfFolds)
    {
      #if(debug) message("At fold ", k, " sinks still open: ",sink.number())
      message("== Seed ", r,  " of ", length(seeds), ", fold: ", k, " of ", numberOfFolds, " ==============================")
      
      ################################
      #Train-test split for k fold CV
      ################################
      currentTestFold <- NULL;
      currentTestFold <- which(folds == k)
      
      trainset <- data[-currentTestFold,]
      testset <- data[currentTestFold,]
      trainTrueClassColumn <- trueClassColumn[-currentTestFold]
      testTrueClassColumn <- trueClassColumn[currentTestFold]
      
      #################################################
      ### fit the Model using train():: SVM Radial
      ###################################################
      if(svm_ok){
        message("SVM Radial")
        svmR <- train(trainset, trainTrueClassColumn, method = "svmRadial", metric = "RMSE", verbose = FALSE, trControl = trainControl((method = "cv"), numberOfFolds, verboseIter = F),tuneLength=tuneCycles)
        svmVariableImportance[[k]] <- varImp(svmR)
        svmResult[[k]] <- as.matrix(svmR$resample)
        svmFold[[k]] <-  as.matrix(svmR$results)
      }
      
      ###################################################
      ### fit the Model using train():: randomForest
      ###################################################
      message("Random Forest")
      rfLearning <- train(trainset, trainTrueClassColumn ,
                   method = "rf",
                   metric = "RMSE",
                   trControl = trainControl((method = "cv"),numberOfFolds,
                                            verboseIter = F), ntree=1000, importance=TRUE,tuneLength=tuneCycles)	
      rfVariableImportance[[k]] <- varImp(rfLearning)
      rfResult[[k]] <- (as.matrix(rfLearning$resample))
      rfFold[[k]] <- (as.matrix(rfLearning$results))
      
      ###################################################
      ### fit the Model using train():: SVM Poly
      ###################################################
      message("Partial least squares")
      plsLearning <- train(trainset, trainTrueClassColumn ,
                   method = "pls",
                   metric = "RMSE",
                   verbose = FALSE,                    
                   trControl = trainControl((method = "cv"), numberOfFolds, verboseIter = F),tuneLength=tuneCycles)	
      plsVariableImportance[[k]] <- varImp(plsLearning)
      plsResult[[k]] <- (as.matrix(plsLearning$resample))
      plsFold[[k]] <- (as.matrix(plsLearning$results))	
      
      ##################################################
      ### Models for Regression analysis
      ##################################################
      if(svm_ok){
        bhModels <- list(svmR, rfLearning, plsLearning)
      } else{
        bhModels <- list(rfLearning, plsLearning)
      }
      
      ###################################################
      ### Emitting predictions
      ###################################################
      message("Emitting predictions") 
      allPred <- extractPrediction(bhModels, 
                                   testX = testset, testY = testTrueClassColumn)
      
      testPred <- subset(allPred, dataType == "Test")
      trainPred <- subset(allPred, dataType == "Training")
     
      ####################################################
      # Calculate performance across resamples (FOLD-BY FOLD)
      ###################################################
      
      # calculate RMSE and R² for each model over this fold only 
      message("Computing fold's ", k , " RMSE and R2 with each machine learning method (seed = ", seed , ")")
      
      # The postResamplePerformance table has rows named after the algorithms and columns "RMSE" and "Rsquared" (in this order, checked in the caret package documentation)
      #postResamplePerformance <- by(testPred, list(model = testPred$model), function(x) postResample(x$pred, + x$obs))
      
      # for each algorithm, sum the current fold error to the overall error
      #for(name in names(postResamplePerformance)){
        #thisSeedErrorStatsByFold[name,] <- thisSeedErrorStatsByFold[name,] + postResamplePerformance[[name]]
      #}
      
      # write to file RMSE & R² error for this fold and seed
      #for(colName in names(postResamplePerformance)){
        #for(i in 1:2){
          #value <- round(postResamplePerformance[[name]][i], digits = 4)
          #writeLineToFile(paste(k, seed, colName, stats[i], value, sep=","), filePath=thisSeedRmseFile)
        #}
      #}
      
      #######################################################################
      # Accumulate each fold's predictions for overall RMSE & R² calculation
      #######################################################################
      allFoldsPredAndObs <- rbind(allFoldsPredAndObs, testPred)
     
      trainingPredictions <- rbind(trainingPredictions, cbind(rownames(trainset),trainPred))
      testsetPredictions <- rbind(testsetPredictions, cbind(rownames(testset),testPred))
      
      message("Writing predicted values to file")
      #for(algorithmName in algorithms){
        #algorithmIndex <- match(algorithmName, algorithms)
        #write.table(subset(allPred, model == algorithmIndex),file=paste(outputFolder, s, "output_FOLD_",k, "_",seed, ".csv",sep=""),sep=" ",append=TRUE)
      #}
      outputFoldSeedFile <- txtSeedFileName(outputFolder, paste("output_FOLD_", k, "_", sep=""), seed=seed)
      writeTable(allPred, filePath=outputFoldSeedFile)
      
    } # end of k folds cycle
    sink()

    # write PREDICTIONS to file
    writeTable(trainingPredictions, filePath=txtSeedFileName(outputFolder, "training_prediction_",seed=seed))
    writeTable(testsetPredictions, filePath=txtSeedFileName(outputFolder, "testset_prediction_", seed=seed))
    writeTable(foldWithRowNames, filePath=txtSeedFileName(outputFolder, "testset_split_for_seed_", seed=seed))
    
    # write FOLD-BY-FOLD ERROR metrics to file (RMSE and R² for each seed)
    #foldByFoldRmseFile <- txtSeedFileName(outputFolder, "fold-by-fold_error_for_seed_", seed=seed)
    
    #writeLineToFile(paste("Sum of the error of all folds (for  ", seed, " only):", sep=""),  foldByFoldRmseFile)
    #writeTable(thisSeedErrorStatsByFold, filePath=foldByFoldRmseFile)
    #writeLineToFile(paste("Sum of the error of all folds divided by the number of folds (for this seed ", seed, " only):", sep=""),  foldByFoldRmseFile)
    #statsAveragedByFold <- thisSeedErrorStatsByFold/numberOfFolds
    #writeTable(statsAveragedByFold, filePath=foldByFoldRmseFile)
    
    
    #########
    ### Summed results for different seed value
    #########
    #foldByFoldTotalResults <- foldByFoldTotalResults + thisSeedErrorStatsByFold
    
    ############################################
    ## Report optimisation to file
    ############################################
    message("Writing the parameter optimisation value")
    optimumParamFile <- txtSeedFileName(outputFolder, "error_parameter_optimised_for_each_fold_output_", seed=seed)
    if(debug) message("Optimum parameters file: ", optimumParamFile)
    sink(optimumParamFile)
    message("past sink")
    if(svm_ok){
      print("SVM")
      print("error rate at each fold while optimising the parameter")
      print(svmFold)
      print(svmResult)
    }
    
    print("Random Forest")
    print("error rate at each fold while optimising the parameter")
    print(rfFold)
    print(rfResult)
    
    print("Partial least squares")
    print("error rate at each fold while optimising the parameter")
    print(plsFold)
    print(plsResult)
    sink()
    
    variableImportanceFile <- txtSeedFileName(outputFolder, "variable_importance_", seed=seed)
    sink(variableImportanceFile)
    
    if(!debug){
      print("SVM")
      print("top 20 variables important ")
      print(svmVariableImportance)
    }
    
    print("Random Forest")
    print(rfVariableImportance)
    print("Partial least squares")
    print(plsVariableImportance)
    sink()
    
    #########################################################
    # Calculate OVERALL ERROR & write to file (for this seed)
    #########################################################
    rmse <- by(allFoldsPredAndObs, list(model = allFoldsPredAndObs$model), function(x) rmse(pred=x$pred, obs=x$obs))
    coefficientOfDetermination <- by(allFoldsPredAndObs, list(model = allFoldsPredAndObs$model), function(x) coefficientOfDetermination(pred=x$pred, obs=x$obs))
    pearsonR2 <- by(allFoldsPredAndObs, list(model = allFoldsPredAndObs$model), function(x) pearsonRSquared(x=x$pred, y=x$obs))
    location = 0

    for(name in unique(allFoldsPredAndObs$model)){
      location = location + 1
      completeErrorResults[location, "RMSE"] <- rmse[name]
      completeErrorResults[location, "RSQUARED"] <- pearsonR2[name]
      completeErrorResults[location, "Coefficient_of_determination"] <- coefficientOfDetermination[name]
    }
    if(debug) message("Error over all points randomised with this seed: ", names(completeErrorResults), "\n", completeErrorResults)
    
    writeErrorMetricsTable(completeErrorResults, seed=seed, description=desc_overall, filePath=errorFile)
    #writeErrorMetricsTable(thisSeedErrorStatsByFold, seed=seed, description=desc_foldbyfold, filePath=errorFile)
    
    message("~~ End of seed ", seed, " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  } # end of cycle over random seeds
  
  ############################################
  # Write OVERALL ERROR to file (over all seeds)
  ############################################
  #overallStatsFile <- paste(".", s, "error_averaged_over_all_seeds.csv", sep="")
  
  #writeLineToFile( "Sum of the error of all folds for all seeds:", overallStatsFile)
  #writeTable(foldByFoldTotalResults, filePath=overallStatsFile)
  #writeLineToFile( "Average error of each fold (sum of the error of all folds & all seeds, divided by the number of folds & seeds):", overallStatsFile)
  #writeTable(foldByFoldTotalResults/(numberOfFolds*length(seeds)), filePath=overallStatsFile)
  
  sink()
}
