\name{as.which}
\alias{as.which}
\alias{as.which.default}
\alias{as.which.bitwhich}
\alias{as.which.bit}
\alias{as.which.ri}
\title{ Coercion to (positive) integer positions }
\description{
  Coercing to something like the result of which \code{\link{which}}
}
\usage{
as.which(x, \dots)
\method{as.which}{default}(x, \dots)
\method{as.which}{ri}(x, \dots)
\method{as.which}{bit}(x, range = NULL, \dots)
\method{as.which}{bitwhich}(x, \dots)
}
\arguments{
  \item{x}{ an object of classes \code{\link{bit}}, \code{\link{bitwhich}}, \code{\link{ri}} or something on which \code{\link{which}} works }
  \item{range}{ a \code{\link{ri}} or an integer vector of length==2 giving a range restriction for chunked processing }
  \item{\dots}{ further arguments (passed to \code{\link{which}} for the default method, ignored otherwise) }
}
\details{
  \code{as.which.bit} returns a vector of subscripts with class 'which'
}
\value{
  a vector of class 'logical' or 'integer'
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{as.bit}}, \code{\link{as.logical}}, \code{\link{as.integer}}, \code{\link{as.which}}, \code{\link{as.bitwhich}}, \code{\link[ff]{as.ff}}, \code{\link[ff]{as.hi}} }
\examples{
  r <- ri(5, 20, 100)
  x <- as.which(r)
  x

  stopifnot(identical(x, as.which(as.logical(r))))
  stopifnot(identical(x, as.which(as.bitwhich(r))))
  stopifnot(identical(x, as.which(as.bit(r))))
}
\keyword{ classes }
\keyword{ logic }
