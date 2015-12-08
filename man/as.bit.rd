\name{as.bit}
\alias{as.bit}
\alias{as.bit.bit}
\alias{as.bit.logical}
\alias{as.bit.integer}
\alias{as.bit.double}
\alias{as.bit.bitwhich}
\alias{as.bit.which}
\alias{as.bit.ri}
\title{ Coercing to bit }
\description{
  Coercing to bit vector
}
\usage{
as.bit(x, \dots)
\method{as.bit}{bit}(x, \dots)
\method{as.bit}{logical}(x, \dots)
\method{as.bit}{integer}(x, \dots)
\method{as.bit}{bitwhich}(x, \dots)
\method{as.bit}{which}(x, length, \dots)
\method{as.bit}{ri}(x, \dots)
}
\arguments{
  \item{x}{ an object of class \code{\link{bit}}, \code{\link{logical}}, \code{\link{integer}}, \code{\link{bitwhich}} or an integer from \code{\link{as.which}} or a boolean \code{\link[ff:vmode]{ff}} }
  \item{length}{ the length of the new bit vector }
  \item{\dots}{ further arguments }
}
\details{
  Coercing to bit is quite fast because we use a double loop that fixes each word in a processor register
}
\note{
  Zero is coerced to FALSE, all other numbers including NA are coerced to TRUE.
  This differs from the NA-to-FALSE coercion in package ff and may change in the future.
}
\value{
  \code{is.bit} returns FALSE or TRUE, \code{as.bit} returns a vector of class 'bit'
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{bit}}, \code{\link[bit:as.logical.bit]{as.logical}} }
\examples{
  x <- as.bit(c(FALSE, NA, TRUE))
  as.bit(x)
  as.bit.which(c(1,3,4), 12)
}
\keyword{ classes }
\keyword{ logic }
