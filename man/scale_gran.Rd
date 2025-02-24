% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_gran.R
\name{scale_gran}
\alias{scale_gran}
\title{robust_scaling of data marginal on categories of different granularities}
\usage{
scale_gran(.data, response = NULL, method = "none")
}
\arguments{
\item{.data}{a tsibble}

\item{response}{measured variable}

\item{method}{scaling method like "robust" (Robust sscaling), "nqt" (Normal-quantile transform)}

\item{gran1}{one granularity e.g. hour_day, day_week, wknd_wday}

\item{gran2}{one granularity distinct from gran1}
}
\value{
scale_gran
}
\description{
robust_scaling of data marginal on categories of different granularities
}
\examples{
library(gravitas)
library(tidyverse)
sm <- smart_meter10 \%>\%
  filter(customer_id \%in\% c("10006704", "10017936", "10006414", "10018250"))
gran1 <- "hour_day"
gran2 <- NULL
response <- "general_supply_kwh"
scale_gran(sm, response, method = "none")
scale_gran(sm, response, method = "robust")
scale_gran(sm, response, method = "nqt")

# todo : can add NQT marginal on each category?
}
