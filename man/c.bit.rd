\name{c.bit}
\alias{c.bit}
\alias{c.bitwhich}
\title{ Concatenating bit and bitwhich vectors }
\description{
  Creating new bit by concatenating bit vectors
}
\usage{
\method{c}{bit}(\dots)
\method{c}{bitwhich}(\dots)
}
\arguments{
  \item{\dots}{ bit objects }
}
\value{
  An object of class 'bit'
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{c}}, \code{\link{bit}} , \code{\link{bitwhich}} }
\examples{
 c(bit(4), bit(4))
}
\keyword{ classes }
\keyword{ logic }
