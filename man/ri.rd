\name{ri}
\alias{ri}
\alias{print.ri}
\title{ Range index }
\description{
  A range index can be used to extract or replace a continuous ascending part of the data
}
\usage{
ri(from, to = NULL, maxindex=NA)
\method{print}{ri}(x, \dots)

}
\arguments{
  \item{from}{ first position }
  \item{to}{ last posistion }
  \item{x}{ an object of class 'ri' }
  \item{maxindex}{ the maximal length of the object-to-be-subscripted (if known) }
  \item{\dots}{ further arguments }
}
\value{
  A two element integer vector with class 'ri'
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link[ff]{as.hi.ri}} }
\examples{
 bit(12)[ri(1,6)]
}
\keyword{ classes }
\keyword{ logic }
