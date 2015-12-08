\name{is.bit}
\alias{is.ri}
\alias{is.bit}
\alias{is.bitwhich}
\title{ Testing for bit, bitwhich and ri selection classes }
\description{
  Test whether an object inherits from 'ri', 'bit' or 'bitwhich'
}
\usage{
is.ri(x)
is.bit(x)
is.bitwhich(x)
}
\arguments{
  \item{x}{ an R object of unknown type }
}
\value{
  TRUE or FALSE
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{is.logical}}, \code{\link{bit}}, \code{\link{bitwhich}} }
\examples{
 is.ri(TRUE)
 is.ri(ri(1,4,12))
 is.bit(TRUE)
 is.bitwhich(TRUE)
 is.bit(as.bit(TRUE))
 is.bitwhich(as.bitwhich(TRUE))
}
\keyword{ classes }
\keyword{ logic }
