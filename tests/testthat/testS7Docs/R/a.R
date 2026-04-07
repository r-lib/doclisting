#' An S7 generic
#'
#' @param x,y A parameter
#' @export
s7_method <- S7::new_generic("s7_method", "x")

#' @rdname s7_method
#' @name s7_method,integer-method
S7::method(s7_method, S7::class_integer) <- function(x, ...) x

#' S7 character method
#'
#' @rdname s7-method-2
#' @name s7_method,character-method
S7::method(s7_method, S7::class_character) <- function(x, ...) x

#' An S7 multi-dispatch generic
#'
#' @param x,y A parameter
#' @export
s7_multi <- S7::new_generic("s7_multi", c("x", "y"))

#' @rdname s7_multi
#' @name s7_multi,integer,character-method
S7::method(s7_multi, list(S7::class_integer, S7::class_character)) <- function(
  x,
  y,
  ...
) {
  x
}

#' S7 multi-dispatch method
#'
#' @rdname s7-multi-2
#' @name s7_multi,character,integer-method
S7::method(s7_multi, list(S7::class_character, S7::class_integer)) <- function(
  x,
  y,
  ...
) {
  y
}

.onLoad <- function(...) {
  S7::methods_register()
}
