% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/animation.R
\name{align_axes}
\alias{align_axes}
\title{Aligns plot axes}
\usage{
align_axes(unaligned_plots)
}
\description{
Useful when giving a talk and adding elements to the same set of axes
in subsequent slides.
}
\details{
Operates in place (meaning that the original plots are themselves updated).
}
\examples{
plots <- c(4, 6, 8) \%>\% map(make_plot)
align_axes(plots)

}
