% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_xdb_funs.R
\name{write_xdb_bottomMatter}
\alias{write_xdb_bottomMatter}
\title{Close SALUS xdb.xml by writing end elements}
\usage{
write_xdb_bottomMatter(outFile, closeComponent = "N",
  closeRotation = "N", closeExperiment = "N", writeVersion = "N",
  closeXDB = "N")
}
\arguments{
\item{outFile}{Full file path for an existing .xdb.xml to appended to, created with write_xdb_topMatter}

\item{closeComponent}{Close out a rotation component. 'Y' or 'N'; default is 'N'}

\item{closeRotation}{Close out a rotation. 'Y' or 'N'; default is 'N'}

\item{closeExperiment}{Close out an Experiment. 'Y' or 'N'; default is 'N'}

\item{writeVersion}{write the version control elements. 'Y' or 'N'; default is 'N'}

\item{closeXDB}{Close out the XDB file. 'Y' or 'N'; default is 'N'}
}
\description{
This
}
\details{
This functioncloses elements and/or writes version control information after the
rotation and management has been written See http://salusmodel.glg.msu.edu/salus.ddb.xml for more
information about SALUS parameter options. Can be used to close the file completely, or close a
component or Experiment before writing additional ones.
}
\examples{
# file path to existing .xdb.xml file created by write_xdb_topMatter
fileOut <- 'C:/Users/deinesji/1PhdJill/test.xdb.xml'

# append rotation component parameters to .xdb.xml; numeric parameters can be character or numeric
write_xdb_bottomMatter(outFile = fileOut, closeComponent = 'N', closeRotation = 'N',
                       closeExperiment = 'N', writeVersion = 'N', closeXDB = 'N')
}
\keyword{close}
\keyword{create}
\keyword{experiment}
\keyword{file}
\keyword{xdb,}
