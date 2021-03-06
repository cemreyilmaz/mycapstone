% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/week3.R
\name{eq_map}
\alias{eq_map}
\title{This is my capstone project during the course "Mastering Software Development
in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
as a part of "Mastering Software Development in R Professional Certificate"
program on Coursera.
-----------------------------------------------------------------------------
WEEK 3 - Interactive map
-----------------------------------------------------------------------------
Interactive map with a pop-up date
This function creates an interactive map to show the geographical locations
of the earthquakes in data. The size of each circle represents the magnitude
of the corresponding earthquake. When you click on a circle, you can see the
the chosen annotation (e.g. date) of this earthquake as a popup message.}
\usage{
eq_map(data, annot_col)
}
\arguments{
\item{data}{data.frame}

\item{annot_col}{character}
}
\value{
leaflet
}
\description{
This is my capstone project during the course "Mastering Software Development
in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
as a part of "Mastering Software Development in R Professional Certificate"
program on Coursera.
-----------------------------------------------------------------------------
WEEK 3 - Interactive map
-----------------------------------------------------------------------------
Interactive map with a pop-up date
This function creates an interactive map to show the geographical locations
of the earthquakes in data. The size of each circle represents the magnitude
of the corresponding earthquake. When you click on a circle, you can see the
the chosen annotation (e.g. date) of this earthquake as a popup message.
}
\examples{
\dontrun{
data <- eq_location_clean(eq_clean_data(data))
eq_map(data, "Date")}
}
