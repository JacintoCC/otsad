library(otsad)
context("Incremental Processing Sd-Ewma")

test_that("IpSdEwma gives the correct result", {

  ## Generate data
  set.seed(100)
  n <- 500
  x <- sample(1:100, n, replace = TRUE)
  x[70:90] <- sample(110:115, 21, replace = TRUE)
  x[25] <- 200
  x[320] <- 170
  df <- data.frame(timestamp=1:n,value=x)

  ## Initialize parameters for the loop
  last.res <- NULL
  res <- NULL
  nread <- 250
  numIter <- n%/%nread
  iterador <- 0

  ## Calculate anomalies
  for(i in 1:numIter) {
    # read new data
    newRow <- df[(iterador+1):(iterador+nread),]
    # calculate if it's an anomaly
    last.res <- IpSdEwma(
      data = newRow$value,
      n.train = 5,
      threshold = 0.01,
      l = 3,
      last.res = last.res$last.res
    )
    # prepare the result
    if(!is.null(last.res$result)){
      res <- rbind(res, cbind(newRow, last.res$result))
    }
    iterador <- iterador + nread
  }

  ## read correct results
  correct.results <- rep(0, 500)
  correct.results[c(25,92,320)] <- 1

  expect_equal(as.numeric(res$is.anomaly), correct.results)

})
