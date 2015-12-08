\name{as.logical.bit}
\alias{as.logical.bit}
\alias{as.integer.bit}
\alias{as.double.bit}
\alias{as.logical.bitwhich}
\alias{as.integer.bitwhich}
\alias{as.double.bitwhich}
\alias{as.logical.ri}
\alias{as.integer.ri}
\alias{as.double.ri}
\title{ Coercion from bit, bitwhich and ri to logical, integer, double }
\description{
  Coercing from bit to logical, integer, which.
}
\usage{
\method{as.logical}{bit}(x, \dots)
\method{as.logical}{bitwhich}(x, \dots)
\method{as.logical}{ri}(x, \dots)
\method{as.integer}{bit}(x, \dots)
\method{as.integer}{bitwhich}(x, \dots)
\method{as.integer}{ri}(x, \dots)
\method{as.double}{bit}(x, \dots)
\method{as.double}{bitwhich}(x, \dots)
\method{as.double}{ri}(x, \dots)
}
\arguments{
  \item{x}{ an object of class \code{\link{bit}}, \code{\link{bitwhich}} or \code{\link{ri}} }
  \item{\dots}{ ignored }
}
\details{
  Coercion from bit is quite fast because we use a double loop that fixes each word in a processor register.
}
\value{
  \code{\link{as.logical}} returns a vector of \code{FALSE, TRUE}, \code{\link{as.integer}} and \code{\link{as.double}} return a vector of \code{0,1}.
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{as.bit}}, \code{\link{as.which}}, \code{\link{as.bitwhich}}, \code{\link[ff]{as.ff}}, \code{\link[ff]{as.hi}} }
\examples{
  x <- ri(2, 5, 10)
  y <- as.logical(x)
  y
  stopifnot(identical(y, as.logical(as.bit(x))))
  stopifnot(identical(y, as.logical(as.bitwhich(x))))

  y <- as.integer(x)
  y
  stopifnot(identical(y, as.integer(as.logical(x))))
  stopifnot(identical(y, as.integer(as.bit(x))))
  stopifnot(identical(y, as.integer(as.bitwhich(x))))

  y <- as.double(x)
  y
  stopifnot(identical(y, as.double(as.logical(x))))
  stopifnot(identical(y, as.double(as.bit(x))))
  stopifnot(identical(y, as.double(as.bitwhich(x))))
}
\keyword{ classes }
\keyword{ logic }
