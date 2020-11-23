#' drake::loadds all arguments of function
#' Common usecase: loadd all objects while debugging a make_<object> function
#'
#' @keywords drake
#' @param fun function, whose arguments we want to loadd
#' @export

loadd_fun <- function(fun) {

  sargs <- names(as.list(args(fun)))
  sargs <- setdiff(sargs, c("", "..."))
  drake::loadd(list = sargs)

}
