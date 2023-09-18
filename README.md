![Graphical abstract for the paper SOVO: Usability Questionnaire for Voice-Only User Interfaces.](https://github.com/Human-Computer-Interaction-Lab-IHCLab/sovo/blob/3afa4586fa18d31d5639102bc35551214494753a/graphical_abstract.png)

Resources and extra documentation for the manuscript "SOVO: Usability Questionnaire for Voice-Only User Interfaces" published in IEEE Latin America Transactions.

## Description

This R code is used to perform statistical analysis involving the calculation of diagnostic tests, polychoric correlation matrices, and factor analysis. The aim is to validate an instrument and develop an exploratory factor model.

## Installation Instructions

1. Make sure you have R installed on your system. If not, you can download it from the [official R website](https://www.r-project.org/).

2. Open R or RStudio (if you are using it).

3. Install the necessary libraries by running the following code in the R console:

```markdown
install.packages("psych")
install.packages("polycor")
install.packages("corrplot")
install.packages("dplyr")
install.packages("GPArotation")
install.packages("mvnormtest")
install.packages("pastecs")
install.packages("moments")
install.packages("mctest")
install.packages("nFactors")
install.packages("sirt")
install.packages("data.table")
install.packages("flextable")
```

## Usage Instructions

1. Place your data file in CSV format in the same directory where you are working, and make sure its name is "data.csv." Alternatively, modify the line that says `data <- read.csv("data.csv", check.names=FALSE)` to match the location and name of your file.

2. Execute the provided code in the R or RStudio console.

3. The code will perform the following tasks:

   - Identify and remove outliers based on the Mahalanobis distance.
   - Calculate the polychoric correlation matrix.
   - Conduct diagnostic tests such as the Kaiser-Meyer-Olkin (KMO) test and the Bartlett's test of sphericity.
   - Calculate internal consistency using Cronbach's alpha and Guttman's lambda 6.
   - Perform exploratory factor analysis for model development.

4. The results will be displayed in the console, including KMO values, Cronbach's alpha, Guttman's lambda 6, Bartlett's test of sphericity, Scree plot, factor loadings from the factor analysis, and various model fit indices (BIC, TLI, RMSEA, corrected RMSR).

Ensure that you adjust file paths and names according to your needs and have your data in an appropriate format before running the code. Additionally, make sure you understand the results and their interpretation in the context of your research.
