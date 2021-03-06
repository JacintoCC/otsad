% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cp_sd_ewma.R
\name{CpSdEwma}
\alias{CpSdEwma}
\title{Classic Processing Shift-Detection based on EWMA (SD-EWMA).}
\usage{
CpSdEwma(data, n.train, threshold = 0.01, l = 3)
}
\arguments{
\item{data}{Numerical vector with training and test dataset.}

\item{n.train}{Number of points of the dataset that correspond to the training set.}

\item{threshold}{Error smoothing constant.}

\item{l}{Control limit multiplier.}
}
\value{
dataset conformed by the following columns:

  \item{is.anomaly}{1 if the value is anomalous 0, otherwise.}
  \item{ucl}{Upper control limit.}
  \item{lcl}{Lower control limit.}
}
\description{
\code{CpSdEwma} calculates the anomalies of a dataset using
classical processing based on the SD-EWMA algorithm. This algorithm is a
novel method for covariate shift-detection tests based on a two-stage
structure for univariate time-series. It works in an online mode and it uses
an exponentially weighted moving average (EWMA) model based control chart to
detect the covariate shift-point in non-stationary time-series. See also
\code{\link{OcpSdEwma}}, the optimized and faster function of this function.
}
\details{
\code{data} must be a numerical vector without NA values.
\code{threshold} must be a numeric value between 0 and 1.
It is recommended to use low values such as 0.01 or 0.05. By default, 0.01 is
used. Finally, \code{l} is the parameter that determines the control limits.
By default, 3 is used.
}
\examples{
## Generate data
set.seed(100)
n <- 500
x <- sample(1:100, n, replace = TRUE)
x[70:90] <- sample(110:115, 21, replace = TRUE)
x[25] <- 200
x[320] <- 170
df <- data.frame(timestamp = 1:n, value = x)

## Calculate anomalies
result <- CpSdEwma(
  data = df$value,
  n.train = 5,
  threshold = 0.01,
  l = 3
)
res <- cbind(df, result)

## Plot results
PlotDetections(res, title = "KNN-CAD ANOMALY DETECTOR")
}
\references{
Raza, H., Prasad, G., & Li, Y. (03 de 2015). EWMA model based
shift-detection methods for detecting covariate shifts in non-stationary
environments. Pattern Recognition, 48(3), 659-669.
}
