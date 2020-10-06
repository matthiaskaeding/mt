#' Converts a windows path from clipboard, copy to clipboard, turning backslash into forward slash
#'
#' Inspired by similar function from user Tom from stackoverflow
#' @keywords windows
#' @export

rep_windows_path_clip <- function() {

  x = rep_windows_path()
  clipr::write_clip(x)

}
