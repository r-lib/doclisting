#' A generic with a self-linked method
#'
#' @param x A parameter
#' @export
self_link <- function(x) {
  UseMethod("self_link")
}

#' @rdname self_link
#' @export
self_link.default <- function(x) {
  x
}

#' Test data frame
#'
#' @param x A parameter
#' @export
self_link.data.frame <- function(x) {
  x
}
