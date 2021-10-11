#' This is my capstone project during the course "Mastering Software Development
#' in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
#' as a part of "Mastering Software Development in R Professional Certificate"
#' program on Coursera.
#' -----------------------------------------------------------------------------
#' for Windows, if you get an error about Java
# Sys.setenv(JAVA_HOME="C:/Program Files/Common Files/Datawatch/Drivers/7.1.5/jre/bin")
#' read data: Earthquake Strong Motion Data (1933-1994) by National Centers for
#' Environmenta Information, NOAA, USA
#' <https://www.ngdc.noaa.gov/hazard/strong.shtml>
# path <- "NCEI-strong-motion.xlsx"
# data <- xlsx::read.xlsx(path, "Sheet1", rowIndex = 13:15685, colIndex = 1:36)
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
  data["Date"] <- as.Date(paste(unlist(data["Year"]), unlist(data["Mo"]),
                                unlist(data["Dy"]), sep="-"))
  data["Latitude"] <- as.numeric(unlist(data["Latitude"]))
  data["Longitude"] <- as.numeric(unlist(data["Longitude"]))
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
#' @importFrom stringr str_to_title
#' @export
#'
#' @examples
#' \dontrun{eq_location_clean(data)}
eq_location_clean <- function(data){
  data["Location_Name"] <- stringr::str_to_title(as.character(unlist(data["Country.1"])))
  data["Location_Name"][data["Location_Name"]=="Usa"] <- "USA"
  return(data)
}
