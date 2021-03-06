% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/week2.R
\name{geom_timeline_label}
\alias{geom_timeline_label}
\title{Earthquakes over Time by Location
This function draws a point for each earthquake. Different than
\link{geom_timeline} function, it labels the earthquakes with a magnitude
greater than the given number (0-9).}
\usage{
geom_timeline_label(data, n_max)
}
\arguments{
\item{data}{data.frame}

\item{n_max}{numeric}
}
\value{
ggplot
}
\description{
Earthquakes over Time by Location
This function draws a point for each earthquake. Different than
\link{geom_timeline} function, it labels the earthquakes with a magnitude
greater than the given number (0-9).
}
\examples{
\dontrun{
data <- eq_location_clean(eq_clean_data(data))
geom_timeline_label(data,7)}
}
