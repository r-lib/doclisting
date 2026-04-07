#' Generic test for multiple methods on the same rd file
#'
#' @param x A parameter
same_rd_name <- function(x) {
  UseMethod("same_rd_name")
}

#' Test default
#'
#' @param x A parameter
#' @export
same_rd_name.default <- function(x) {
  x
}

#' @rdname same_rd_name.default
#' @export
same_rd_name.data.frame <- function(x) {
  x
}
