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
#' df <- bindall(repo = "Examples/XLSX/", type = "xlsx")

bindall <- function(repo = getwd(), type = "xlsx"){
  setwd(repo)

  file_list <- list.files(pattern = paste(".",type=".xlsx",sep=""))

  for (file in file_list){

    # if the merged dataset doesn't exist, create it
    if (!exists("df")){

      df <- rio::import(file)

    }

    # if the merged dataset does exist, append to it
    if (exists("dataset")){

      tmp_df <- rio::import(file)

      df <- rbind(df, tmp_df)

      rm(tmp_df)

    }

  }

  return(df)

}
