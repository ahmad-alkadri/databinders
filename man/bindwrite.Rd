% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bindwrite.R
\name{bindwrite}
\alias{bindwrite}
\title{Binding and rewriting into a single file all particular type datasets in a repository}
\usage{
bindwrite(repo, type = "xlsx", output = "databound.xlsx")
}
\arguments{
\item{repo}{A string with the name and/or destination of the repository}

\item{type}{The targeted type of the data files.
Currently support XLSX ("xlsx"), ODS ("ods"), and CSV ("csv").}

\item{output}{The name of the output file which will contain
the bound datasets.}
}
\value{
A dataset file containing all bound datasets.
}
\description{
A function for binding all dataset files in a
particular repository and writing them into a new dataframe.
Current supported input format: CSV, XLSX, and ODS
}
\examples{

download.file(url = "https://github.com/ahmad-alkadri/databinders/raw/master/Examples.zip",
              destfile = "Examples.zip")

unzip(zipfile = "Examples.zip")

bindwrite(repo = "Examples/XLSX/", type = "xlsx", output = "iris-all.xlsx")
}
