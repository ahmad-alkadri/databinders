#' Bindall: binding all particular type datasets in a repository
#'
#' @description A function for binding all dataset files in a
#' particular repository and writing them into a new dataframe.
#' Current supported input format: CSV, XLSX, and ODS
#'
#' @usage bindall(repo, type = "xlsx")
#'
#' @param repo A string with the name and/or destination of the repository
#'
#' @param type The targeted type of the data files.
#' Currently support XLSX ("xlsx"), ODS ("ods"), and CSV ("csv").
#'
#' @return A dataframe containing the binded datasets of all
#' files of the requested type in the repository.
#'
#' @examples
#'
#' download.file(url = "https://github.com/ahmad-alkadri/databinders/raw/master/Examples.zip",
#'               destfile = "Examples.zip")
#'
#' unzip(zipfile = "Examples.zip")
#'
#' df <- bindall(repo = "Examples/XLSX/", type = "xlsx")

bindall <- function(repo = getwd(), type = "xlsx"){

  # obtain the current directory
  homedir = getwd()

  # setting the directory into the target repo
  setwd(repo)

  file_list <- list.files()

  for (file in file_list){

    # if the merged dataset doesn't exist, create it
    if (!exists("dataset")){
      dataset <- rio::import(file)
    }

    # if the merged dataset does exist, append to it
    if (exists("dataset")){
      tmp_dataset <-rio::import(file)
      dataset<-rbind(dataset, tmp_dataset)
      rm(tmp_dataset)
    }

  }

  # go back to the home directory
  setwd(homedir)

  return(dataset)

}
