#' This is my capstone project during the course "Mastering Software Development
#' in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
#' as a part of "Mastering Software Development in R Professional Certificate"
#' program on Coursera.
#' -----------------------------------------------------------------------------
#' WEEK 3 - Interactive map
#' -----------------------------------------------------------------------------
# data <- utils::read.delim("earthquakes.tsv")
# data <- eq_location_clean(eq_clean_data(data[-1,]))
# data <- dplyr::filter(data, Country == "MEXICO" &
#                         lubridate::year(Date) >= 2000)
# ---------------------------------------------------------------------------- #
#' Interactive map with a pop-up date
#' This function creates an interactive map to show the geographical locations
#' of the earthquakes in data. The size of each circle represents the magnitude
#' of the corresponding earthquake. When you click on a circle, you can see the
#' the chosen annotation (e.g. date) of this earthquake as a popup message.
#'
#' @param data data.frame
#' @param annot_col character
#' @import leaflet
#'
#' @return leaflet
#' @export
#'
#' @examples
#' \dontrun{
#' data <- eq_location_clean(eq_clean_data(data))
#' eq_map(data, "Date")}
eq_map <- function(data, annot_col){
  myleaflet <- leaflet::addTiles(leaflet::leaflet())
  myleaflet <- leaflet::addCircleMarkers(myleaflet, data = data, radius = ~ Mag,
                                   lng = ~ Longitude, lat = ~ Latitude,
                                   popup = data[[annot_col]])
  myleaflet
  return(myleaflet)
}
# ---------------------------------------------------------------------------- #
#' Creating html label
#' This function creates a html label including location and magnitude of each
#' earthquake and the number of deaths in them. The output can be used as a
#' popup message for \link{eq_map} function.
#'
#' @param data data.frame
#'
#' @return character
#' @export
#'
#' @examples
#' \dontrun{
#' data <- eq_location_clean(eq_clean_data(data))
#' data <- dplyr::mutate(data, popup_text = eq_create_label(data))
#' eq_map(data, "popup_text")}
eq_create_label <- function(data){
  annot_col <- paste0("<b>Location: </b>", data$Location.Name, "<br/>",
        "<b>Magnitude: </b>", data$Mag, "<br/>",
        "<b>Total deaths: </b>", data$Deaths)
  return(annot_col)
}
# ---------------------------------------------------------------------------- #
