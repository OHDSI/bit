\name{regtest.bit}
\alias{regtest.bit}
\title{ Regressiontests for bit }
\description{
  Test package bit for correctness
}
\usage{
regtest.bit(N = 100)
}
\arguments{
  \item{N}{ number of random test runs }
}
\details{
  random data of random length are generated and correctness of package functions tested on these
}
\value{
  a vector of class 'logical' or 'integer'
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{bit}}, \code{\link{as.bit}}, \code{\link{as.logical}}, \code{\link{as.integer}}, \code{\link{which}} }
\examples{
  if (regtest.bit()){
    message("regtest.bit is OK")
  }else{
    message("regtest.bit failed")
  }

  \dontrun{
    regtest.bit(10000)
  }
}
\keyword{ classes }
\keyword{ logic }
