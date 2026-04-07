#' Generic test for multiple methods
#'
#' @param x,y A parameter
#' @export
uni <- function(x, y) {
  UseMethod("uni")
}

#' Test default
#'
#' @param x,y A parameter
#' @export
uni.default <- function(x, y) {
  x
}

#' Test data frame
#'
#' @param x,y A parameter
#' @export
uni.data.frame <- function(x, y) {
  x
}

#' @export
uni.character <- function(x, y) {
  x
}
