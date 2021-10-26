#' targets::tar_loads all arguments of function
#' Common usecase: tar_load all objects while debugging a make_<object> function
#'
#' @keywords drake
#' @param fun function (string), whose arguments we want to loadd
#' @export

tar_load_fun_raw <- function(fun, envir = parent.frame()) {

  sargs <- names(as.list(args(fun)))
  sargs <- setdiff(sargs, c("", "..."))
  for (sarg in sargs) {
    try(targets::tar_load_raw(sarg, envir = envir))
  }
}
