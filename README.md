Databinders
================

[![Build
Status](https://travis-ci.org/ahmad-alkadri/databinders.svg?branch=master)](https://travis-ci.org/ahmad-alkadri/databinders)

## Description

The aim of databinders is to solve a common problem of mine: the need
for binding many datasets containing the experimental data of my many
specimens and recapitulating them into a single dataframe.

Note that this package was basically written as a wrapper of the
well-known [rio](https://cran.r-project.org/web/packages/rio/) package.
It is a swiss-army package for I/O operations in R and also my personal
preferred go-to package for working with many types of data.

## Installations

To install this package, simply launch `R` in your computer, either
through the IDE (ex: RStudio) or the terminal, and type:

`devtools::install_github("ahmad-alkadri/databinders")`

Note that if you don’t have yet `rio` package installed, installing this
package will also install `rio` in your R.

## Examples

I’ve prepared a zipped file containing the Iris dataset, separated into
three files in excel, csv, and ods format based on their species name.
You can head over to the folder through this
[link](https://github.com/ahmad-alkadri/databinders/tree/master/Examples)
now to check them out. Anyway, this facilitates in showing the examples
on how this package work. To try it out, just type:

``` r
library(databinders)

#Download the zipped Examples folder from GitHub
download.file(url = "https://github.com/ahmad-alkadri/databinders/raw/master/Examples.zip", 
              destfile = "Examples.zip")

#Unzip the compressed file
unzip(zipfile = "Examples.zip")

#Bind the excel files in the XLSX subrepository
df <- bindall(repo = "Examples/XLSX/", type = "xlsx")

#Print the head() of the dataframe
print(head(df))
```

    ##   sepal length sepal width petal length petal width        iris
    ## 1          5.1         3.5          1.4         0.2 Iris-setosa
    ## 2          4.9         3.0          1.4         0.2 Iris-setosa
    ## 3          4.7         3.2          1.3         0.2 Iris-setosa
    ## 4          4.6         3.1          1.5         0.2 Iris-setosa
    ## 5          5.0         3.6          1.4         0.2 Iris-setosa
    ## 6          5.4         3.9          1.7         0.4 Iris-setosa
