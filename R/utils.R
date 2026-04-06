local_load_all <- function(path, env = parent.frame()) {
  pkgload::load_all(path, quiet = TRUE)
  defer(pkgload::unload(path), env = env)
}

defer <- function(expr, env = parent.frame(), after = FALSE) {
  thunk <- as.call(list(function() expr))
  do.call(on.exit, list(thunk, TRUE, after), envir = env)
}

find_package <- function(x) {
  fn <- tryCatch(match.fun(x), error = function(e) NULL)
  if (is.null(fn)) {
    return(NULL)
  }
  utils::packageName(environment(fn))
}

last <- function(x, n = 0) {
  if (length(x) <= n) {
    x[NA_integer_]
  } else {
    x[[length(x) - n]]
  }
}
