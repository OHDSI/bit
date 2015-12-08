\name{clone}
\alias{clone}
\alias{clone.list}
\alias{clone.default}
\alias{still.identical}
\title{ Cloning ff and ram objects }
\description{
  \command{clone} physically duplicates objects and can additionally change some features, e.g. length.
}
\usage{
clone(x, \dots)
\method{clone}{list}(x, \dots)
\method{clone}{default}(x, \dots)
still.identical(x, y)
}
\arguments{
  \item{x}{ \code{x} }
  \item{y}{ \code{y} }
  \item{\dots}{ further arguments to the generic }
}
\details{
  \command{clone} is generic. 
  \command{clone.default} currently only handles atomics. 
  \command{clone.list} recursively clones list elements.
  \command{still.identical} returns TRUE if the two atomic arguments still point to the same memory.
}
\value{
  an object that is a deep copy of x
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link[ff]{clone.ff}} }
\examples{
  x <- 1:12
  y <- x
  still.identical(x,y)
  y[1] <- y[1]
  still.identical(x,y)
  y <- clone(x)
  still.identical(x,y)
  rm(x,y); gc()
}
\keyword{ IO }
\keyword{ data }
