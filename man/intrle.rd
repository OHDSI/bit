\name{intrle}
\alias{intrle}
\alias{intisasc}
\alias{intisdesc}
\title{ Hybrid Index, C-coded utilities }
\description{
  These C-coded utilitites speed up index preprocessing considerably
}
\usage{
intrle(x)
intisasc(x)
intisdesc(x)
}
\arguments{
  \item{x}{ an integer vector }
}
\details{
  \code{intrle} is by factor 50 faster and needs less RAM (2x its input vector) compared to \code{\link{rle}} which needs 9x the RAM of its input vector.
  This is achieved because we allow the C-code of \code{intrle} to break when it turns out, that rle-packing will not achieve a
  compression factor of 3 or better.
  \cr
  \code{intisasc} is a faster version of \code{\link{is.unsorted}}: it checks whether \code{x} is sorted and returns NA \code{x} contains NAs.
  \cr
  \code{intisdesc} checks for being sorted descending and assumes that the input \code{x} contains no NAs (is used after \code{intisasc} and does not check for NAs).
}
\value{
  \code{intrle} returns an object of class \code{\link{rle}} or NULL, if rle-compression is not efficient (compression factor <3 or length(x)<3).
  \cr
  \code{intisasc} returns one of \code{FALSE, NA, TRUE}
  \cr
  \code{intisdesc} returns one of \code{FALSE, TRUE} (if the input contains NAs, the output is undefined)
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link[ff]{hi}}, \code{\link{rle}}, \code{\link{is.unsorted}}, \code{\link[ff]{is.sorted}} }
\examples{
  intrle(sample(1:100))
  intrle(diff(1:100))
  intisasc(1:100)
  intisasc(100:1)
  intisasc(c(NA, 1:100))
  intisdesc(1:100)
  intisdesc(100:1)
}

\keyword{ IO }
\keyword{ data }
