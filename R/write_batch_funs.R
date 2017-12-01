#' Make HPCC Shell Files
#'
#' This function makes a shell script to defining experiment runs for MSU's High
#' Performance Computing Cluster (HPCC). This bash script copies the files needed
#' to run SALUS (salus_gnu, gdb, cdb, sdb, xdb, and wdb files) to the current
#' directory. Then the bash script will run SALUS. Then the bash script will remove
#' the SALUS files from the current directories.Then the bash script will copy
#' the SALUS results to your scratch directory. Modified from python writeTorque
#' function by Brian Baer and Lydia Rill.
#'
#' Recommended to follow this with the `write_HPCC_bat` function in order to
#' generate the batch bat file that will submit multiple shell files to the HPCC queue.
#'
#' @param shDir Directory in which to save the output shell sh file. the sh filename is pulled from xdb filename
#' @param hpcHomeDir Directory on HPCC in which source files reside for this run (sdb, xdb, zipped weather, etc). Should end in a forward slash
#' @param xdb filename of the experiment file, without extension. sh name will be pulled from this.
#' @param sdb filename of the soil file (no path, no .sdb.xml extension)
#' @param wdbZip filename of the zipped weather file. Script will unzip on the node
#' @param DayVars CSV string of SALUS daily variables to return
#' @param SeaVars CSV string of SALUS seasonal variables to return
#' @param walltime For HPCC - how long you expect the job to run. Format HH:MM:SS
#' @param memory For HPCC - how much memory the job will need. ie, '2gb' or '2000mb'
#' @param cdb Defaults to cropsn29Dec2016.cdb.xml
#' @keywords HPCC preparation shell sh
#' @export
#' @examples
#'
shDir <- 'C:/Users/deinesji/Dropbox/1PhdJill/hpa/LEMAs/SALUS/testHPCCrun'
hpcHomeDir <- '/mnt/home/deinesji/Example_SALUS_wheat/'
xdb <- 'lema_wheat_continuous'
sdb <- "KS"
wdbZip <- 'testHPCCrun.tar.gz'
DayVars <- 'ExpID,Title,SpeciesID,GWAD,IRRC,CWAD,DRNC,PREC,LAI'
SeaVars <- 'ExpID,Title,SpeciesID,GWAD,IRRC,CWAD,DRNC,PREC'
walltime <- '01:00:00'
memory <- '2000mb'
cdb = 'cropsn29Dec2016.cdb.xml'

write_HPCC_shell <- function(shDir, hpcHomeDir, xdb,sdb,wdbZip,DayVars,SeaVars,
                             walltime, memory, cdb = 'cropsn29Dec2016.cdb.xml'){
  outFile <- paste0(shDir,'/',xdb,'.sh')
  # PBS stuff
  cat(paste0('#!/bin/sh -login\n',
             '#PBS -l nodes=1:ppn=1,walltime=', walltime, ',mem=', memory, '\n',
             '# Give the job a name.\n',
             '#PBS -N ', xdb, '\n',
             '# Send an email when the job is aborted\n',
             '#PBS -m a\n',
             '# Make output and error files the samefile.\n',
             '#PBS -j oe\n',
             '\n',
             '# Change directory to the TMPDIR which is the local temp disk storage unique to each node and each job.\n',
             'cd ${TMPDIR}\n',
             'module load GNU/5.2\n\n',
             '# Copy the config files to the node\n',
             'cp -r -L ', hpcHomeDir, 'salus_gnu .\n',
             'cp -r -L ', hpcHomeDir, 'salus.gdb.xml .\n',
             'cp -r -L ', hpcHomeDir, cdb, ' .\n',
             'cp -r -L ', hpcHomeDir, sdb, '.sdb.xml .\n',
             'cp -r -L ', hpcHomeDir, wdbZip, ' .\n',
             'tar -xzf ', wdbZip,'\n',
             'cp -r -L ', hpcHomeDir, xdb, '.xdb.xml .\n\n'
             ),
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


