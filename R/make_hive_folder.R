#' Makes a hive_folder for arrow
#'
#' @param basefolder Basic folder
#' @param ... Key value pairs. Specify this OR pairs
#' @param pairs Named list of key values parirs; etc. day=01
#' @keywords hive_folder
#' @export
#' @examples
#' make_folder("", year = 2015, month = "01", day = "15")

make_hive_folder = function(basefolder, ..., pairs = list(...)) {


  out = basefolder

  for(nm in names(pairs)) {

    arg = pairs[[nm]]
    out = file.path(out, paste0(nm, "=", arg))

  }

  file.path(out, "data.parquet")

}
