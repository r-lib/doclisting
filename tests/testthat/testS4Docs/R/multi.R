#' An s4 generic
#'
#' @export
#' @aliases multi,ANY,ANY-method
setGeneric("multi", function(x, y) {
  x
})

#' @rdname multi
#' @export
setMethod("multi", signature(x = "numeric"), function(x, y) {
  x
})

#' @rdname multi
#' @export
setMethod(
  "multi",
  signature(x = "numeric", y = "integer"),
  function(x, y) {
    x
  }
)

#' @export
setMethod("multi", signature(x = "character"), function(x, y) {
  x
})
