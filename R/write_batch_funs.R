#' Make HPCC Shell Files
#'
#' This function makes a shell script to defining experiment runs for MSU's High
#' Performance Computing Cluster (HPCC). Recommended to follow this with the
#' `write_HPCC_bat` function in order to generate the batch bat file that will
#' submit multiple shell files to the HPCC queue.
#'
#' @param sh_vector A vector of sh shellscripts written by
#' @param outFile Path and filename with which to save the output bat file
#' @keywords HPCC preparation shell sh
#' @export
#' @examples
#' # function arguments
#' shNames <- paste0('test_',1:10,'.sh')
#' fileOut <- 'C:/Users/deinesji/Dropbox/1PhdJill/hpa/LEMAs/SALUS/testHPCCrun/test.bat'
#'
#' # write out .bat file
#' write_HPCC_bat(shNames, fileOut)

write_HPCC_shell <- function(sh_vector, outFile){
  # write one qsub command per line
  cat(paste('qsub ', sh_vector, '\n', sep='', collapse=''),
      file = outFile)
}



#' Make HPCC Batch Files
#'
#' This function makes a bash script to execute queue submissions to MSU's High
#' Performance Computing Cluster (HPCC).
#'
#' @param sh_vector A vector of sh shellscripts written by
#' @param outFile Path and filename with which to save the output bat file
#' @keywords HPCC preparation batch bat
#' @export
#' @examples
#' # function arguments
#' shNames <- paste0('test_',1:10,'.sh')
#' fileOut <- 'C:/Users/deinesji/Dropbox/1PhdJill/hpa/LEMAs/SALUS/testHPCCrun/test.bat'
#'
#' # write out .bat file
#' write_HPCC_bat(shNames, fileOut)

write_HPCC_bat <- function(sh_vector, outFile){
  # write one qsub command per line
  cat(paste('qsub ', sh_vector, '\n', sep='', collapse=''),
      file = outFile)
}


