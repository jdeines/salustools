% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_xdb_funs.R
\name{write_xdb_experiment}
\alias{write_xdb_experiment}
\title{Write SALUS xdb.xml Experiment Level Parameters}
\usage{
write_xdb_experiment(outFile, ExpID, RunTitle, startYear, NYrs, startDOY,
  StationID, Weatherfp, SoilID, Soilfp, Cropfp)
}
\arguments{
\item{outFile}{Full file path for an existing .xdb.xml to appended to, created with write_xdb_topMatter}

\item{ExpID}{Sequential ID for experiment}

\item{RunTitle}{Title for the experiment}

\item{startYear}{Starting year of the simulation - SYear parameter}

\item{NYrs}{Number of model years}

\item{startDOY}{Starting day of year, fills in SDOY parameter}

\item{StationID}{Weather Station ID}

\item{Weatherfp}{Filepath to weather station .wdb.xml file. Currently relative to Experiment file}

\item{SoilID}{Soil ID}

\item{Soilfp}{Filepath to soil .sdb.xml file. Currently relative to Experiment file}

\item{Cropfp}{Filepath to crop .cdb.xml database file. Currently relative to Experiment file}
}
\description{
This function writes the experiment arguments. Subsequent write_xdb_* functions append information
about the rotational components. See http://salusmodel.glg.msu.edu/salus.ddb.xml for more
information about SALUS parameter options. This function should be followed with write_xdb_rotation,
write_xdb_m* (rotation management), and write_xdb_bottomMatter functions to complete the Experiment file.
}
\details{
All other SALUS Experiment parameters are set currently as default.
}
\examples{
# file path to existing .xdb.xml file created by write_xdb_topMatter
fileOut <- 'C:/Users/deinesji/1PhdJill/test.xdb.xml'

# append Experiment parameters to .xdb.xml; numeric parameters can be character or numeric
write_xdb_experiment(fileOut, ExpID = 1, RunTitle = 'Test', startYear = 2006,
                     NYrs = 3, startDOY = 270, StationID = 1001,
                     Weatherfp = '1001.wdb.xml', SoilID = 'KS1017570',
                     Soilfp = 'KS.sdb.xml', Cropfp = 'cropsn29Dec2016.cdb.xml')
}
\keyword{create}
\keyword{xdb}
