% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api.R
\name{wmata_api}
\alias{wmata_api}
\title{Call the WMATA API}
\usage{
wmata_api(path, query = NULL, ..., level, api_key = wmata_key())
}
\arguments{
\item{path}{The path to an API endpoint (e.g., "Bus.svc/json/jStopSchedule")}

\item{query}{Additional queries also passed, possibly your key if need be.}

\item{...}{Arguments passed to \code{\link[jsonlite:fromJSON]{jsonlite::fromJSON()}} for parsing.}

\item{level}{If parsed JSON is a list, select only this element. Useful if
the list is length one containing a data frame or some other object.}

\item{api_key}{Subscription key which provides access to this API. Defaults
\code{Sys.getenv("WMATA_KEY")} via \code{\link[=wmata_key]{wmata_key()}}.}
}
\value{
A single JSON string.
}
\description{
Use \code{\link[httr:GET]{httr::GET()}} to make a request to the WMATA API and return the parsed
list from the JSON data. The function uses \code{\link[httr:RETRY]{httr::RETRY()}}, so the call will
repeat up to three times if there is a failure (often from a rate limit).
}
\details{
This function was modified from 'zamorarr/wmata' on GitHub:
\url{https://github.com/zamorarr/wmata/blob/master/R/api.r}
}
\examples{
\dontrun{
wmata_api("Rail.svc/json/jLines", query = list(LineCode = "RD"))
}
}
\keyword{internal}
