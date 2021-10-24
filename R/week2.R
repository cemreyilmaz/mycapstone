#' This is my capstone project during the course "Mastering Software Development
#' in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
#' as a part of "Mastering Software Development in R Professional Certificate"
#' program on Coursera.
#' -----------------------------------------------------------------------------
#' WEEK 2 - Visualize
#' -----------------------------------------------------------------------------
# data <- utils::read.delim("earthquakes.tsv")
# data <- eq_location_clean(eq_clean_data(data[-1,]))
# ---------------------------------------------------------------------------- #
#' Earthquakes over Time
#' This function draws a point for each earthquake from the min to max date in
#' data. The size of points indicates the magnitude of earthquake and the color
#' indicates the number of deaths in each occurrence.
#'
#' @param data data.frame -- the earthquake data base by NOAA (USA)
#' @import ggplot2
#'
#' @return ggplot
#' @export
#'
#' @examples
#' \dontrun{
#' data <- eq_location_clean(eq_clean_data(data))
#' geom_timeline(data)}
geom_timeline <- function(data){
  p <- ggplot2::ggplot(data) +
    ggplot2::geom_point(mapping = ggplot2::aes(x = Date,
                                              y = 1,
                                              color = Deaths,
                                              size = Mag),
                        alpha = .25, na.rm = T)+
    ggplot2::theme(axis.title.y=ggplot2::element_blank(),
          axis.text.y=ggplot2::element_blank(),
          axis.ticks.y=ggplot2::element_blank())+
    ggplot2::ggtitle("Earthquakes over Time")+
    ggplot2::labs(size = "Richter scale value")
  p
  return(p)
}
# ---------------------------------------------------------------------------- #
#' Earthquakes over Time by Location
#' This function draws a point for each earthquake. Different than
#' \link{geom_timeline} function, it labels the earthquakes with a magnitude
#' greater than the given number (0-9).
#'
#' @param data data.frame
#' @param n_max numeric
#' @import ggplot2
#' @import ggrepel
#'
#' @return ggplot
#' @export
#'
#' @examples
#' \dontrun{
#' data <- eq_location_clean(eq_clean_data(data))
#' geom_timeline_label(data,7)}
geom_timeline_label <- function(data,n_max){
  p <- ggplot2::ggplot(data, mapping = ggplot2::aes(x = Date,
                                                    y = Country,
                                                    color = Deaths,
                                                    size = Mag)) +
    ggplot2::geom_point(alpha = .25, na.rm = T)+
    ggplot2::ggtitle("Earthquakes over Time by Location")+
    ggplot2::labs(size = "Richter scale value")+
    ggrepel::geom_text_repel(
      data = subset(data, Mag > n_max),
      ggplot2::aes(label = Location.Name),
      size = 3, color = "black", direction = "y",
      nudge_x = .25, nudge_y = .25, angle = 60,
      box.padding = grid::unit(0.35, "lines"),
      point.padding = grid::unit(0.3, "lines")
    )
  p
  return(p)
}
