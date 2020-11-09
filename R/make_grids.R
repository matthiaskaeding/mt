#' Makes 1km grids according to INSPIRE for a rectangle
#'
#' @param xmin Min x coordinate (in 1000)
#' @param xmax Max x coordinate (in 1000)
#' @param ymin Min y coordinate (in 1000)
#' @param ymax Max y coordinate (in 1000)
#' @export
#' @examples
#' make_grids(4010, 4015, 2050, 2060)

make_grids = function(xmin, xmax, ymin, ymax) {


  D = CJ(x = xmin:xmax, y = ymin:ymax)
  D[, idm := paste0(x, "_", y)][, x := x * 1e3][, y := y * 1e3]

  D = rbind(
    D[, .(x = x, y = y, idm)],
    D[, .(x = x, y =  y + 1e3, idm)],
    D[, .(x = x + 1e3, y =  y + 1e3, idm)],
    D[, .(x = x + 1e3, y =  y, idm)],
    D[, .(x = x, y =  y, idm)]
  )

  D[, row := .I]
  setkey(D, idm, row)

  TMP = D[, list(list(list(as.matrix(.SD)))), keyby = idm, .SDcols = -"row"]
  poly = lapply(TMP$V1, st_polygon)
  OUT = st_sf(idm = TMP$idm,  geometry = st_sfc(poly))
  st_set_crs(OUT, 3035)

}

