#' Perform actions with object at cursor
#'
#' @export
tar_load_fun_raw_at_cursor <- function() {
  fun <- atcursor::get_word_or_selection()
  mt::tar_load_fun_raw(fun, envir = globalenv())
}
#' Perform actions with object at cursor
#'
#' @export
glimpse_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("dplyr::glimpse(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
print_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("print(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
view_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("View(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
fun_at_cursor <- function(funstring) {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("%s(%s)", funstring, obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
print_summary_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("print(summary(%s))", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
print_head_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("print(head(%s, 5))", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
help_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("help(%s)", obj)
  eval(parse(text = command))
}
#' Perform actions with object at cursor
#'
#' @export
str_at_cursor <- function() {
  obj <- atcursor::get_word_or_selection()
  command <- sprintf("str(%s)", obj)
  eval(parse(text = command))
}