#' Converts a windows path from clipboard, turning backslash into forward slash
#'
#' Inspired by similar function from user Tom from stackoverflow
#' @keywords windows
#' @export

rep_windows_path <- function() {

  x = clipr::read_clip()
  out = gsub('\"', "", x, fixed = TRUE)
  out = gsub("\\", "/", out, fixed = TRUE)
  out

}
