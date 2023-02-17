#' Retrieves GWP data from .csv file
#'
#' @md
#' @author Pascal Weigmann
#' @param source name of the gwp data source, choose from "AR6" (default), "SAR", "AR4", "AR5",
#' @param metric gwp metric, indicating the years after emission that are being considered, choose from
#' "GWP100" (default), "GWP20", "GWP500", "CCFGWP100", GTP100"
#' @importFrom utils read.csv
#' @importFrom dplyr select %>%
#' @export
getGWP <- function(source = "AR6", metric = "GWP100", species = NULL) {

  sourcesMetrics <- c("SARGWP100", "AR4GWP100", "AR5GWP100", "AR5CCFGWP100",
                      "AR6GWP100", "AR6GWP20", "AR6GWP500", "AR6GTP100")
  sourceMetric <- paste0(source, metric)
  if (!sourceMetric %in% sourcesMetrics) {
    stop(cat("Not a valid choice. Please choose one of the following combinations:\n", sourcesMetrics, "\n"))
  }

  filename <- "data/globalwarmingpotentials.csv"
  data <- read.csv(filename, skip = 9, header = TRUE, na.strings = list("")) %>%
    select("Species", sourceMetric)

  # return a dataframe of GWPs if no species is specified, otherwise only a single value
  if (!is.null(species)) {
    if (species %in% data$Species) {
      data <- data[data$Species == species, sourceMetric]
    } else {
      print("The specified species is not part of the data set.")
    }
  }
  return(data)
}
