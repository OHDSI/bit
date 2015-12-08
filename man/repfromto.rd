\name{repfromto}
\alias{repfromto}
\alias{repfromto<-}
\title{ Virtual recycling }
\description{
  \command{repfromto} virtually recylcles object \code{x} and cuts out positions \code{from .. to}
}
\usage{
repfromto(x, from, to)
repfromto(x, from, to) <- value
}
\arguments{
  \item{x}{ an object from which to recycle }
  \item{from}{ first position to return }
  \item{to}{ last position to return }
  \item{value}{ value to assign }
}
\details{
  \code{repfromto} is a generalization of \code{\link{rep}}, where \code{rep(x, n) == repfromto(x, 1, n)}.
  You can see this as an R-side (vector) solution of the \code{mod_iterate} macro in arithmetic.c
}
\value{
  a vector of length \code{from - to + 1}
}
\author{ Jens Oehlschl�gel }
\seealso{ \code{\link{rep}}, \code{\link[ff]{ffvecapply}} }
\examples{
  message("a simple example")
  repfromto(0:9, 11, 20)
}
\keyword{ IO }
\keyword{ data }
