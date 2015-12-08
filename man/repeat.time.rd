\name{repeat.time}
\alias{repeat.time}
\title{
Adaptive timer
}
\description{
Repeats timing expr until minSec is reached
}
\usage{
repeat.time(expr, gcFirst = TRUE, minSec = 0.5, envir=parent.frame())
}
\arguments{
  \item{expr}{Valid \R expression to be timed.}
  \item{gcFirst}{Logical - should a garbage collection be performed
    immediately before the timing?  Default is \code{TRUE}.}
  \item{minSec}{number of seconds to repeat at least}
  \item{envir}{the environment in which to evaluate \code{expr} (by default the calling frame)}
}
\value{
  A object of class \code{"proc_time"}: see
  \code{\link{proc.time}} for details.
}
\seealso{
  \code{\link{system.time}}
}
\author{
Jens Oehlschlägel <Jens.Oehlschlaegel@truecluster.com>
}
\examples{
  system.time(1+1)
  repeat.time(1+1)
  system.time(sort(runif(1e6)))
  repeat.time(sort(runif(1e6)))
}
\keyword{utilities}
