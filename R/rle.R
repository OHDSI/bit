# rle utilities for bit and ff
# (c) 2007-2009 Jens Oehlschägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-09-03
# Last changed: 2007-10-25

# source("D:/mwp/eanalysis/bit/R/rle.R")

#! \name{intrle}
#! \alias{intrle}
#! \alias{intisasc}
#! \alias{intisdesc}
#! \title{ Hybrid Index, C-coded utilities }
#! \description{
#!   These C-coded utilitites speed up index preprocessing considerably
#! }
#! \usage{
#! intrle(x)
#! intisasc(x)
#! intisdesc(x)
#! }
#! \arguments{
#!   \item{x}{ an integer vector }
#! }
#! \details{
#!   \code{intrle} is by factor 50 faster and needs less RAM (2x its input vector) compared to \code{\link{rle}} which needs 9x the RAM of its input vector.
#!   This is achieved because we allow the C-code of \code{intrle} to break when it turns out, that rle-packing will not achieve a
#!   compression factor of 3 or better.
#!   \cr
#!   \code{intisasc} is a faster version of \code{\link{is.unsorted}}: it checks whether \code{x} is sorted and returns NA \code{x} contains NAs.
#!   \cr
#!   \code{intisdesc} checks for being sorted descending and assumes that the input \code{x} contains no NAs (is used after \code{intisasc} and does not check for NAs).
#! }
#! \value{
#!   \code{intrle} returns an object of class \code{\link{rle}} or NULL, if rle-compression is not efficient (compression factor <3 or length(x)<3).
#!   \cr
#!   \code{intisasc} returns one of \code{FALSE, NA, TRUE}
#!   \cr
#!   \code{intisdesc} returns one of \code{FALSE, TRUE} (if the input contains NAs, the output is undefined)
#! }
#! \author{ Jens Oehlschlägel }
#! \seealso{ \code{\link[ff]{hi}}, \code{\link{rle}}, \code{\link{is.unsorted}}, \code{\link[ff]{is.sorted}} }
#! \examples{
#!   intrle(sample(1:100))
#!   intrle(diff(1:100))
#!   intisasc(1:100)
#!   intisasc(100:1)
#!   intisasc(c(NA, 1:100))
#!   intisdesc(1:100)
#!   intisdesc(100:1)
#! }
#!
#! \keyword{ IO }
#! \keyword{ data }


# -- check for sorting and NAs, 0s can be checked later when sorted ------------------

# NA=NAs FALSE=NotAscending TRUE=OK
intisasc <- function(x){
  stopifnot(is.integer(x))
 .Call("int_check_ascending", x, PACKAGE="bit")
}

# FALSE=NotDescending TRUE=OK (assumes no NAs, i.e. need to use intisasc first)
intisdesc <- function(x){
  stopifnot(is.integer(x))
 .Call("int_check_descending", x, PACKAGE="bit")
}


# -- fast and efficient rle ------------------

# integer only
# returns rle object only if n>2 && rle is efficient (length(values)+lengths(lengths))<=length(x)
# returns NULL if n<3 || rle is inefficient
intrle <- function(x){
  stopifnot(is.integer(x))
 .Call("int_rle", x, PACKAGE="bit")
}



# -- basic sequence packing and unpacking ---------------------------------------------------

