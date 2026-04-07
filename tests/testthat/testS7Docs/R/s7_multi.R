#' An S7 multi-dispatch generic
#'
#' @param x,y A parameter
#' @export
s7_multi <- S7::new_generic("s7_multi", c("x", "y"))

#' @rdname s7_multi
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
S7::method(s7_multi, list(S7::class_character, S7::class_integer)) <- function(
  x,
  y,
  ...
) {
  y
}
