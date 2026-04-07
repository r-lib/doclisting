#' An S4 uni generic
#'
#' @export
#' @aliases uni,ANY-method
setGeneric("uni", function(x, y) {
  x
})

#' @rdname uni
#' @export
setMethod("uni", signature(x = "numeric"), function(x, y) {
  x
})

#' @export
setMethod("uni", signature(x = "character"), function(x, y) {
  x
})
