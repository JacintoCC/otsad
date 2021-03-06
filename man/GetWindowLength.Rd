% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetDetectorScore_getWindowLength.R
\name{GetWindowLength}
\alias{GetWindowLength}
\title{Get Window Length}
\usage{
GetWindowLength(data.length, num.real.anomaly)
}
\arguments{
\item{data.length}{Dataset length.}

\item{num.real.anomaly}{Number of real anomalies contained in the data set.}
}
\value{
Window length as numeric.
}
\description{
\code{GetWindowLength} Calculates the size of the window. This window focuses on
the real anomaly and it can be used to know if the detected anomaly is a true positive or not.
}
\details{
\code{nrow.data} and \code{num.real.anomaly} must be numeric. Window length is
calculated as 10% of the length of the data set divided by the number of real anomalies
contained in it.
}
\references{
A. Lavin and S. Ahmad, “Evaluating Real-time Anomaly Detection Algorithms – the
Numenta Anomaly Benchmark,” in 14th International Conference on Machine Learning and
Applications (IEEE ICMLA’15), 2015.
}
