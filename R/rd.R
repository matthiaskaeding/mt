#' Run a drake project; unlock cache before
#' Simple helper to avoid the need to create run.R
#'
#' @keywords drake
#' @export

rd <- function() {

  source(here::here("_drake.R"))
  drake_cache(here(".drake"))$unlock()
  drake::r_make()

}
