.First.sys()
# With a customised prompt
options(prompt = "> ", digits = 4)

# `local` creates a new, empty environment
# This avoids polluting .GlobalEnv with the object r
local({
  r = getOption("repos")           
  r["CRAN"] = "https://cran.rstudio.com/"
  options(repos = r)
})

## if (interactive())
##   try(fortunes::fortune(), silent = TRUE)

options(help_type = "text")
options(scipen=10)
#snippet allows you to tab-complete package names for use in "library()"
utils::rc.settings(ipck=TRUE)

# https://www.r-bloggers.com/2014/09/fun-with-rprofile-and-customizing-r-startup/
## .First <- function(){
##   if(interactive()){
##     library(utils)
##     timestamp(,prefix=paste("##-- [",getwd(),"] ",sep=""))

##   }
## }

## .Last <- function(){
##   if(interactive()){
##     hist_file <- Sys.getenv("R_HISTFILE")
##     if(hist_file=="") hist_file <- "~/.RHistory"
##     savehistory(hist_file)
##   }
## }

#if(Sys.getenv("TERM") == "xterm-256color")
 # library("colorout")

li <- function(a.package){
  suppressWarnings(suppressPackageStartupMessages(
    library(a.package,character.only = TRUE)))
}

old <- getOption("defaultPackages")
options(defaultPackages = c(old, "shiny", "data.table","httpgd"))
print("use hgd(), hgd_browse() for plot in emacs")
