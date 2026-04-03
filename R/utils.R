local_load_all <- function(path, env = parent.frame()) {
  pkgload::load_all(path, quiet = TRUE)
  defer(pkgload::unload(path), env = env)
}

defer <- function(expr, env = parent.frame(), after = FALSE) {
  thunk <- as.call(list(function() expr))
  do.call(on.exit, list(thunk, TRUE, after), envir = env)
}

last <- function(x, n = 0) {
  if (length(x) <= n) {
    x[NA_integer_]
  } else {
    x[[length(x) - n]]
  }
}
