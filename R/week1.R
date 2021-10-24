#' This is my capstone project during the course "Mastering Software Development
#' in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
#' as a part of "Mastering Software Development in R Professional Certificate"
#' program on Coursera.
#' -----------------------------------------------------------------------------
#' WEEK 1 - Clean
#' -----------------------------------------------------------------------------
# for Windows, if you get an error about Java
# Sys.setenv(JAVA_HOME="C:/Program Files/Common Files/Datawatch/Drivers/7.1.5/jre/bin")
# read data: Earthquake Database by National Centers for Environmental
# Information, NOAA, USA (1995 - 2000)
# <https://www.ngdc.noaa.gov/hazel/view/hazards/earthquake/search>
# data <- utils::read.delim("earthquakes.tsv")
# data <- data[-1,]
# ---------------------------------------------------------------------------- #
#' Clean earthquake data
#' This function cleans the earthquake data retrieved from NOAA database. It
#' uses the archived data including the records dated before 1995.
#'
#' @param data data.frame -- the earthquake data base by NOAA (USA)
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{eq_clean_data(data)}
eq_clean_data <- function(data){
  data$Date <- as.Date(paste(data$Year, data$Mo,data$Dy, sep="-"),
                          "%Y-%m-%d")
  data$Latitude <- as.numeric(data$Latitude)
  data$Longitude <- as.numeric(data$Longitude)
  return(data)
}
# ---------------------------------------------------------------------------- #
#' Cleaning the location
#' This function creates a column including the country where the earthquake has
#' happened in title case format.
#'
#' @param data data.frame -- the earthquake data base by NOAA (USA)
#'
#' @return data.frame
#' @importFrom stringr str_remove
#' @importFrom stringr str_to_title
#' @export
#'
#' @examples
#' \dontrun{eq_location_clean(data)}
eq_location_clean <- function(data){
  data$Country <- sub("\\:.*", "", data$Location.Name)
  data$Location.Name <- stringr::str_remove(data$Location.Name, paste0(data$Country,": "))
  data$Location.Name <- stringr::str_to_title(data$Location.Name)
  return(data)
}
