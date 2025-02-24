% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gran_quantile.R
\name{quantile_gran}
\alias{quantile_gran}
\title{compute distances and groups from algorithm based on raw distributions}
\usage{
quantile_gran(
  .data,
  gran1 = NULL,
  gran2 = NULL,
  response = NULL,
  quantile_prob_val = seq(0.1, 0.9, 0.1),
  group = NULL
)
}
\arguments{
\item{.data}{a tsibble}

\item{gran1}{one granularity e.g. hour_day, day_week, wknd_wday}

\item{gran2}{one granularity distinct from gran1}

\item{response}{measured variable}

\item{quantile_prob_val}{values of probability for which distances between quantiles would be computed}

\item{group}{NULL if quantiles to be obtained for the key variable and the column name of the group variable if quantiles to be obtained for the group.}
}
\value{

}
\description{
compute distances and groups from algorithm based on raw distributions
}
\examples{
library(gravitas)
library(tidyverse)
sm <- smart_meter10 \%>\%
filter(customer_id \%in\% c("10006704", "10017936","10006414", "10018250"))
gran1 = "hour_day"
gran2 = NULL
response = "general_supply_kwh"
dist_gran(sm, "hour_day")
dist_gran(sm, "month_year")
sm \%>\% quantile_gran(gran1 = "hour_day")
group = tibble(customer_id = c("10006704", "10017936", "10006414", "10018250"), group = c(1,2,1,1))
sm_group <- sm \%>\% left_join(group)
.data <- sm
quantile_gran(sm_group, gran1, group = "group") # obtain quantiles for group
quantile_gran(sm, gran1, group = NULL) # obtain quantiles for customer
}
