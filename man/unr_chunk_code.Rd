% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unr_chunk_code.R
\name{unr_chunk_code}
\alias{unr_chunk_code}
\title{Clean parts of chunk code}
\usage{
unr_chunk_code(code, separator = "#break", pipes = c("|>", "\%>\%", "+"))
}
\arguments{
\item{code}{Lines of code to clean}

\item{separator}{Separator that is used to separate slides}

\item{pipes}{Pipes to remove from the last row}
}
\value{
Cleaned vector of code
}
\description{
In a vector of code lines, remove all breaks. In the last line, all
pipes are removed as well.
}