#! \name{rlepack}
#! \alias{rlepack}
#! \alias{rlepack.integer}
#! \alias{rleunpack}
#! \alias{rleunpack.rlepack}
#! \alias{rev.rlepack}
#! \alias{unique.rlepack}
#! \alias{anyDuplicated.rlepack}
#! \title{ Hybrid Index, rle-pack utilities }
#! \description{
#!   Basic utilities for rle packing and unpacking and apropriate methods for \code{\link{rev}} and \code{\link{unique}}.
#! }
#! \usage{
#! rlepack(x, \dots)
#! \method{rlepack}{integer}(x, pack = TRUE, \dots)
#! rleunpack(x)
#! \method{rleunpack}{rlepack}(x)
#! \method{rev}{rlepack}(x)
#! \method{unique}{rlepack}(x, incomparables = FALSE, \dots)
#! \method{anyDuplicated}{rlepack}(x, incomparables = FALSE, \dots)
#! }
#! \arguments{
#!   \item{x}{ in 'rlepack' an integer vector, in the other functions an object of class 'rlepack'}
#!   \item{pack}{ FALSE to suppress packing }
#!   \item{incomparables}{ just to keep R CMD CHECK quiet (not used) }
#!   \item{\dots}{ just to keep R CMD CHECK quiet (not used) }
#! }
#! \value{
#!   A list with components
#!   \item{ first }{ the first element of the packed sequence }
#!   \item{ dat   }{ either an object of class \code{\link{rle}} or the complete input vector \code{x} if rle-packing is not efficient }
#!   \item{ last  }{ the last element of the packed sequence }
#! }
#! \author{ Jens Oehlschlägel }
#! \seealso{ \code{\link[ff]{hi}}, \code{\link{intrle}}, \code{\link{rle}}, \code{\link{rev}}, \code{\link{unique}} }
#! \examples{
#!   x <- rlepack(rep(0L, 10))
#!\dontshow{
#!  for (x in list(10:1, 1:10, c(10:1,1:10), c(1:10,10:1), sample(100), sample(100, 100, TRUE), sample(10, 100, TRUE))){
#!    stopifnot(identical(rleunpack(rlepack(x)), x))
#!    stopifnot(identical(rleunpack(unique(rlepack(x))), unique(x)))
#!    stopifnot(identical(anyDuplicated(rlepack(x)), anyDuplicated(x)))
#!  }
#!}
#! }
#! \keyword{ IO }
#! \keyword{ data }

#setOldClass("rlepack")

rlepack <- function(x, ...) 
UseMethod("rlepack")

rlepack.integer <- function(
  x
, pack = TRUE   # TRUE / FALSE
, ... # dummy to keep R CMD check quiet
){
  stopifnot(is.integer(x))
  n <- length(x)
  if (n>1){
    if (pack)
      r <- intrle(diff(x))  # returns NULL if rle is inefficient, old condition was 2*length(r$lengths)<n
    else
      r <- NULL
    structure(list(first=x[1], dat=if (is.null(r)) x else r, last=x[n]), class="rlepack")
  }else if (n==1){
    structure(list(first=x[1], dat=x, last=x[1]), class="rlepack")
  }else{
    structure(list(first=as.integer(NA), dat=x, last=as.integer(NA)), class="rlepack")
  }
}

rleunpack <- function(x) 
UseMethod("rleunpack")

rleunpack.rlepack <- function(x){
  if (inherits(x$dat, "rle"))
    as.integer(cumsum(c(x$first, rep(x$dat$values, x$dat$lengths))))
  else
    x$dat
}


rev.rlepack <- function(x){
  if (inherits(x$dat,"rle")){
    x$dat$values <- -rev(x$dat$values)
    x$dat$lengths <- rev(x$dat$lengths)
  }else{
    x$dat <- rev(x$dat)
  }
  buf <- x$first
  x$first <- x$last
  x$last <- buf
  x
}


# beware: only for sorted input identical with unique()
# beware: rlepack(unique(x)) is faster than unique(rlepack(x))
# we use this only in hi() and as.hi.default()
unique.rlepack <- function(x
, incomparables = FALSE # dummy to keep R CMD check quiet
, ... # dummy to keep R CMD check quiet
){
  if (inherits(x$dat,"rle")){
    tab <- tabulate(sign(x$dat$values)+2L, nbins=3L)
    if (tab[1] && tab[3])
      x <- rlepack(unique(rleunpack(x)))
    else if (tab[2]){
      x$dat$lengths <- x$dat$lengths[x$dat$values != 0]
      x$dat$values <- x$dat$values[x$dat$values != 0]
    }
    # else nothing to do: no repeated values
  }else{
    x$dat <- unique(x$dat)
  }
  x
}


# beware: only for sorted input identical with unique()
# beware: returns TRUE/FALSE, not position of first duplicate
anyDuplicated.rlepack <- function(x
, incomparables = FALSE # dummy to keep R CMD check quiet
, ... # dummy to keep R CMD check quiet
){
  if (inherits(x$dat,"rle")){
    tab <- tabulate(sign(x$dat$values)+2L, nbins=3L)
    if (tab[1] && tab[3])
      anyDuplicated(rleunpack(x))
    else if (tab[2]){
      w <- .Call("first_zero", x$dat$values, PACKAGE="bit")
      if (w)
        if(w>1L)
          sum(x$dat$lengths[1:(w-1L)]) + 2L
        else 
          2L
      else
        0L
    }
    else
      0L
  }else{
    anyDuplicated(x$dat)
  }
}

