% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{machine_temperature_system_failure}
\alias{machine_temperature_system_failure}
\title{machine_temperature_system_failure.}
\format{A data frame with three variables: \code{timestamp}, \code{value},
  \code{is.real.anomaly}.

For further details, see \url{https://github.com/numenta/NAB/blob/master/data/README.md}}
\usage{
machine_temperature_system_failure
}
\description{
Temperature sensor data of an internal component of a large, industrial mahcine.
The first anomaly is a planned shutdown of the machine. The second anomaly is
difficult to detect and directly led to the third anomaly, a catastrophic failure
of the machine.
}
\keyword{datasets}
