#' targets::tar_loads all arguments of function
#' Common usecase: tar_load all objects while debugging a make_<object> function
#'
#' @keywords drake
#' @param fun function, whose arguments we want to loadd
#' @export

tar_load_fun <- function(fun, envir = parent.frame()) {

  sargs <- names(as.list(args(fun)))
  sargs <- setdiff(sargs, c("", "..."))
  targets::tar_load_raw(sargs, envir = envir)

}
