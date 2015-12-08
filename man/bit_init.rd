\name{bit_init}
\alias{bit_init}
\alias{bit_done}
\alias{.BITS}
\title{ Initializing bit masks }
\description{
  Functions to allocate (and de-allocate) bit masks
}
\usage{
  bit_init()
  bit_done()
}
\details{
  The C-code operates with bit masks.
  The memory for these is allocated dynamically.
  \code{bit_init} is called by \code{\link{.First.lib}}
  and \code{bit_done} is called by \code{\link{.Last.lib}}.
  You don't need to care about these under normal circumstances.
}
\value{
  NULL
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{bit}}  }
\examples{
  bit_done()
  bit_init()
}
\keyword{ classes }
\keyword{ logic }
