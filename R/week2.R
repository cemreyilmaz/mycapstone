#' This is my capstone project during the course "Mastering Software Development
#' in R Capstone" by Roger D. Peng and Brooke Anderson, Johns Hopkins University
#' as a part of "Mastering Software Development in R Professional Certificate"
#' program on Coursera.
#' -----------------------------------------------------------------------------
#' WEEK 2 - Visualize
#' -----------------------------------------------------------------------------
#' for Windows, if you get an error about Java
# Sys.setenv(JAVA_HOME="C:/Program Files/Common Files/Datawatch/Drivers/7.1.5/jre/bin")
#' read data: Earthquake Strong Motion Data (1933-1994) by National Centers for
#' Environmenta Information, NOAA, USA
#' <https://www.ngdc.noaa.gov/hazard/strong.shtml>
# data <- xlsx::read.xlsx("NCEI-strong-motion.xlsx", "Sheet1",
#                         rowIndex = 13:15685, colIndex = 1:36)
# data <- mycapstone::eq_clean_data(data)
# data <- mycapstone::eq_location_clean(data)
# ---------------------------------------------------------------------------- #
# x-axis: dates
# y-axis: contries
geom_timeline <- function(data, y_axis, color_vals, size_val, alpha_val){
  if(!(eval(parse(text = "y_axis")) == "Location_Name")){
    color_vals = data$Location_Name
    color_label = "Location_Name"
  } else{
    color_label = "Color"
  }
  if(missing(size_val)){
    size_val = .5
  }
  if(missing(alpha_val)){
    alpha_val = 1
  }
  ggplot2::ggplot(data) +
    ggplot2::geom_path(mapping = ggplot2::aes(x = Date,
                                              y = unlist(data[eval(parse(text = "y_axis"))]),
                                              color = color_vals),
                                              size = size_val,
                                              alpha = alpha_val, na.rm = T)+
    ggplot2::ylab(y_axis)+
    ggplot2::ggtitle(paste(y_axis, "of Earthquakes over Time"))+
    ggplot2::labs(color = color_label)
}
