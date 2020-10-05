#' Find a pattern within a directory of R files
#'
#' Yes, find a pattern
#' @param pattern The pattern
#' @param folder Folder where to search
#' @keywords cats
#' @export
#' @examples
#' find_pattern_in_text_files("mean")

find_pattern_in_text_files = function(pattern, folder = here::here()) {


  files <- list.files(folder, recursive = T, full.names = T, pattern = "\\.R$")
  res <- vector("list", length(files))

  for(i in seq_along(files)) {

    #print(i)
    file <- files[i]
    lines <- readLines(file)
    if(any(grep(pattern, lines))) res[[i]] <- file

  }

  out <- unlist(res)
  out

}
