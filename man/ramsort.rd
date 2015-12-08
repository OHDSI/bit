\name{ramsort}
\alias{ramsort}
\alias{shellsort}
\alias{quicksort}
\alias{mergesort}
\alias{radixsort}
\alias{keysort}
\alias{ramorder}
\alias{shellorder}
\alias{quickorder}
\alias{mergeorder}
\alias{radixorder}
\alias{keyorder}
\alias{ramsortorder}
\alias{shellsortorder}
\alias{quicksortorder}
\alias{mergesortorder}
\alias{radixsortorder}
\alias{keysortorder}
\title{
   Generics for in-RAM sorting and ordering
}
\description{
These are generic stubs for low-level sorting and ordering methods implemented in packages 
'bit64'  and 'ff'.
  The \code{..sortorder} methods do sorting and ordering at once, which requires more RAM than ordering but is (almost) as fast as as sorting.
}
\usage{
 ramsort(x, \dots)
 ramorder(x, i, \dots)
 ramsortorder(x, i, \dots)
 mergesort(x, \dots)
 mergeorder(x, i, \dots)
 mergesortorder(x, i, \dots)
 quicksort(x, \dots)
 quickorder(x, i, \dots)
 quicksortorder(x, i, \dots)
 shellsort(x, \dots)
 shellorder(x, i, \dots)
 shellsortorder(x, i, \dots)
 radixsort(x, \dots)
 radixorder(x, i, \dots)
 radixsortorder(x, i, \dots)
 keysort(x, \dots)
 keyorder(x, i, \dots)
 keysortorder(x, i, \dots)
}
\arguments{
  \item{x}{ a vector to be sorted by \code{\link{ramsort}} and \code{\link{ramsortorder}}, i.e. the output of  \code{\link{sort}} }
  \item{i}{ integer positions to be modified by \code{\link{ramorder}} and \code{\link{ramsortorder}}, default is 1:n, in this case the output is similar to \code{\link{order}} }
  \item{\dots}{ further arguments to the sorting methods }
}
\details{
 The \code{sort} generics do sort their argument 'x', some methods need temporary RAM of the same size as 'x'. 
 The \code{order} generics do order their argument 'i' leaving 'x' as it was, 
   some methods need temporary RAM of the same size as 'i'. 
 The \code{sortorder} generics do sort their argument 'x' and order their argument 'i', 
   this way of ordering is much faster at the price of requiring temporary RAM for both, 
   'x' and 'i', if the method requires temporary RAM.
 The \code{ram} generics are high-level functions containing an optimizer that chooses the 'best' algorithms given some context. 
}
\section{Index of implemented methods}{
\tabular{rrl}{
   \bold{generic} \tab \bold{ff}          \tab \bold{bit64} \cr
   \code{ramsort} \tab \code{\link[ff]{ramsort.default}} \tab \code{\link[bit64]{ramsort.integer64}} \cr
   \code{shellsort} \tab \code{\link[ff]{shellsort.default}} \tab \code{\link[bit64]{shellsort.integer64}} \cr
   \code{quicksort} \tab  \tab \code{\link[bit64]{quicksort.integer64}} \cr
   \code{mergesort} \tab \code{\link[ff]{mergesort.default}} \tab \code{\link[bit64]{mergesort.integer64}} \cr
   \code{radixsort} \tab \code{\link[ff]{radixsort.default}} \tab \code{\link[bit64]{radixsort.integer64}} \cr
   \code{keysort} \tab \code{\link[ff]{keysort.default}} \tab  \cr
 \cr
   \bold{generic} \tab \bold{ff}          \tab \bold{bit64} \cr
   \code{ramorder} \tab \code{\link[ff]{ramorder.default}} \tab \code{\link[bit64]{ramorder.integer64}} \cr
   \code{shellorder} \tab \code{\link[ff]{shellorder.default}} \tab \code{\link[bit64]{shellorder.integer64}} \cr
   \code{quickorder} \tab  \tab \code{\link[bit64]{quickorder.integer64}} \cr
   \code{mergeorder} \tab \code{\link[ff]{mergeorder.default}} \tab \code{\link[bit64]{mergeorder.integer64}} \cr
   \code{radixorder} \tab \code{\link[ff]{radixorder.default}} \tab \code{\link[bit64]{radixorder.integer64}} \cr
   \code{keyorder} \tab \code{\link[ff]{keyorder.default}} \tab  \cr
 \cr
   \bold{generic} \tab \bold{ff}          \tab \bold{bit64} \cr
   \code{ramsortorder} \tab  \tab \code{\link[bit64]{ramsortorder.integer64}} \cr
   \code{shellsortorder} \tab  \tab \code{\link[bit64]{shellsortorder.integer64}} \cr
   \code{quicksortorder} \tab  \tab \code{\link[bit64]{quicksortorder.integer64}} \cr
   \code{mergesortorder} \tab  \tab \code{\link[bit64]{mergesortorder.integer64}} \cr
   \code{radixsortorder} \tab  \tab \code{\link[bit64]{radixsortorder.integer64}} \cr
   \code{keysortorder} \tab  \tab  \cr
}
}
\note{
 Note that these methods purposely violate the functional programming paradigm: they are called for the side-effect of changing some of their arguments.
  The rationale behind this is that sorting is very RAM-intensive and in certain
  situations we might not want to allocate additional memory if not necessary to do so.
 The \code{sort}-methods change \code{x}, the \code{order}-methods change \code{i}, and the \code{sortoder}-methods change both \code{x} and \code{i}
  You as the user are responsible to create copies of the input data 'x' and 'i' 
  if you need non-modified versions.
}
\value{
  These functions return the number of \code{NAs} found or assumed during sorting
}
\author{
Jens Oehlschlägel <Jens.Oehlschlaegel@truecluster.com>
}
\keyword{univar}
\keyword{manip}
\keyword{arith}
\seealso{ \code{\link{sort}}  and \code{\link{order}} in base R}
