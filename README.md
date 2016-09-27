# R-ML-RF-SVM-PLS
Machine learning scripts written for R 

===================================================
### Machine learning evaluation R scripts
===================================================
Code authors: Neetika Nath, Luna De Ferrari  and James  McDonagh

Please cite: 
Uniting Cheminformatics and Chemical Theory to Predict the Intrinsic Aqueous Solubility of Crystalline Druglike Molecules
James L. McDonagh, Neetika Nath, Luna De Ferrari, Tanja van Mourik, John B. O. Mitchell. Chemoinformatics 2014

The original study was performed on Windows Vista (32-bit ) with Intel Core Duo CPU 3.00GHz and RAM: 4.00 GB
The code was developed in R Studio using R version 2.15.2 and R libraries: caret, dismo, kernlab, lattice, plyr, pls, pROC, randomForest, raster, reshape, rJava, sp.

### Libraries : =====================================</br>
* caret
* dismo
* kernlab
* lattice
* plyr
* pls
* pROC
* randomForest
* raster
* reshape
* rJava
* sp


### Scripts: ========================================</br>

"Master_run_all.R":
This script is a generic run all script .  There are  four input values  needed to run the scripts ;

* The path  to the current  working directory  the master_run_all.R script should be  in that directory
* Secondly , a pre-processing option  1 = scale descriptors to uniform standard deviation and mean 2 = scale descriptors to uniform standard deviation and mean and second run with PCA 3 = scale descriptors to uniform standard deviation and mean, second run with PCA, third run raw data
*  A third option is the inter-descriptor threshold in the correlation  between descriptors . i.e. if your descriptors plotted to togther have a correlation higher than 0.75  cut one of the descritors out 
* The last one  is the number of data points you have

To run the  script in R type  for example runML('path/to/master_run_all.R/script', 3, 0.75, 200) 

“run.R”:  
This main script pre-processes the data set D. The arrangement of the data is as follows: the first row is the name of the instances (in this case molecules), the last row is the independent variable (in this case LogS, the log of the molecule's solubility) and the first row contains the name of the descriptors for learning (also called features or attributes). 
Two normalisation methods have been incorporated, see the main paper for additional details. 
For the first normalisation the variable scaling approach is used, where the data are normalising by its mean and standard deviation of each column. 
The second normalisation is a data transformation through Principal Component Analysis (PCA) which decomposes the data into the principal components that explains the variability of the data. The run.R main function needs three input parameters: 

Input parameters for “run.R”:
a) Data matrix, D: can be read from the R console using: read.table(“data_X.csv", sep=",", header=T).
As already described, the first row in the comma separated file should contain the name of the descriptors and the first column the name of the molecules. The last column here contains LogS (the log of each molecule true solubility).
b) Options to normalise: there are two normalisation options and an additional option to leave the data set raw.
1. Normalising data with variable scaling
2. Normalizing the data with PCA
3. Raw data 
c)  PATH: the directory where to store the evaluation output (predictions, error statistics etc). A results folders will be created and labelled as dataset_X, where X = 1, 2 and 3 depending on what data pre-processing option is selected.

“cross_validation.R”: 
This script is automatically executed when “run.R” is launched. It receives the preprocessed data and it is designed to perform regression analysis using three machine learning algorithms (support vector regression, random forest and partial least squares). 

“utilities.R”: 
This script contains various utility functions to create files, calculate error metrics and save results to file.

### Run over multiple directories with master_run_all.R:=====================================</br>

The R function Master_run_all.R is provided to run the code with all three scaling options and feature reduction over multiple directories. This script should be placed in, and run from, the parent directory, with sub directories been only those you wish to run calcuations in. Each sub diretory should conatin the other five scripts: run.R, utilities.R cross_validate.R, MLplot.R and Var_Imp.R as well as the csv file to run. It does not have any chacking implemented in or smart way to pass over certain directories so will attempt a calculation in all sub directories. The functions arguments are .
 
* The path  to the current  working directory  the master_run_all.R script should be  in that directory
* Secondly , a pre-processing option  1 = scale descriptors to uniform standard deviation and mean 2 = scale descriptors to uniform standard deviation and mean and second run with PCA 3 = scale descriptors to uniform standard deviation and mean, second run with PCA, third run raw data
*  A third option is the inter-descriptor threshold in the correlation  between descriptors . i.e. if your descriptors plotted to togther have a correlation higher than 0.75  cut one of the descritors out 
* The last one  is the number of data points you have

To run a over the dub-directories dataset with all three scaling options, an inter-descriptor correlation cutoff of 0.75 and 200 datapoints in each dataset in one command do the following: 

path <- 'path/to/Master_run_all.R/script'
setwd(path)
source("Master_run_all.R")
runML(path, 3, 0.75, 200)

To run only certain scaling options edit the last if loop of the script as suggested in the script.

### Example run over single directory without the Maaster_run_all.R:=====================================</br>

First install the R libraries listed above, then execute in the R shell:

path <- "/path/to/the/R/scripts/"
setwd(path)
source("run.R")
source("utilities.R")
source("cross_validate.R")
data <- read.table("test_data_8mol.csv", sep=",", header=T, row.names=1)
run(data, 1, "/path/to/the/R/scripts/output/")

In this example, the path where to find the scripts is set to "/path/to/the/R/scripts/" with the 'setwd' command (under Windows the path would need to be written as: "C:\\path\\to\\the\\R\\scripts\\"). 
The scripts are then loaded with the 'source' command and the data is read from the example file test_data_8mol.csv, which is comma separated, has a header and contains the row names in the first column.
The 'run' script is then launched using as input the data, the 1st normalisation method and the output results will be written to
"/path/to/the/R/scripts/output/". 
The run script runs a 10 fold cross-validation for each of the ten random seeds using the three different machine learning algorithms. The number of folds, of internal tuning cycles and the random seeds can be modified in the text of the 'cross_validate.R' script, if desired. 
The 'debug' option in 'cross_validate.R' produces a more verbose screen printing. 
The 'svm_ok' option, if set to False, allows to exclude the support vector machine algorithm (for example, if not enough instances are available in your data).

### Output files:=====================================</br>

The main ouput directory is 'dataset_X' (where X is the normalisation option) which contains a summary file 'error_stats.csv' with the root mean squared error and pearson r squaredfor each random seed in the form:

random_seed,description,error_metric,algorithm,error_value
102,overall,RMSE,rf,0.1885
102,overall,RSQUARED,rf,0.9935

The 'dataset_X' directory also contains one directory for each random seed ('dataset_seed_y' where y is the random seed) with the following files:

error_parameter_optimised_for_each_fold_output_102.txt # internally optimised parameters
output_FOLD_1_102.txt # each fold predictions
output_FOLD_2_102.txt
...
output_FOLD_10_102.txt
testset_prediction_102.txt # all the test set predictions for all folds of this random seed
testset_split_for_seed_102.txt # the instances used as training and test set for each fold
training_prediction_102.txt # all the training set predictions for all folds of this random seed 
variable_importance_102.txt # the relative importance of the attributes (data columns) in learning

Provided the MLplot and Var_Imp scripts have run , four files  RF-predictions.csv ,  SVM-predictions.csv, PLS-predictions.csv  
and  RF_var_imp.csv will be made  these deatail the predictions by each method over the ten fold cross validation and  the variable
importance  from RF. Four  plots are  also then made from these four files. rf.png, svm.png, pls.png and  RF-variable -importance.png these show the average prediction for each method  and a line of best fit  and a box  plot of the most important descriptors. 

### End:===================================== </br>



