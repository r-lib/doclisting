#' An S7 generic
#'
#' @param x,y A parameter
#' @export
s7_method <- S7::new_generic("s7_method", "x")

#' @rdname s7_method
S7::method(s7_method, S7::class_integer) <- function(x, ...) x

#' S7 character method
#'
#' @rdname s7-method-2
S7::method(s7_method, S7::class_character) <- function(x, ...) x
