#' Run a drake project; unlock cache before
#' Simple helper to avoid the need to create run.R
#'
#' @keywords drake
#' @param unluck Unlock cache before running drake::r_make
#' @export

rd <- function(unlock = TRUE) {

  source(here::here("_drake.R"))
  if(unlock) drake::drake_cache(here::here(".drake"))$unlock()
  drake::r_make()

}
