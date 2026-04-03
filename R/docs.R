methods_rd <- function(x, package = NULL) {
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
