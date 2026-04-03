methods_rd <- function(x) {
  methods <- methods_find(x)
  methods <- methods[!is.na(methods$topic), , drop = FALSE]

  if (nrow(methods) == 0) {
    return("No methods found in currently loaded packages.")
  }

  # Sort alphabetically by method name
  methods <- methods[order(methods$method), , drop = FALSE]

  bullet_vec <- paste0(
    "\\item \\code{\\link[",
    methods$package,
    ":",
    methods$topic,
    "]{",
    methods$class,
    "}} (\\pkg{",
    methods$package,
    "})"
  )

  bullets <- paste0(bullet_vec, collapse = "\n")
  paste0("\\itemize{\n", bullets, "\n}")
}
