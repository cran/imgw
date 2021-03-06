#' Meteorological data from IMGW
#'
#' Downloading hourly, daily, and monthly meteorological data from the SYNOP / CLIMATE / PRECIP stations available in the danepubliczne.imgw.pl collection
#'
#' @param interval temporal resolution of the data ("hourly", "daily", "monthly")
#' @param rank rank of the stations ("synop", "climate", "precip")
#' @param year vector of years (e.g., 1966:2000)
#' @param status leave the columns with measurement and observation statuses (default status = FALSE - i.e. the status columns are deleted)
#' @param coords add coordinates of the station (logical value TRUE or FALSE)
#' @param col_names three types of column names possible: "short" - default, values with shorten names, "full" - full English description, "polish" - original names in the dataset
#' @param ... other parameters that may be passed to the 'shortening' function that shortens column names
#' @param station vector of hydrological stations danepubliczne.imgw.pl can be name of station CAPITAL LETTERS(character)
#' It accepts names (characters in CAPITAL LETTERS) or stations' IDs (numeric)
#' @export
#'
#' @examples \donttest{
#'   x <- meteo("monthly", rank = "synop", year = 2018, coords = TRUE)
#'   head(x)
#' }
meteo <- function(interval, rank, year, status = FALSE, coords = FALSE, station = NULL, col_names = "short", ...){
  if (interval == "daily"){
    # daily
    calosc <- meteo_daily(rank = rank, year = year, status = status, coords = coords, station = station, col_names = col_names, ...)
  } else if (interval == "monthly"){
    #monthly
    calosc <- meteo_monthly(rank = rank, year = year, status = status, coords = coords, station = station, col_names = col_names, ...)
  } else if (interval == "hourly"){
    #hourly
    calosc <- meteo_hourly(rank = rank, year = year, status = status, coords = coords, station = station, col_names = col_names, ...)
  } else{
    stop("Wrong `interval` value. It should be either 'hourly', 'daily', or 'monthly'.")
  }

  return(calosc)
}
