#' Makes approx equal sized chunks of a vector
#'
#' @param x Vector to chunk
#' @param chunksize Size of chunk
#' @export
#' @examples
#' make_chunks(1:10, 3)

make_chunks = function(x, chunksize) {
  split(x, ceiling(seq_along(x) / chunksize ))
}
