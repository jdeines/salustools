#' Make Experiment Master Table
#'
#' This function extracts Experiment level parameters from experiment combination
#' strings that have been parsed into soil and weather parameters. Inputs are
#' vectors of the same length, or single values to be repeated for all experiments.
#' Outputs a data frame containing arguments needed for `write_xdb_experiment`.
#' See http://salusmodel.glg.msu.edu/salus.ddb.xml for more
#' information about SALUS parameter options.
#'
#' All other SALUS Experiment parameters are set currently as default.
#' @param runTitle Name of overall run scenario
#' @param ExpID Sequential ID for experiment
#' @param mukey soil mukey from SSURGO
#' @param wthID weather station ID
#' @param startyear year to start experiment
#' @param Nyears Number of years in experiment
#' @param startDOY Starting day of year, fills in SDOY parameter
#' @param state state, 2-letter abbreviation. defaults to 'KS'
#' @param Cropfp Filepath to crop .cdb.xml database file. Defaults to 'cropsn29Dec2016.cdb.xml'
#' @keywords preparation to write experiment parameters
#' @export
#' @examples
#' # Prepare the input using output from 02.21, GetExperiments
#' # Essentially df of ExpID and continuous management string
#' lemaExps <- lemaExps %>%
#'   mutate(nldas = str_sub(ExpCode, start = 10, end = 13),
#'         state = str_sub(ExpCode, start = 1, end = 3),
#'         mukey = str_sub(ExpCode, start = 3, end = 9),
#'         static = str_sub(ExpCode, start = 1, end = 13))
#'
#' # translate mukey, expid, and nldas info into data.frame of Experiment parameters
#' exp_master <- makeExperimentTable('run title', lemaExps$ExpID, lemaExps$mukey,
#'                                   lemaExps$nldas, 2005, 11, 265)


makeExperimentTable <- function(runTitle, ExpID, mukey, wthID, startyear, Nyears, startDOY,
                                state = 'KS', cropfp = 'cropsn29Dec2016.cdb.xml'){
  exptab <- data.frame(ExpID = ExpID,
                       runTitle = runTitle,
                       soilId = paste0(state,mukey),
                       soilfp = paste0(state,'.sdb.xml'),
                       nldas = wthID,
                       weatherfp = paste0(wthID,'.wdb.xml'),
                       startYear = startyear,
                       Nyrs = Nyears,
                       startDOY = startDOY,
                       cropfp = cropfp)
  return(exptab)
}
