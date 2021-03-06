% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ghcn_get.R
\name{GetGhcn2}
\alias{GetGhcn2}
\title{Get GHCN-D data for specified siteIds.}
\usage{
GetGhcn2(siteIDs, elements, startDate, endDate, parallel = FALSE,
  fileAdd = NULL)
}
\arguments{
\item{siteIDs}{A single siteId or vector of siteIds. SiteIds should match the
standardized GHCN-D IDs (for example : ACW00011604). See
\url{http://www1.ncdc.noaa.gov/pub/data/ghcn/daily/ghcnd-stations.txt} for
a list of siteIds.}

\item{elements}{A character vector defining what type of observation you are
interested in. There are five core elements as well as a number of 
additional elements. The five core elements are: \describe{ \item{PRCP}{ =
Precipitation (tenths of mm), the precipitation will be converted to mm
when calling \code{\link{GetGhcn}} or \code{\link{GetGhcn2}} } \item{SNOW}{
= Snowfall (mm)} \item{SNWD}{ = Snow depth (mm)} \item{TMAX}{ = Maximum
temperature (tenths of degrees C)} \item{TMIN}{ = Minimum temperature
(tenths of degrees C)} } For the full list of elemenst refer to 
\url{ftp://ftp.ncdc.noaa.gov/pub/data/ghcn/daily/readme.txt}}

\item{startDate, endDate}{Date.}

\item{parallel}{Logical (DEFAULT=FALSE)}

\item{fileAdd}{Address to the url containg the csv files of daily GHCN by
year. default is
\url{http://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/}}
}
\value{
A dataframe containing the siteIds, date, daily GHCN-D, element,
  sFlag, qFlag, mFlag and reportTime. If the element is PRCP, then divide the
  numbers by 10 to convert to mm. For more information on possible outcomes
  of flags and their meaning, refer to 
  \url{http://www1.ncdc.noaa.gov/pub/data/ghcn/daily/by_year/readme.txt}
}
\description{
\code{\link{GetGhcn2}} downloads the daily GHCN (Global Historic Climatology
Network) data for each site in siteIds and creates a dataframe containing the
fields: siteIds, date, element, daily GHCN value, mFlag, qFlag, sFlag and
reportTime. This is a faster function compared to \code{\link{GetGhcn}} if
you have many sites.
}
\examples{
\dontrun{
siteIds=c("ACW00011604","AJ000037579","AJ000037883","ASN00005095")
startDate="2015/02/01"
endDate="2015/10/01"
element="PRCP"
obsPrcp<-GetGhcn2(siteIds,element,startDate,endDate,parallel=FALSE)
}

# Or you could use the results of SelectGhcnGauges:
\dontrun{
countryCodeList=c("US")
networkCodeList=c("1")
statesList=c("WY")
selectedGauges<-SelectGhcnGauges(countryCode=countryCodeList,
                                 networkCode=networkCodeList,
                                 states=statesList)
obsPrcp<-GetGhcn2(selectedGauges$siteIds,element,startDate,endDate,parallel=FALSE)
}
}
\seealso{
Other GHCN: \code{\link{CalcDailyGhcn}},
  \code{\link{GetGhcn}}, \code{\link{SelectGhcnGauges}}
}
\concept{
GHCN
}
\keyword{IO}
