#' Adds cols from data.table SOURCE to data.table TARGET
#'
#' Only done when there if rows are uniquely identified by on
#' Returns TARGET invisibly
#' @param TARGET Target data.table
#' @param SOURCE Source data.table
#' @keywords Update data.table
#' @export
#' @examples
#' TARGET = data.table(id = 1:10)
#' SOURCE = data.table(id = 1:5)[, x := rnorm(.N)][, y := rnorm(.N)]
#' add_cols(TARGET, SOURCE, on = "id", cols = c("x", "y"))
#' TARGET[]

add_cols = function(TARGET, SOURCE, on, cols) {

  SOURCE[, if(.N > 1L) stop("Rows combination in <on> in SOURCE not unique"), keyby = on]
  i = SOURCE[TARGET, on = on, which = TRUE, nomatch = NA]

  rows = which(!is.na(i))
  i2 = i[rows]

  for(var in cols) {
    set(TARGET, rows, var, SOURCE[[var]][i2])
  }

  invisible(TARGET)

}
