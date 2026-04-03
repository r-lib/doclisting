methods_rd <- function(x) {
  methods <- methods_find(x)
  methods <- methods[!is.na(methods$topic), , drop = FALSE]

  if (nrow(methods) == 0) {
    return("No methods found in currently loaded packages.")
  }

  # Sort alphabetically by method name
  methods <- methods[order(methods$method), , drop = FALSE]

  bullets <- sprintf(
    "\\item \\code{\\link[%s:%s]{%s}} (\\pkg{%s})",
    methods$package,
    methods$topic,
    methods$class,
    methods$package
  )

  paste0("\\itemize{\n", paste0(bullets, collapse = "\n"), "\n}")
}
