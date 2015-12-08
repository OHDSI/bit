\name{is.sorted}
\alias{is.sorted}
\alias{na.count}
\alias{nvalid}
\alias{nunique}
\alias{nties}
\alias{is.sorted<-}
\alias{na.count<-}
\alias{nunique<-}
\alias{nties<-}
\title{
	Generics related to cache access
}
\description{
	These generics are packaged here for methods in packages \code{bit64} and \code{ff}.
}
\usage{
is.sorted(x, \dots)
is.sorted(x, \dots) <- value
na.count(x, \dots)
na.count(x, \dots) <- value
nvalid(x, \dots)
nunique(x, \dots)
nunique(x, \dots) <- value
nties(x, \dots)
nties(x, \dots) <- value
}
\arguments{
  \item{x}{
	some object
	}
  \item{value}{
	value assigned on responsibility of the user
	}
  \item{\dots}{
	ignored
	}
}
\details{
	see help of the available methods
}
\value{
	see help of the available methods
}
\author{
Jens Oehlschlägel <Jens.Oehlschlaegel@truecluster.com>
}
\seealso{
	\code{\link[bit64]{is.sorted.integer64}}, \code{\link[bit64]{na.count.integer64}}, \code{\link[bit64]{nvalid.integer64}}, \code{\link[bit64]{nunique.integer64}}, \code{\link[bit64]{nties.integer64}} \cr
}
\examples{
	methods("na.count")
}
\keyword{ environment }
\keyword{ methods }
