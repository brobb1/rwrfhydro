#' ---
#' title: "An overview of rwrfhydro functionality"
#' author: "James McCreight and Aubrey Dugger"
#' date: "`r Sys.Date()`"
#' output: rmarkdown::html_vignette
#' vignette: >
#'   %\VignetteIndexEntry{An overview of rwrfhydro functionality}
#'   %\VignetteEngine{knitr::rmarkdown}
#'   \usepackage[utf8]{inputenc}
#' ---
#' 
#' # Background
#' The rwrfhydro package is intended as a multi-purpose tool for computing activities related to the WRF Hydro model. But how do you know which tool to use or even if the right tool might exist? If you are developing a new set of tools, how do you help users discover your tools? 
#' 
#' To aid in discover of appropriate tools, the functions are organized or tagged in two ways. First, using the existing set of R "keywords" (see the end of this document for that list). Second, tools are tagged with customized "concepts" which are defined specifically for rwrfhydro. We illustrate how to reveal these categories and the functions within them for rwrfhydro (or any other package). For developers, we show how to document keywords and concepts and how to cross-reference within the documentation. 
#' 
#' (Note that these commands will not work for packages loaded by `devtools::load_all`, you have to load an built/installed version of rwrfhydro.)
#' 
#' # Setup
#' Load the rwrfhydro package. 
## ---- results='hide'-----------------------------------------------------
library("rwrfhydro")

#' 
## ---- echo=FALSE---------------------------------------------------------
options(width = 100)
library(printr)

#' 
#' # R `help` and `help.search`
#' There are several basic commands which can give insight into a package and its contents
## ------------------------------------------------------------------------
?rwrfhydro

#' 
#' Or
## ------------------------------------------------------------------------
help(package='rwrfhydro')

#' 
#' To simply print the available (exported) functions:
## ------------------------------------------------------------------------
ls('package:rwrfhydro')

#' 
#' However, none of the above (except perhaps the first) really help make sense of the (already) sprawling set of functions available in rwrfhydro. The R `help.search()` matches a pattern against `fields = c("alias", "concept", "title")` by default, so it can help when you know the concept your are looking for. It also provides a `keyword` field, so you can find keywords of interest (keywords are defined a priori unlike concepts, so you might actually know them).
## ------------------------------------------------------------------------
help.search("DART",package='rwrfhydro')

#' 
#' Or
## ------------------------------------------------------------------------
help.search(package='rwrfhydro', keyword='hplot')

#' 
#' But there's no clear way in R to discover keywords or concepts used within a package (that I've ever found.) 
#' 
#' # `GetPkgMeta`
#' 
#' So, rwrfhydro includes `GetPkgMeta`: the slicer and dicer of package discovery that reveals both concepts and keywords, each in alphabetical order and shows the functions associated with each. With the following argument, only the concepts and keywords are returned. 
## ------------------------------------------------------------------------
GetPkgMeta(listMetaOnly = TRUE)

#' 
#' By defulat (without any arguments at all), you also get the functions in each concept and keyword
## ------------------------------------------------------------------------
pkgMeta <- GetPkgMeta()

#' 
#' Note the structure of the returned value which could be computed on.
## ------------------------------------------------------------------------
str(pkgMeta)

#' 
#' To suppress printing of the functions and see only the concepts:
## ------------------------------------------------------------------------
GetPkgMeta(listMetaOnly = TRUE, meta='concept')

#' 
#' Or perhaps you just want to look at certain concepts and keywords
## ------------------------------------------------------------------------
GetPkgMeta(concept=c('plot', 'dataGet'), keyword=c('hplot', 'manip'))

#' 
#' What were the concepts or keywords of the `GetPkgMeta` and `ReadAmerifluxCSV` functions? 
## ------------------------------------------------------------------------
GetPkgMeta(byFunction = c('GetPkgMeta','ReadAmerifluxCSV'))

#' 
#' The function can be applied to other packages too.
## ------------------------------------------------------------------------
GetPkgMeta(package='dataRetrieval', list=TRUE)

#' 
#' # Documenting
#' The following show the Roxygen markdown used to tag keywords and concepts onto a function.
#' The family field cross-references documentation with all other functions with that family.
## ---- eval=FALSE---------------------------------------------------------
## #' @keywords internal manip
## #' @concept SNODAS
## #' @family SNODAS
## #' @export

#' 
#' Internal functions (those not exported into the package namespace) should be exported but tagged with keyword "internal". This makes the documentation available to users. 
#' 
#' For reference, the following command lists the existing R keywords.
## ------------------------------------------------------------------------
cat( readLines( paste0(R.home("doc"),'/KEYWORDS') ) , sep = "\n" )

