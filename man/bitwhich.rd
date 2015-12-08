\name{bitwhich}
\alias{bitwhich}
\alias{print.bitwhich}
\title{ A class for vectors representing asymetric selections }
\description{
  A bitwhich object like the result of \code{\link{which}} and \code{\link{as.which}} does represent integer subscript positions,
  but bitwhich objects represent some subscripts rather with negative integers, if this needs less space.
  The extreme cases of selecting all/none subscripts are represented by TRUE/FALSE.
  This needs less RAM compared to \code{\link{logical}} (and often less than \code{\link{as.which}}).
  Logical operations are fast if the selection is asymetric (only few or almost all selected).
}
\usage{
bitwhich(maxindex, poslength = NULL, x = NULL)
}
\arguments{
  \item{maxindex}{ the length of the vector (sum of all TRUEs and FALSEs) }
  \item{poslength}{ Only use if x is not NULL: the sum of all TRUEs }
  \item{x}{ Default NULL or FALSE or unique negative integers or unique positive integers or TRUE}
}
\value{
  An object of class 'bitwhich' carrying two attributes
  \item{maxindex}{ see above }
  \item{poslength}{ see above }
}
\details{
  class 'bitwhich' represents a boolean selection in one of the following ways
  \itemize{
   \item FALSE to select nothing
   \item TRUE to select everything
   \item unique positive integers to select those
   \item unique negative integers to exclude those
  }
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{as.bitwhich}}, \code{\link{as.which}}, \code{\link{bit}} }
\examples{
 bitwhich(12, x=c(1,3), poslength=2)
 bitwhich(12, x=-c(1,3), poslength=10)
}
\keyword{ classes }
\keyword{ logic }
