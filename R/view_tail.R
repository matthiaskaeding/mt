#' Calls "View" on tail of x
#'
#' @param n vctrs::size of object in viewer
#' @export
view_tail <- function(x, n = 50L) {

    .size = vctrs::vec_size(x)
    .n = min(.size, n)
    i = seq.int(.size - .n + 1L, .size)

    View(
        vctrs::vec_slice(x, i)
    )

}
