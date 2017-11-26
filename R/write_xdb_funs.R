#' Write SALUS xdb.xml Top Matter
#'
#' This function initializes a SALUS experiment file by creating the file and
#' initializing the <XDB> tag. Subsequent write_xdb_* functions append information
#' about the experiments and rotational components.
#' @param outFile Full file path for the .xdb.xml to create
#' @keywords create xdb
#' @export
#' @examples
#' # desired file path and file name for the output to be created
#' fileOut <- 'C:/Users/deinesji/1PhdJill/test.xdb.xml'
#'
#' # create output
#' write_xdb_topMatter(fileOut)

write_xdb_topMatter <- function(outFile){
  # write first rows, creates file (no append = true)
  cat('<?xml version="1.0" encoding="utf-8"?>\n<XDB>\n',file=outFile)
}

#' Write SALUS xdb.xml Experiment Level Parameters
#'
#' This function writes the experiment arguments. Subsequent write_xdb_* functions append information
#' about the rotational components. See http://salusmodel.glg.msu.edu/salus.ddb.xml for more
#' information about SALUS parameter options. This function should be followed with write_xdb_rotation,
#' write_xdb_m* (rotation management), and write_xdb_bottomMatter functions to complete the Experiment file.
#'
#' All other SALUS Experiment parameters are set currently as default.
#' @param outFile Full file path for an existing .xdb.xml to appended to, created with write_xdb_topMatter
#' @param ExpID Sequential ID for experiment
#' @param RunTitle Title for the experiment
#' @param startYear Starting year of the simulation - SYear parameter
#' @param endYear Ending year of the simulation. Used to derive NYrs parameter (number of years)
#' @param startDOY Starting day of year, fills in SDOY parameter
#' @param StationID Weather Station ID
#' @param Weatherfp Filepath to weather station .wdb.xml file. Currently relative to Experiment file
#' @param SoilID Soil ID
#' @param Soilfp Filepath to soil .sdb.xml file. Currently relative to Experiment file
#' @param Cropfp Filepath to crop .cdb.xml database file. Currently relative to Experiment file
#' @keywords create xdb
#' @export
#' @examples
#' # file path to existing .xdb.xml file created by write_xdb_topMatter
#' fileOut <- 'C:/Users/deinesji/1PhdJill/test.xdb.xml'
#'
#' # append Experiment parameters to .xdb.xml; numeric parameters can be character or numeric
#' write_xdb_experiment(fileOut, ExpID = 1, RunTitle = 'Test', startYear = 2006,
#'                      endYear = 2016, startDOY = 270, StationID = 1001,
#'                      Weatherfp = '1001.wdb.xml', SoilID = 'KS1017570',
#'                      Soilfp = 'KS.sdb.xml', Cropfp = 'cropsn29Dec2016.cdb.xml')

write_xdb_experiment <- function(outFile, ExpID, RunTitle, startYear, endYear, startDOY,
                                 StationID, Weatherfp,SoilID, Soilfp, Cropfp){
  # calculate subarguments
  nyear <- endYear - startYear + 1

  # write Experiment details - appends to previous file
  cat(paste0('  <Experiment ExpID="', ExpID, '" Title="', RunTitle, '" NYrs="',
             nyear, '" SYear="', startYear, '" SDOY="', startDOY,
             # some defaults
             '" ISwWat="Y" ISwNit="Y" ISwPho="N" Frop="1" Soilfp="',
             # soil, weather, crop files
             Soilfp, '" SoilID="', SoilID, '" Weatherfp="', Weatherfp,
             '" StationID="', StationID, '" Cropfp="', Cropfp,
             # some defaults
             '" NRrepSq="0" MeEvp="R" MeInf="R" kResOrg="3.914E-5" kSloOrg="0.00013699" >\n'),
      file=outFile, append=TRUE)
}

