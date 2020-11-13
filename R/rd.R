#' Run a drake project; unlock cache before
#' Simple helper to avoid the need to create run.R
#'
#' @keywords drake
#' @export

rd <- function() {

  source(here::here("_drake.R"))
  drake::drake_cache(here::here(".drake"))$unlock()
  drake::r_make()

}
