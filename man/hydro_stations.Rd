% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hydro_stations.R
\docType{data}
\name{hydro_stations}
\alias{hydro_stations}
\title{Location of the hydrological stations}
\format{The data contains a data.frame with 1304 obs. of 3 variables:
\itemize{
\item{id} {Station ID}
\item{X} {Longitude}
\item{Y} {Latitude}
}
The object is in the geographic coordinates using WGS84 (EPSG:4326).}
\usage{
hydro_stations
}
\description{
The object contains weather stations
coordinates, ID numbers, and elevations
}
\examples{
data(hydro_stations)
head(hydro_stations)
}
\keyword{datasets}
\keyword{meteo}
