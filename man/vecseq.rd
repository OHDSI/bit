\name{vecseq}
\alias{vecseq}
\title{ Vectorized Sequences }
\description{
  \command{vecseq} returns concatenated multiple sequences
}
\usage{
 vecseq(x, y=NULL, concat=TRUE, eval=TRUE)
}
\arguments{
  \item{x}{ vector of sequence start points }
  \item{y}{ vector of sequence end points (if \code{is.null(y)} then \code{x} are taken as endpoints, all starting at 1) }
  \item{concat}{ vector of sequence end points (if \code{is.null(y)} then \code{x} are taken as endpoints, all starting at 1) }
  \item{eval}{ vector of sequence end points (if \code{is.null(y)} then \code{x} are taken as endpoints, all starting at 1) }
}
\details{
  This is a generalization of \code{\link{sequence}} in that you can choose sequence starts other than 1 and also have options to no concat and/or return a call instead of the evaluated sequence.
}
\value{
  if \code{concat==FALSE} and \code{eval==FALSE} a list with n calls that generate sequences \cr
  if \code{concat==FALSE} and \code{eval==TRUE } a list with n sequences \cr
  if \code{concat==TRUE } and \code{eval==FALSE} a single call generating the concatenated sequences \cr
  if \code{concat==TRUE } and \code{eval==TRUE } an integer vector of concatentated sequences
}
\author{ Angelo Canty, Jens Oehlschlägel }
\seealso{ \code{\link{:}}, \code{\link{seq}}, \code{\link{sequence}} }
\examples{
  sequence(c(3,4))
  vecseq(c(3,4))
  vecseq(c(1,11), c(5, 15))
  vecseq(c(1,11), c(5, 15), concat=FALSE, eval=FALSE)
  vecseq(c(1,11), c(5, 15), concat=FALSE, eval=TRUE)
  vecseq(c(1,11), c(5, 15), concat=TRUE, eval=FALSE)
  vecseq(c(1,11), c(5, 15), concat=TRUE, eval=TRUE)
}
\keyword{ manip }
