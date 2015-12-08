\name{length.bit}
\alias{length.bit}
\alias{length.bitwhich}
\alias{length.ri}
\alias{length<-.bit}
\alias{length<-.bitwhich}
\title{ Getting and setting length of bit, bitwhich and ri objects }
\description{
  Query the number of bits in a \code{\link{bit}} vector or change the number of bits in a bit vector. \cr
  Query the number of bits in a \code{\link{bitwhich}} vector or change the number of bits in a bit vector. \cr
}
\usage{
\method{length}{ri}(x)
\method{length}{bit}(x)
\method{length}{bitwhich}(x)
\method{length}{bit}(x) <- value
\method{length}{bitwhich}(x) <- value
}
\arguments{
  \item{x}{ a \code{\link{bit}}, \code{\link{bitwhich}} or \code{\link{ri}} object }
  \item{value}{ the new number of bits }
}
\details{
  NOTE that the length does NOT reflect the number of selected (\code{TRUE}) bits, it reflects the sum of both, \code{TRUE} and \code{FALSE} bits.
  Increasing the length of a \code{\link{bit}} object will set new bits to \code{FALSE}.
  The behaviour of increasing the length of a \code{\link{bitwhich}} object is different and depends on the content of the object:
  \itemize{
   \item{TRUE}{all included, new bits are set to \code{TRUE}}
   \item{positive integers}{some included, new bits are set to \code{FALSE}}
   \item{negative integers}{some excluded, new bits are set to \code{TRUE}}
   \item{FALSE}{all excluded:, new bits are set to \code{FALSE}}
  }
  Decreasing the length of bit or bitwhich removes any previous information about the status bits above the new length.
}
\value{
  the length  A bit vector with the new length
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{length}}, \code{\link[=sum.bit]{sum}}, \code{\link[ff]{poslength}}, \code{\link[ff]{maxindex}} }
\examples{
  stopifnot(length(ri(1, 1, 32))==32)

  x <- as.bit(ri(32, 32, 32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==1)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==0)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==0)

  x <- as.bit(ri(1, 1, 32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==1)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==1)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==1)

  x <- as.bitwhich(bit(32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==0)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==0)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==0)

  x <- as.bitwhich(!bit(32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==32)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==16)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==32)

  x <- as.bitwhich(ri(32, 32, 32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==1)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==0)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==0)

  x <- as.bitwhich(ri(2, 32, 32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==31)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==15)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==31)

  x <- as.bitwhich(ri(1, 1, 32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==1)
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==1)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==1)

  x <- as.bitwhich(ri(1, 31, 32))
  stopifnot(length(x)==32)
  stopifnot(sum(x)==31)
  message("NOTE the change from 'some excluded' to 'all excluded' here")
  length(x) <- 16
  stopifnot(length(x)==16)
  stopifnot(sum(x)==16)
  length(x) <- 32
  stopifnot(length(x)==32)
  stopifnot(sum(x)==32)
}
\keyword{ classes }
\keyword{ logic }
