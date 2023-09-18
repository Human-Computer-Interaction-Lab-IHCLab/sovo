library(psych)
library(polycor)
library(corrplot)
library(dplyr)
library(GPArotation)
library(mvnormtest)
library(pastecs)
library(moments)
library(mctest)
library(nFactors)
library(sirt)
library(data.table)
library(flextable)

#Read data and format
data <- read.csv("data.csv", check.names=FALSE)
data <- data  %>% select(-Género, -Edad, -Carrera)
colnames(data)

og_names <- colnames(data)
colnames(data) <- paste0("P", seq(1,ncol(data)))

#Identify and remove outliers based on the Mahalanobis distance
distancia <- as.matrix(mahalanobis(data, colMeans(data), cov = cov(data)))

outliers <- data %>% transmute(n_fila = 1:nrow(data), 
                                   p_value = pchisq(distancia, df = ncol(data), lower.tail = F)) %>%
                                   filter(p_value <= 0.001)

outliers <- outliers$n_fila[c(2:6,8:10,12:13,15:16)] 
data <- data[-outliers,]

#Calculate the polychoric correlation matrix
polychoric_cor  <- polychoric(data)
#### Conduct diagnostic tests ####
#Calculate Kaiser-Meyer-Olkin (KMO)
kmo_results <- KMO(polychoric_cor$rho)
print(kmo_results)

#Calculation of Cronbach's alpha
alfa_cron <- psych::alpha(polychoric_cor$rho, n.obs=nrow(data))
print(alfa_cron)

#Calculation of Guttman's lambda 6
G6 <- alfa_cron$total["G6(smc)"]
print(G6)

#Bartlett's test of sphericity.
bartlett_test <- cortest.bartlett(polychoric_cor$rho, n = nrow(data))
print(bartlett_test)

### Conduct exploratory factor analysis ####
#Parallel factor analysis
fa_parallel <- fa.parallel(polychoric_cor$rho,n.obs=nrow(data) ,fm="ml", fa="fa", main="Scree Plot", n.iter=1000)
print(fa_parallel)

#Exploratory factor analysis
model <-  fa(polychoric_cor$rho, n.obs=nrow(data), rotate="oblimin", fm="ml", nfactor=3)
#Print loadings with cutoff = 0.4
print(model$loadings, cutoff=0.4)
#### Goodness of fit ####
#Bayesian Information Criterion (BIC)
pritn(model$BIC)
#Tucker-Lewis index (TLI)
print(model$TLI)
#Root Mean Square Error of Approximation (RMSEA)
print(model$RMSEA[1])
#Corrected Root Mean Square of the Residuals (RMSR)
print(model$crms)