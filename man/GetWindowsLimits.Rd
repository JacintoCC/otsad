% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetDetectorScore_getWindowsLimits.R
\name{GetWindowsLimits}
\alias{GetWindowsLimits}
\title{Get windows limits}
\usage{
GetWindowsLimits(data, windowLength = NULL)
}
\arguments{
\item{data}{All dataset with training and test datasets and with at least \code{timestamp},
\code{value} and \code{is.real.anomaly} columns.}

\item{windowLength}{Window length. See \code{\link{GetWindowLength}}.}
}
\value{
Same data set with two additional columns \code{start.limit} and \code{end.limit} where
for each is.real.anomaly equal to 1 is indicated the position in the data set where each window
starts and ends. If two anomalies fall within the same window, the start and end positions
are only indicated on the first of them.
}
\description{
\code{GetWindowsLimits} Calculates the start and end positions of each window that
are focused on the real anomalies. This windows can be used to know if the detected anomaly is a
true positive or not.
}
\details{
\code{data} must be a data.frame with  \code{timestamp}, \code{value}, \code{is.anomaly}
and \code{is.real.anomaly} columns. \code{timestamp} column can be numeric, of type POSIXct, or a
character type date convertible to POSIXct. \code{windowLength} must be numeric value.
}
\references{
A. Lavin and S. Ahmad, “Evaluating Real-time Anomaly Detection Algorithms – the
Numenta Anomaly Benchmark,” in 14th International Conference on Machine Learning and
Applications (IEEE ICMLA’15), 2015.
}
