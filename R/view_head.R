#' Calls "View" on "head" of x
#'
#' @param n vctrs::size of object in viewer
#' @export
view_head <- function(x, n = 50L) {

    .n = min(vctrs::vec_size(x), n)
    View(
        vctrs::vec_slice(x, seq_len(.n))
    )
    
}
