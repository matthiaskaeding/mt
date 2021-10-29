#' Perform actions with object at cursor
#'
#' @export
tar_load_fun_raw_at_cursor = function() {
  fun = atcursor::get_word_or_selection()
  mt::tar_load_fun_raw(fun, envir = globalenv())
}
#' Perform actions with object at cursor
#'
#' @export
glimpse_at_cursor = function() {
  obj = atcursor::get_word_or_selection()
  command = sprintf("dplyr::glimpse(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
print_at_cursor = function() {
  obj = atcursor::get_word_or_selection()
  command = sprintf("print(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
view_at_cursor = function() {
  obj = atcursor::get_word_or_selection()
  command = sprintf("View(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
print_summary_at_cursor = function() {
  obj = atcursor::get_word_or_selection()
  command = sprintf("print(summary(%s))", obj)
  eval(parse(text = command))
}

