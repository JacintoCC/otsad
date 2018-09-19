## ----install1, eval = FALSE----------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("alaineiturria/otsad")

## ----install2------------------------------------------------------------
library(otsad)

## ----document1, eval=FALSE-----------------------------------------------
#  ?CpSdEwma
#  help(CpSdEwma)

## ----generateData--------------------------------------------------------
## Generate data
set.seed(100)
n <- 500
x <- sample(1:100, n, replace = TRUE)
x[70:90] <- sample(110:115, 21, replace = TRUE) # distributional shift
x[25] <- 200 # abrupt transient anomaly
x[320] <- 170 # abrupt transient anomaly
df <- data.frame(timestamp = 1:n, value = x)

## ----plotData, eval = FALSE----------------------------------------------
#  plot(x = df$timestamp, y = df$value, type = "l",
#       main = "Time-Serie", col = "blue", xlab = "Time", ylab = "Value")

## ----acfAndPacf, eval = FALSE--------------------------------------------
#  forecast::Acf(ts(df$value), main = "ACF", lag = 20)
#  forecast::Pacf(ts(df$value), main = "PACF", lag = 20)

## ----stationarityTests, eval = FALSE-------------------------------------
#  library(tseries)
#  adf.test(df$value, alternative = 'stationary', k = 0)
#  kpss.test(df$value)

## ----detector------------------------------------------------------------
result <- CpSdEwma(data = df$value, n.train = 5, threshold = 0.01, l = 3)

## ----printResult---------------------------------------------------------
head(result, n = 15)

## ----plotResult, eval = FALSE--------------------------------------------
#  res <- cbind(df, result)
#  PlotDetections(res, title = "KNN-CAD ANOMALY DETECTOR")

## ----detector2, eval = FALSE---------------------------------------------
#  ## Initialize parameters for the loop
#  last.res <- NULL
#  res <- NULL
#  nread <- 250
#  numIter <- n%/%nread
#  iter <- seq(1, nread * numIter, nread)
#  
#  ## Calculate anomalies
#  for(i in iter) {
#    # read new data
#    newRow <- df[i:(i + nread - 1),]
#    # calculate if it's an anomaly
#    last.res <- IpSdEwma(
#      data = newRow$value,
#      n.train = 5,
#      threshold = 0.01,
#      l = 3,
#      last.res = last.res$last.res
#    )
#    # prepare the result
#    if(!is.null(last.res$result)){
#      res <- rbind(res, cbind(newRow, last.res$result))
#    }
#  }

## ----plotResult2, eval = FALSE-------------------------------------------
#  PlotDetections(res, title = "SD-EWMA ANOMALY DETECTOR")

