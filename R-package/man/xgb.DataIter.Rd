% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xgb.DMatrix.R
\name{xgb.DataIter}
\alias{xgb.DataIter}
\title{XGBoost Data Iterator}
\usage{
xgb.DataIter(env = new.env(), f_next, f_reset)
}
\arguments{
\item{env}{An R environment to pass to the callback functions supplied here, which can be
used to keep track of variables to determine how to handle the batches.

For example, one might want to keep track of an iteration number in this environment in order
to know which part of the data to pass next.}

\item{f_next}{\verb{function(env)} which is responsible for:
\itemize{
\item Accessing or retrieving the next batch of data in the iterator.
\item Supplying this data by calling function \code{\link[=xgb.DataBatch]{xgb.DataBatch()}} on it and returning the result.
\item Keeping track of where in the iterator batch it is or will go next, which can for example
be done by modifiying variables in the \code{env} variable that is passed here.
\item Signaling whether there are more batches to be consumed or not, by returning \code{NULL}
when the stream of data ends (all batches in the iterator have been consumed), or the result from
calling \code{\link[=xgb.DataBatch]{xgb.DataBatch()}} when there are more batches in the line to be consumed.
}}

\item{f_reset}{\verb{function(env)} which is responsible for reseting the data iterator
(i.e. taking it back to the first batch, called before and after the sequence of batches
has been consumed).

Note that, after resetting the iterator, the batches will be accessed again, so the same data
(and in the same order) must be passed in subsequent iterations.}
}
\value{
An \code{xgb.DataIter} object, containing the same inputs supplied here, which can then
be passed to \code{\link[=xgb.ExternalDMatrix]{xgb.ExternalDMatrix()}}.
}
\description{
Interface to create a custom data iterator in order to construct a DMatrix
from external memory.

This function is responsible for generating an R object structure containing callback
functions and an environment shared with them.

The output structure from this function is then meant to be passed to \code{\link[=xgb.ExternalDMatrix]{xgb.ExternalDMatrix()}},
which will consume the data and create a DMatrix from it by executing the callback functions.

For more information, and for a usage example, see the documentation for \code{\link[=xgb.ExternalDMatrix]{xgb.ExternalDMatrix()}}.
}
\seealso{
\code{\link[=xgb.ExternalDMatrix]{xgb.ExternalDMatrix()}}, \code{\link[=xgb.DataBatch]{xgb.DataBatch()}}.
}
