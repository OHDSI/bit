\name{physical}
\alias{physical}
\alias{physical<-}
\alias{virtual}
\alias{virtual<-}
\alias{physical.default}
\alias{physical<-.default}
\alias{virtual.default}
\alias{virtual<-.default}
\alias{print.physical}
\alias{print.virtual}
\title{ Physical and virtual attributes }
\description{
  Compatibility functions (to package ff) for getting and setting physical and virtual attributes.
}
\usage{
physical(x)
virtual(x)
physical(x) <- value
virtual(x) <- value
\method{physical}{default}(x)
\method{virtual}{default}(x)
\method{physical}{default}(x) <- value
\method{virtual}{default}(x) <- value
\method{print}{physical}(x, \dots)
\method{print}{virtual}(x, \dots)
}
\arguments{
  \item{x}{ a ff or ram object }
  \item{value}{ a list with named elements }
  \item{\dots}{ further arguments }
}
\details{
  ff objects have physical and virtual attributes, which have different copying semantics:
  physical attributes are shared between copies of ff objects while virtual attributes might differ between copies.
  \code{\link[ff]{as.ram}} will retain some physical and virtual atrributes in the ram clone,
  such that \code{\link[ff]{as.ff}} can restore an ff object with the same attributes.
}
\value{
  \command{physical} and \command{virtual} returns a list with named elements
}
\author{ Jens Oehlschlägel }
\seealso{
 \code{\link[ff]{physical.ff}}, \code{\link[ff]{physical.ffdf}}
}
\examples{
  physical(bit(12))
  virtual(bit(12))
}
\keyword{ IO }
\keyword{ data }
\keyword{ attribute }
