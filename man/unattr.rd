\name{unattr}
\alias{unattr}
\title{
Attribute removal
}
\description{
Returns object with attributes removed
}
\usage{
unattr(x)
}
\arguments{
  \item{x}{
any R object
}
}
\details{
attribute removal copies the object as usual
}
\value{
a similar object with attributes removed
}
\author{
Jens Oehlschlägel
}

\seealso{
  \code{\link{attributes}}, \code{\link{setattributes}}, \code{\link{unclass}}
}
\examples{
  bit(2)[]
  unattr(bit(2)[])
}
\keyword{attribute}
