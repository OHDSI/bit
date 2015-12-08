\name{Summary}
\alias{all.bit}
\alias{any.bit}
\alias{min.bit}
\alias{max.bit}
\alias{range.bit}
\alias{sum.bit}
\alias{summary.bit}
\alias{all.bitwhich}
\alias{any.bitwhich}
\alias{min.bitwhich}
\alias{max.bitwhich}
\alias{range.bitwhich}
\alias{sum.bitwhich}
\alias{summary.bitwhich}
\alias{all.ri}
\alias{any.ri}
\alias{min.ri}
\alias{max.ri}
\alias{range.ri}
\alias{sum.ri}
\alias{summary.ri}
\title{ Summaries of bit vectors }
\description{
  Fast aggregation functions for bit vectors.
}
\usage{
\method{all}{bit}(x, range = NULL, \dots)
\method{any}{bit}(x, range = NULL, \dots)
\method{min}{bit}(x, range = NULL, \dots)
\method{max}{bit}(x, range = NULL, \dots)
\method{range}{bit}(x, range = NULL, \dots)
\method{sum}{bit}(x, range = NULL, \dots)
\method{summary}{bit}(object, range = NULL, \dots)
\method{all}{bitwhich}(x, \dots)
\method{any}{bitwhich}(x, \dots)
\method{min}{bitwhich}(x, \dots)
\method{max}{bitwhich}(x, \dots)
\method{range}{bitwhich}(x, \dots)
\method{sum}{bitwhich}(x, \dots)
\method{summary}{bitwhich}(object, \dots)
\method{all}{ri}(x, \dots)
\method{any}{ri}(x, \dots)
\method{min}{ri}(x, \dots)
\method{max}{ri}(x, \dots)
\method{range}{ri}(x, \dots)
\method{sum}{ri}(x, \dots)
\method{summary}{ri}(object, \dots)
}
\arguments{
  \item{x}{ an object of class bit or bitwhich }
  \item{object}{ an object of class bit }
  \item{range}{ a \code{\link{ri}} or an integer vector of length==2 giving a range restriction for chunked processing }
  \item{\dots}{ formally required but not used }
}
\details{
  Bit summaries are quite fast because we use a double loop that fixes each word in a processor register.
  Furthermore we break out of looping as soon as possible.
}
\value{
  as expected
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{bit}}, \code{\link{all}}, \code{\link{any}}, \code{\link{min}}, \code{\link{max}}, \code{\link{range}}, \code{\link{sum}}, \code{\link{summary}} }
\examples{
  x <- as.bit(c(TRUE, TRUE))
  all(x)
  any(x)
  min(x)
  max(x)
  range(x)
  sum(x)
  summary(x)

  x <- as.bitwhich(c(TRUE, TRUE))
  all(x)
  any(x)
  min(x)
  max(x)
  range(x)
  sum(x)
  summary(x)

 \dontrun{
    n <- .Machine$integer.max
    x <- !bit(n)
    N <- 1000000L  # batchsize
    B <- n \%/\% N   # number of batches
    R <- n \%\% N    # rest

    message("Batched sum (52.5 sec on Centrino duo)")
    system.time({
      s <- 0L
      for (b in 1:B){
        s <- s + sum(x[((b-1L)*N+1L):(b*N)])
      }
      if (R)
        s <- s + sum(x[(n-R+1L):n])
    })

    message("Batched sum saving repeated memory allocation for the return vector
    (44.4 sec on Centrino duo)")
    system.time({
      s <- 0L
      l <- logical(N)
      for (b in 1:B){
        .Call("R_bit_extract", x, length(x), ((b-1L)*N+1L):(b*N), l, PACKAGE = "bit")
        s <- s + sum(l)
      }
      if (R)
        s <- s + sum(x[(n-R+1L):n])
    })

    message("C-coded sum (3.1 sec on Centrino duo)")
    system.time(sum(x))
 }
}
\keyword{ classes }
\keyword{ logic }
