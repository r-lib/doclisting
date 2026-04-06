#' List methods for a generic
#'
#' @description
#' Generate `Rd` markup to list methods for a generic function.
#' `methods_list()` generates an bulleted list and `methods_inline()`
#' produces a comma-separated list, suitable for inline use.
#'
#' You can use them in roxygen2 document in two ways:
#'
#' * Compute methods when package is documented:
#'   `` `r doclist::methods_list("generic")` ``
#'   You'll need to include `doclist` in Suggests.
#'
#' * Compute methods when documentation is rendered:
#'   `` `Rd doclist::methods_list("generic")` ``
#'   You'll need to include `doclist` in Imports.
#'
#' Methods from the same package as the generic are linked without a package
#' qualifier; methods from other packages include the package name.
#'
#' @param x Name of the generic function (a string).
#' @param package Package that defines the generic. Should only be needed
#'   in unusual cases as the default will attempt to determine it automatically.
#' @returns A string containing Rd markup, or `""` if no methods are
#'   found.
#' @export
#' @examples
#' cat(methods_list("mean"))
#' cat(methods_inline("mean"))
methods_list <- function(x, package = NULL) {
  meth <- methods_prep(x, package)
  if (is.null(meth)) {
    return("")
  }

  bullets <- sprintf("  \\item \\code{%s}%s", meth$link, meth$pkg)
  paste0("\\itemize{\n", paste0(bullets, collapse = "\n"), "\n}")
}

#' @rdname methods_list
#' @export
methods_inline <- function(x, package = NULL) {
  meth <- methods_prep(x, package)
  if (is.null(meth)) {
    return("")
  }

  items <- sprintf("\\code{%s}%s", meth$link, meth$pkg)
  paste0(items, collapse = ", ")
}

methods_prep <- function(x, package = NULL) {
  package <- if (is.null(package)) find_package(x) else package
  if (is.null(package)) {
    return(NULL)
  }

  meth <- methods_find(x)
  if (nrow(meth) == 0) {
    return(NULL)
  }

  meth <- meth[order(meth$method), , drop = FALSE]

  # Suppress self-links (methods documented on the same page as the generic)
  generic_topic <- help_topic(x, package)
  meth$topic[meth$topic == generic_topic] <- NA

  documented <- !is.na(meth$topic)
  external <- meth$package != package

  remote <- sprintf("\\link[%s:%s]{%s}", meth$package, meth$topic, meth$class)
  local <- sprintf("\\link[=%s]{%s}", meth$topic, meth$class)
  meth$link <- ifelse(!documented, meth$class, ifelse(external, remote, local))
  meth$pkg <- ifelse(external, sprintf(" (\\pkg{%s})", meth$package), "")

  meth
}
