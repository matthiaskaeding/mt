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

  for(var in cols) {
    set(TARGET, NULL, var, SOURCE[[var]][i])
  }

  TARGET

}
