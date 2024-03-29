#' Makes a file "<name>.R", similar to usethis::use_r
#'
#' @param name name of function
#' @param folder folder
#' @keywords function
#' @export
#' @examples
#' make_fun('est_modus')

make_fun <- function(name, folder = here::here("R")) {

  name = deparse(substitute(name))
  filename <- file.path(folder, paste0(name, ".R"))
  if(file.exists(filename)) stop("FILE EXISTS")
  s <- "#' Does X\n#'\n#'@param par\nNAME <- function() {\n\n        \n}"
  s <- gsub("NAME", name, s)
  fs::file_create(filename)
  writeLines(s, filename)
  #file.edit(filename)
  NULL

}
