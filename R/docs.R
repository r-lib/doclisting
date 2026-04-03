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
  methods <- methods_find(x)
  methods <- methods[!is.na(methods$topic), , drop = FALSE]

  if (nrow(methods) == 0) {
    return("")
  }

  # Sort alphabetically by method name
  methods <- methods[order(methods$method), , drop = FALSE]

  external <- methods$package != package
  link <- ifelse(
    external,
    sprintf("\\link[%s:%s]{%s}", methods$package, methods$topic, methods$class),
    sprintf("\\link[%s]{%s}", methods$topic, methods$class)
  )
  pkg <- ifelse(external, sprintf(" (\\pkg{%s})", methods$package), "")
  bullets <- sprintf("\\item \\code{%s}%s", link, pkg)

  paste0("\\itemize{\n", paste0(bullets, collapse = "\n"), "\n}")
}
