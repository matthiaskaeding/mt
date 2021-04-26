#' Calls "View" on "head(x)"
#'
#' @param n vctrs::size of object in viewer
#' @export
view_sample <- function(x, n = 50) {

    i <- sample(vctrs::vec_size(x), n)
    View(
        vctrs::vec_slice(x, i)
    )

}