#' Hydrological data from IMGW
#'
#' Downloading hourly, daily, and monthly hydrological data from the SYNOP / CLIMATE / PRECIP stations available in the danepubliczne.imgw.pl collection
#'
#' @param interval temporal resolution of the data ("daily" , "monthly", or "semiannual_and_annual")
#' @param year vector of years (e.g., 1966:2000)
#' @param coords add coordinates of the stations (logical value TRUE or FALSE)
#' @param value type of data (can be: state - "H" (default), flow - "Q", or temperature - "T")
#' @param station vector of hydrological stations danepubliczne.imgw.pl can be name of station CAPITAL LETTERS(character)
#' It accepts names (characters in CAPITAL LETTERS) or stations' IDs (numeric)
#' @param col_names three types of column names possible: "short" - default, values with shorten names, "full" - full English description, "polish" - original names in the dataset
#' @param ... other parameters that may be passed to the 'shortening' function that shortens column names
#' @export
#' @export
#'
#' @examples \donttest{
#'   x <- hydro("monthly", year = 1999)
#'   head(x)
#' }
hydro <- function(interval, year, coords = FALSE, value = "H", station = NULL, col_names = "short", ...){

  if (interval == "daily"){
    # dobowe
    calosc <- hydro_daily(year = year, coords = coords, station = station, col_names = col_names, ...)
  } else if (interval == "monthly"){
    #miesieczne
    calosc <- hydro_monthly(year = year, coords = coords, station = station, col_names = col_names, ...)
  } else if (interval == "semiannual_and_annual"){
    # polroczne_i_roczne
    calosc <- hydro_annual(year = year, coords = coords, value = value, station = station, col_names = col_names, ...)
  } else{
    stop("Wrong `interval` value. It should be either 'daily', 'monthly', or 'semiannual_and_annual'.", call. = FALSE)
  }
  return(calosc)
}
