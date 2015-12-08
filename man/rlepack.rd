\name{rlepack}
\alias{rlepack}
\alias{rlepack.integer}
\alias{rleunpack}
\alias{rleunpack.rlepack}
\alias{rev.rlepack}
\alias{unique.rlepack}
\alias{anyDuplicated.rlepack}
\title{ Hybrid Index, rle-pack utilities }
\description{
  Basic utilities for rle packing and unpacking and apropriate methods for \code{\link{rev}} and \code{\link{unique}}.
}
\usage{
rlepack(x, \dots)
\method{rlepack}{integer}(x, pack = TRUE, \dots)
rleunpack(x)
\method{rleunpack}{rlepack}(x)
\method{rev}{rlepack}(x)
\method{unique}{rlepack}(x, incomparables = FALSE, \dots)
\method{anyDuplicated}{rlepack}(x, incomparables = FALSE, \dots)
}
\arguments{
  \item{x}{ in 'rlepack' an integer vector, in the other functions an object of class 'rlepack'}
  \item{pack}{ FALSE to suppress packing }
  \item{incomparables}{ just to keep R CMD CHECK quiet (not used) }
  \item{\dots}{ just to keep R CMD CHECK quiet (not used) }
}
\value{
  A list with components
  \item{ first }{ the first element of the packed sequence }
  \item{ dat   }{ either an object of class \code{\link{rle}} or the complete input vector \code{x} if rle-packing is not efficient }
  \item{ last  }{ the last element of the packed sequence }
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link[ff]{hi}}, \code{\link{intrle}}, \code{\link{rle}}, \code{\link{rev}}, \code{\link{unique}} }
\examples{
  x <- rlepack(rep(0L, 10))
\dontshow{
 for (x in list(10:1, 1:10, c(10:1,1:10), c(1:10,10:1), sample(100), sample(100, 100, TRUE), sample(10, 100, TRUE))){
   stopifnot(identical(rleunpack(rlepack(x)), x))
   stopifnot(identical(rleunpack(unique(rlepack(x))), unique(x)))
   stopifnot(identical(anyDuplicated(rlepack(x)), anyDuplicated(x)))
 }
}
}
\keyword{ IO }
\keyword{ data }
