\name{chunk}
\alias{chunk}
\alias{chunk.default}
\title{ Chunked range index }
\description{
  creates a sequence of range indexes using a syntax not completely unlike 'seq'
}
\usage{
chunk(\dots)
\method{chunk}{default}(from = NULL, to = NULL, by = NULL, length.out = NULL, along.with = NULL
, overlap = 0L, method = c("bbatch", "seq"), maxindex = NA, \dots)
}
\arguments{
  \item{from}{ the starting value of the sequence. }
  \item{to}{ the (maximal) end value of the sequence. }
  \item{by}{ increment of the sequence }
  \item{length.out}{ desired length of the sequence. }
  \item{along.with}{ take the length from the length of this argument. }
  \item{overlap}{ number of values to overlap (will lower the starting value of the sequence, the first range becomes smaller }
  \item{method}{ default 'bbatch' will try to balance the chunk size, see \code{\link{bbatch}}, 'seq' will create chunks like \code{\link[base]{seq}} }
  \item{maxindex}{ passed to \code{\link{ri}} }
  \item{\dots}{ ignored }
}
\details{
  \code{chunk} is generic, the default method is described here, other methods that automatically consider RAM needs are provided with package 'ff', see for example \code{\link[ff]{chunk.ffdf}}
}
\section{available methods}{
  \code{chunk.default}, \code{\link[ff]{chunk.bit}}, \code{\link[ff]{chunk.ff_vector}}, \code{\link[ff]{chunk.ffdf}}
}
\value{
  \code{chunk.default} returns a list of \code{\link{ri}} objects representing chunks of subscripts
}
\author{ Jens Oehlschl�gel }
\seealso{ \code{\link{ri}},  \code{\link[base]{seq}}, \code{\link{bbatch}} }
\examples{
  chunk(1, 100, by=30)
  chunk(1, 100, by=30, method="seq")
   \dontrun{
require(foreach)
m <- 10000
k <- 1000
n <- m*k
message("Four ways to loop from 1 to n. Slowest foreach to fastest chunk is 1700:1 
on a dual core notebook with 3GB RAM\n")
z <- 0L; 
print(k*system.time({it <- icount(m); foreach (i = it) \%do\% { z <- i; NULL }}))
z

z <- 0L
print(system.time({i <- 0L; while (i<n) {i <- i + 1L; z <- i}}))
z

z <- 0L
print(system.time(for (i in 1:n) z <- i))
z

z <- 0L; n <- m*k; 
print(system.time(for (ch in chunk(1, n, by=m)){for (i in ch[1]:ch[2])z <- i}))
z

message("Seven ways to calculate sum(1:n). 
 Slowest foreach to fastest chunk is 61000:1 on a dual core notebook with 3GB RAM\n")
print(k*system.time({it <- icount(m); foreach (i = it, .combine="+") \%do\% { i }}))

z <- 0; 
print(k*system.time({it <- icount(m); foreach (i = it) \%do\% { z <- z + i; NULL }}))
z

z <- 0; print(system.time({i <- 0L;while (i<n) {i <- i + 1L; z <- z + i}})); z

z <- 0; print(system.time(for (i in 1:n) z <- z + i)); z

print(system.time(sum(as.double(1:n))))

z <- 0; n <- m*k
print(system.time(for (ch in chunk(1, n, by=m)){for (i in ch[1]:ch[2])z <- z + i}))
z

z <- 0; n <- m*k
print(system.time(for (ch in chunk(1, n, by=m)){z <- z+sum(as.double(ch[1]:ch[2]))}))
z
   }
}
\keyword{ data }