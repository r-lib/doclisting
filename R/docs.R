#' List methods for a generic
#'
#' @description
#' Generates an Rd `\itemize{}` block listing all methods found for a
#' generic function, with links to their help topics. Methods from the
#' same package as the generic are linked without a package qualifier;
#' methods from other packages include the package name.
#'
#' You can use in roxygen2 document in two ways:
#'
#' * Compute methods when package is documented:
#'   `` `r doclist::methods_list("generic")` ``
#'   You'll need to include `doclist` in Suggests.
#'
#' * Compute methods when documentation is rendered:
#'   `` `Rd doclist::methods_list("generic")` ``
#'   You'll need to include `doclist` in Imports.
#'
#' @param x Name of the generic function (a string).
#' @param package Package that defines the generic. Defaults to the
#'   package where the generic is defined.
#' @returns A string containing Rd markup, or `""` if no methods are
#'   found.
#' @export
#' @examples
#' cat(methods_list("mean"))
methods_list <- function(x, package = NULL) {
  package <- package %||% utils::packageName(environment(match.fun(x)))
  meth <- methods_find(x)
  if (nrow(meth) == 0) {
    return("")
  }

  meth <- meth[order(meth$method), , drop = FALSE]

  documented <- !is.na(meth$topic)
  external <- meth$package != package

  remote <- sprintf("\\link[%s:%s]{%s}", meth$package, meth$topic, meth$class)
  local <- sprintf("\\link[%s]{%s}", meth$topic, meth$class)
  link <- ifelse(!documented, meth$class, ifelse(external, remote, local))

  pkg <- ifelse(external, sprintf(" (\\pkg{%s})", meth$package), "")
  bullets <- sprintf("  \\item \\code{%s}%s", link, pkg)

  paste0("\\itemize{\n", paste0(bullets, collapse = "\n"), "\n}")
}
