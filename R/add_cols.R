#' Adds cols from data.table SOURCE to data.table TARGET
#'
#' Only done when there if rows are uniquely identified by on
#' Returns TARGET invisibly
#' @param TARGET Target data.table
#' @param SOURCE Source data.table
#' @param on Which variables to join on. When unequal for TARGET and SOURCE,
#' must be named vector, where the names correspond to the SOURCE.
#' @param cols Which cols to add
#' @keywords Update data.table
#' @export
#' @examples
#' TARGET = data.table(id = rep(1:10, each = 3))
#' SOURCE = data.table(id = 1:5)[, x := rnorm(.N)][, y := rnorm(.N)]
#' add_cols(TARGET, SOURCE, on = "id", cols = c("x", "y"))
#' TARGET[]
#' # Case of unequal named join vars
#' X = data.table(id0 = 1:10)
#' Y = data.table(id1 = 3:5)[, z := c("a", "b", "c")]
#' add_cols(X, Y, on = c("id1" = "id0"), cols = "z")
#' X[]

add_cols = function(TARGET, SOURCE, on, cols) {

  on_SOURCE = if(!is.null(names(on))) names(on) else on
  on_TARGET = on

  nms_SOURCE = names(SOURCE)
  nms_TARGET = names(TARGET)

  if(!all(cols %in% nms_SOURCE)) stop("Not all cols are in SOURCE")
  if(!on_SOURCE %in% nms_SOURCE) stop(sprintf("Col %s not in SOURCE", on_SOURCE))
  if(!on_TARGET %in% nms_TARGET) stop(sprintf("Col %s not in TARGET", on_TARGET))
  is_cols_nms_TARGET = intersect(cols, nms_TARGET)

  if(length(is_cols_nms_TARGET)) {
    stop(
      sprintf("Variables %s already in TARGET",
              paste0(is_cols_nms_TARGET, collapse = ", ")))
  }

  SOURCE[, if(.N > 1L) stop("Rows combination in <on> in SOURCE not unique"),
         keyby = on_SOURCE]

  i = SOURCE[TARGET, on = on, which = TRUE, nomatch = NA]

  rows = which(!is.na(i))
  i2 = i[rows]

  for(var in cols) {
    set(TARGET, rows, var, SOURCE[[var]][i2])
  }

  invisible(TARGET)

}
