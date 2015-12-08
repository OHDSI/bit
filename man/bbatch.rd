\name{bbatch}
\alias{bbatch}
\title{ Balanced Batch sizes }
\description{
  \command{bbatch} calculates batch sizes so that they have rather balanced sizes than very different sizes
}
\usage{
bbatch(N, B)
}
\arguments{
  \item{N}{ total size }
  \item{B}{ desired batch size }
}
\value{
  a list with components
  \item{ b }{ the batch size }
  \item{ nb }{ the number of batches }
  \item{ rb }{ the size of the rest }
}
\details{
  Tries to have \code{rb==0} or \code{rb} as close to \code{b} as possible while guaranteing that \code{rb < b && (b - rb) <= min(nb, b)}
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{repfromto}}, \code{\link[ff]{ffvecapply}} }
\examples{
  bbatch(100, 24)
}
\keyword{ IO }
\keyword{ data }
