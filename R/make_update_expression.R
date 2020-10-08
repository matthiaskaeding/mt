#' Make an update expression
#'
#' @param vars Charvec of variables
#'
#' @noRd
make_update_expression = function(vars) {

  rhs = sprintf("list(%s)", paste0("i.", vars, collapse = ", "))
  lhs = sprintf("c(%s)", paste0("'", vars, "'", collapse = ", "))
  parse(text = sprintf("%s := %s", lhs, rhs))

}
