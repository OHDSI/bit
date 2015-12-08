\name{bit-package}
\alias{bit-package}
\alias{bit}
\alias{print.bit}
\docType{package}
\title{
   A class for vectors of 1-bit booleans
}
\description{
Package 'bit' provides bitmapped vectors of booleans (no NAs),
coercion from and to logicals, integers and integer subscripts;
fast boolean operators and fast summary statistics. \cr

With bit vectors you can store true binary booleans \{FALSE,TRUE\} at the expense
of 1 bit only, on a 32 bit architecture this means factor 32 less RAM and
factor 32 more speed on boolean operations. With this speed gain it even
pays-off to convert to bit in order to avoid a single boolean operation on
logicals or a single set operation on (longer) integer subscripts, the pay-off
is dramatic when such components are used more than once. \cr

Reading from and writing to bit is approximately as fast as accessing standard
logicals - mostly due to R's time for memory allocation. The package allows to
work with pre-allocated memory for return values by calling .Call() directly:
when evaluating the speed of C-access with pre-allocated vector memory, coping
from bit to logical requires only 70\% of the time for copying from logical to
logical; and copying from logical to bit comes at a performance penalty of 150\%. \cr

Since bit objects cannot be used as subsripts in R, a second class 'bitwhich'
allows to store selections as efficiently as possible with standard R types.
This is usefull either to represent parts of bit objects or to represent
very asymetric selections.  \cr

Class 'ri' (range index) allows to select ranges of positions for  chunked processing:
all three classes 'bit', 'bitwhich' and 'ri' can be used for subsetting 'ff' objects (ff-2.1.0 and higher).
}
\usage{
 bit(length)
 \method{print}{bit}(x, \dots)
}
\arguments{
  \item{length}{ length of vector in bits }
  \item{x}{ a bit vector }
  \item{\dots}{ further arguments to print }
}
\details{
\tabular{ll}{
   Package: \tab bit\cr
   Type: \tab Package\cr
   Version: \tab 1.1.0\cr
   Date: \tab 2012-06-05\cr
   License: \tab GPL-2\cr
   LazyLoad: \tab yes\cr
   Encoding: \tab latin1\cr
}

Index:
\tabular{rrrrl}{
   \bold{bit function}           \tab \bold{bitwhich function}          \tab \bold{ri function}                \tab \bold{see also}          \tab \bold{description} \cr
   \code{.BITS}                  \tab                                   \tab                                   \tab \code{\link{globalenv}}   \tab variable holding number of bits on this system \cr
   \code{\link{bit_init}}        \tab                                   \tab                                   \tab \code{\link{.First.lib}}  \tab initially allocate bit-masks (done in .First.lib) \cr
   \code{\link{bit_done}}        \tab                                   \tab                                   \tab \code{\link{.Last.lib}}   \tab finally de-allocate bit-masks (done in .Last.lib) \cr
   \code{\link{bit}}             \tab \code{\link{bitwhich}}            \tab \code{\link{ri}}                  \tab \code{\link{logical}}     \tab create bit object \cr
   \code{\link{print.bit}}       \tab \code{\link{print.bitwhich}}      \tab \code{\link{print.ri}}            \tab \code{\link{print}}       \tab print bit vector \cr
   \code{\link{length.bit}}      \tab \code{\link{length.bitwhich}}     \tab \code{\link{length.ri}}           \tab \code{\link{length}}      \tab get length of bit vector \cr
   \code{\link{length<-.bit}}    \tab \code{\link{length<-.bitwhich}}   \tab                                   \tab \code{\link{length<-}}    \tab change length of bit vector \cr
   \code{\link{c.bit}}           \tab \code{\link{c.bitwhich}}          \tab                                   \tab \code{\link{c}}           \tab concatenate bit vectors \cr
   \code{\link{is.bit}}          \tab \code{\link{is.bitwhich}}         \tab \code{\link{is.ri}}               \tab \code{\link{is.logical}}  \tab test for bit class \cr
   \code{\link{as.bit}}          \tab \code{\link{as.bitwhich}}         \tab                                   \tab \code{\link{as.logical}}  \tab generically coerce to bit or bitwhich \cr
   \code{\link{as.bit.logical}}  \tab \code{\link{as.bitwhich.logical}} \tab                                   \tab \code{\link{logical}}     \tab coerce logical to bit vector (FALSE => FALSE, c(NA, TRUE) => TRUE) \cr
   \code{\link{as.bit.integer}}  \tab \code{\link{as.bitwhich.integer}} \tab                                   \tab \code{\link{integer}}     \tab coerce integer to bit vector (0 => FALSE, ELSE => TRUE) \cr
   \code{\link{as.bit.double}}   \tab \code{\link{as.bitwhich.double}}  \tab                                   \tab \code{\link{double}}      \tab coerce double to bit vector (0 => FALSE, ELSE => TRUE) \cr
   \code{\link{as.double.bit}}   \tab \code{\link{as.double.bitwhich}}  \tab \code{\link{as.double.ri}}        \tab \code{\link{as.double}}   \tab coerce bit vector to double (0/1) \cr
   \code{\link{as.integer.bit}}  \tab \code{\link{as.integer.bitwhich}} \tab \code{\link{as.integer.ri}}       \tab \code{\link{as.integer}}  \tab coerce bit vector to integer (0L/1L) \cr
   \code{\link{as.logical.bit}}  \tab \code{\link{as.logical.bitwhich}} \tab \code{\link{as.logical.ri}}       \tab \code{\link{as.logical}}  \tab coerce bit vector to logical (FALSE/TRUE) \cr
   \code{\link{as.which.bit}}    \tab \code{\link{as.which.bitwhich}}   \tab \code{\link{as.which.ri}}         \tab \code{\link{as.which}}    \tab coerce bit vector to positive integer subscripts\cr
   \code{\link{as.bit.which}}    \tab \code{\link{as.bitwhich.which}}   \tab                                   \tab \code{\link{bitwhich}}    \tab coerce integer subscripts to bit vector \cr
   \code{\link{as.bit.bitwhich}} \tab \code{\link{as.bitwhich.bitwhich}}\tab                                   \tab                           \tab coerce from bitwhich  \cr
   \code{\link{as.bit.bit}}      \tab \code{\link{as.bitwhich.bit}}     \tab                                   \tab \code{\link{UseMethod}}   \tab coerce from bit \cr
   \code{\link{as.bit.ri}}       \tab \code{\link{as.bitwhich.ri}}      \tab                                   \tab                           \tab coerce from range index \cr
   \code{\link[ff]{as.bit.ff}}   \tab                                   \tab                                   \tab \code{\link[ff]{ff}}      \tab coerce ff boolean to bit vector \cr
   \code{\link[ff]{as.ff.bit}}   \tab                                   \tab                                   \tab \code{\link[ff]{as.ff}}   \tab coerce bit vector to ff boolean \cr
   \code{\link[ff]{as.hi.bit}}   \tab \code{\link[ff]{as.hi.bitwhich}}  \tab \code{\link[ff]{as.hi.ri}}        \tab \code{\link[ff]{as.hi}}   \tab coerce to hybrid index (requires package ff) \cr
   \code{\link[ff]{as.bit.hi}}   \tab \code{\link[ff]{as.bitwhich.hi}}  \tab                                   \tab                           \tab coerce from hybrid index (requires package ff) \cr
   \code{\link{[[.bit}}          \tab                                   \tab                                   \tab \code{\link{[[}}          \tab get single bit (index checked) \cr
   \code{\link{[[<-.bit}}        \tab                                   \tab                                   \tab \code{\link{[[<-}}        \tab set single bit (index checked) \cr
   \code{\link{[.bit}}           \tab                                   \tab                                   \tab \code{\link{[}}           \tab get vector of bits (unchecked) \cr
   \code{\link{[<-.bit}}         \tab                                   \tab                                   \tab \code{\link{[<-}}         \tab set vector of bits (unchecked) \cr
   \code{\link{!.bit}}           \tab \code{\link{!.bitwhich}}          \tab (works as second arg in           \tab \code{\link{!}}           \tab boolean NOT on bit \cr
   \code{\link{&.bit}}           \tab \code{\link{&.bitwhich}}          \tab  bit and bitwhich ops)            \tab \code{\link{&}}           \tab boolean AND on bit \cr
   \code{\link{|.bit}}           \tab \code{\link{|.bitwhich}}          \tab                                   \tab \code{\link{|}}           \tab boolean OR on bit \cr
   \code{\link{xor.bit}}         \tab \code{\link{xor.bitwhich}}        \tab                                   \tab \code{\link{xor}}         \tab boolean XOR on bit \cr
   \code{\link{!=.bit}}          \tab \code{\link{!=.bitwhich}}         \tab                                   \tab \code{\link{!=}}          \tab boolean unequality (same as XOR) \cr
   \code{\link{==.bit}}          \tab \code{\link{==.bitwhich}}         \tab                                   \tab \code{\link{==}}          \tab boolean equality \cr
   \code{\link{all.bit}}         \tab \code{\link{all.bitwhich}}        \tab \code{\link{all.ri}}              \tab \code{\link{all}}         \tab aggregate AND \cr
   \code{\link{any.bit}}         \tab \code{\link{any.bitwhich}}        \tab \code{\link{any.ri}}              \tab \code{\link{any}}         \tab aggregate OR \cr
   \code{\link{min.bit}}         \tab \code{\link{min.bitwhich}}        \tab \code{\link{min.ri}}              \tab \code{\link{min}}         \tab aggregate MIN (first TRUE position) \cr
   \code{\link{max.bit}}         \tab \code{\link{max.bitwhich}}        \tab \code{\link{max.ri}}              \tab \code{\link{max}}         \tab aggregate MAX (last TRUE position) \cr
   \code{\link{range.bit}}       \tab \code{\link{range.bitwhich}}      \tab \code{\link{range.ri}}            \tab \code{\link{range}}       \tab aggregate [MIN,MAX] \cr
   \code{\link{sum.bit}}         \tab \code{\link{sum.bitwhich}}        \tab \code{\link{sum.ri}}              \tab \code{\link{sum}}         \tab aggregate SUM (count of TRUE) \cr
   \code{\link{summary.bit}}     \tab \code{\link{summary.bitwhich}}    \tab \code{\link{summary.ri}}          \tab \code{\link{tabulate}}    \tab aggregate c(nFALSE, nTRUE, minRange, maxRange) \cr
   \code{\link{regtest.bit}}     \tab                                   \tab                                   \tab                           \tab regressiontests for the package \cr
 }
}
\value{
  \code{bit} returns a vector of integer sufficiently long to store 'length' bits
  (but not longer) with an attribute 'n' and class 'bit'
}
\author{
Jens Oehlschlägel <Jens.Oehlschlaegel@truecluster.com>

Maintainer: Jens Oehlschlägel <Jens.Oehlschlaegel@truecluster.com>
}
\note{
  Currently operations on bit objects have some overhead from R-calls. Do expect speed gains for vectors
  of length ~ 10000 or longer. \cr
  Since this package was created for high performance purposes, only positive integer subscripts are allowed:
  All R-functions behave as expected - i.e. they do not change their arguments and create new return values.
  If you want to save the time for return value memory allocation, you must use \code{\link{.Call}} directly
  (see the dontrun example in \code{\link{sum.bit}}).
}
\keyword{ package }
\keyword{ classes }
\keyword{ logic }
\seealso{ \code{\link{logical}} in base R and \code{\link[ff]{vmode}} in package 'ff' }
\examples{
  x <- bit(12)                                 # create bit vector
  x                                            # autoprint bit vector
  length(x) <- 16                              # change length
  length(x)                                    # get length
  x[[2]]                                       # extract single element
  x[[2]] <- TRUE                               # replace single element
  x[1:2]                                       # extract parts of bit vector
  x[1:2] <- TRUE                               # replace parts of bit vector
  as.which(x)                                  # coerce bit to subscripts
  x <- as.bit.which(3:4, 4)                    # coerce subscripts to bit
  as.logical(x)                                # coerce bit to logical
  y <- as.bit(c(FALSE, TRUE, FALSE, TRUE))     # coerce logical to bit
  is.bit(y)                                    # test for bit
  !x                                           # boolean NOT
  x & y                                        # boolean AND
  x | y                                        # boolean OR
  xor(x, y)                                    # boolean Exclusive OR
  x != y                                       # boolean unequality (same as xor)
  x == y                                       # boolean equality
  all(x)                                       # aggregate AND
  any(x)                                       # aggregate OR
  min(x)                                       # aggregate MIN (integer version of ALL)
  max(x)                                       # aggregate MAX (integer version of ANY)
  range(x)                                     # aggregate [MIN,MAX]
  sum(x)                                       # aggregate SUM (count of TRUE)
  summary(x)                                   # aggregate count of FALSE and TRUE

  \dontrun{
    message("\nEven for a single boolean operation transforming logical to bit pays off")
    n <- 10000000
    x <- sample(c(FALSE, TRUE), n, TRUE)
    y <- sample(c(FALSE, TRUE), n, TRUE)
    system.time(x|y)
    system.time({
       x <- as.bit(x)
       y <- as.bit(y)
    })
    system.time( z <- x | y )
    system.time( as.logical(z) )
    message("Even more so if multiple operations are needed :-)")

    message("\nEven for a single set operation transforming subscripts to bit pays off\n")
    n <- 10000000
    x <- sample(n, n/2)
    y <- sample(n, n/2)
    system.time( union(x,y) )
    system.time({
     x <- as.bit.which(x, n)
     y <- as.bit.which(y, n)
    })
    system.time( as.which.bit( x | y ) )
    message("Even more so if multiple operations are needed :-)")

    message("\nSome timings WITH memory allocation")
    n <- 2000000
    l <- sample(c(FALSE, TRUE), n, TRUE)
    # copy logical to logical
    system.time(for(i in 1:100){  # 0.0112
       l2 <- l
       l2[1] <- TRUE   # force new memory allocation (copy on modify)
       rm(l2)
    })/100
    # copy logical to bit
    system.time(for(i in 1:100){  # 0.0123
       b <- as.bit(l)
       rm(b)
    })/100
    # copy bit to logical
    b <- as.bit(l)
    system.time(for(i in 1:100){  # 0.009
       l2 <- as.logical(b)
       rm(l2)
    })/100
    # copy bit to bit
    b <- as.bit(l)
    system.time(for(i in 1:100){  # 0.009
       b2 <- b
       b2[1] <- TRUE   # force new memory allocation (copy on modify)
       rm(b2)
    })/100


    l2 <- l
    # replace logical by TRUE
    system.time(for(i in 1:100){
       l[] <- TRUE
    })/100
    # replace bit by TRUE (NOTE that we recycle the assignment  
		 # value on R side == memory allocation and assignment first)
    system.time(for(i in 1:100){
       b[] <- TRUE
    })/100
    # THUS the following is faster
    system.time(for(i in 1:100){
       b <- !bit(n)
    })/100

    # replace logical by logical
    system.time(for(i in 1:100){
       l[] <- l2
    })/100
    # replace bit by logical
    system.time(for(i in 1:100){
       b[] <- l2
    })/100
    # extract logical
    system.time(for(i in 1:100){
       l2[]
    })/100
    # extract bit
    system.time(for(i in 1:100){
       b[]
    })/100

    message("\nSome timings WITHOUT memory allocation (Serge, that's for you)")
    n <- 2000000L
    l <- sample(c(FALSE, TRUE), n, TRUE)
    b <- as.bit(l)
    # read from logical, write to logical
    l2 <- logical(n)
    system.time(for(i in 1:100).Call("R_filter_getset", l, l2, PACKAGE="bit")) / 100
    # read from bit, write to logical
    l2 <- logical(n)
    system.time(for(i in 1:100).Call("R_bit_get", b, l2, c(1L, n), PACKAGE="bit")) / 100
    # read from logical, write to bit
    system.time(for(i in 1:100).Call("R_bit_set", b, l2, c(1L, n), PACKAGE="bit")) / 100

  }
}
