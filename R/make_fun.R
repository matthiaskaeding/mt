#' Makes a file "<name>.R", similar to usethis::use_r
#'
#' @param name name of function
#' @param folder folder
#' @keywords function
#' @export
#' @examples
#' make_fun('est_modus')

make_fun <- function(name, folder = here::here("R")) {

  filename <- file.path(folder, paste0(name, ".R"))
  if(file.exists(filename)) stop("FILE EXISTS")

  s <- "NAME <- function() {\n\n\n        \n}"

  s <- gsub("NAME", name, s)
  writeLines(s, filename)
  file.edit(filename)

}
