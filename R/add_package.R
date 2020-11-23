#' adds library(<package>) call to file here::here("R/packages.R")
#'
#' @keywords drake
#' @param package Unquoeted symbol
#' @param open_file Should "R/packages.R" be opened afterwards?
#' @export

add_package <- function(package, open_file = F) {

  fn <- here::here("R/packages.R")
  stopifnot(file.exists(fn))

  package <- deparse(substitute(package))
  line <- sprintf("library(%s)", package)
  write(line, fn, append = TRUE)
  if(open_file) file.edit(fn)
  NULL

}
