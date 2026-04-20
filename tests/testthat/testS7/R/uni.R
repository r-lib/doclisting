#' An S7 generic
#'
#' @param x,y A parameter
#' @export
uni <- S7::new_generic("uni", "x")

#' @rdname uni
S7::method(uni, S7::class_integer) <- function(x, ...) x

#' S7 character method
S7::method(uni, S7::class_character) <- function(x, ...) x

#' An S7 class
#' @export
foo <- S7::new_class("foo", package = "testS7")

#' S7 foo method
S7::method(uni, foo) <- function(x, ...) x
