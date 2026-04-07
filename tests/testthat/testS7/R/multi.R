#' An S7 multi-dispatch generic
#'
#' @param x,y A parameter
#' @export
multi <- S7::new_generic("multi", c("x", "y"))

#' @rdname multi
S7::method(multi, list(S7::class_integer, S7::class_character)) <- function(
  x,
  y,
  ...
) {
  x
}

#' S7 multi-dispatch method
#'
#' @rdname multi-2
S7::method(multi, list(S7::class_character, S7::class_integer)) <- function(
  x,
  y,
  ...
) {
  y
}
