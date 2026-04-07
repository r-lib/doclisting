is_s7_generic <- function(x) {
  fn <- tryCatch(match.fun(x), error = function(e) NULL)
  inherits(fn, "S7_generic")
}

# Eventually use something from S7: https://github.com/RConsortium/S7/issues/597
methods_find_s7 <- function(generic, name) {
  methods_env <- attr(generic, "methods")
  methods <- s7_walk_methods(methods_env)

  if (length(methods) == 0) {
    return(data.frame(
      method = character(),
      class = character(),
      package = character(),
      topic = character(),
      visible = logical(),
      source = character(),
    ))
  }

  class <- vapply(methods, \(m) paste(m$classes, collapse = ","), character(1))

  # S7 method topic aliases follow S4 convention: generic,class-method.
  method <- paste0(name, ",", class, "-method")
  package <- vapply(methods, \(m) fn_package(m$method), character(1))
  topic <- help_topic(method, package)

  data.frame(
    method = method,
    class = class,
    package = package,
    topic = topic,
    visible = rep(TRUE, length(methods)),
    source = rep(NA_character_, length(methods))
  )
}

# Recursively walk S7 method table (nested environments) to extract all methods
s7_walk_methods <- function(env, signature = character()) {
  result <- list()
  for (nm in sort(ls(env))) {
    val <- env[[nm]]
    if (is.environment(val)) {
      result <- c(result, s7_walk_methods(val, c(signature, nm)))
    } else {
      result <- c(
        result,
        list(list(
          classes = c(signature, nm),
          method = val
        ))
      )
    }
  }
  result
}
