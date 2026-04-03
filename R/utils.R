local_load_all <- function(path, env = parent.frame()) {
  pkgload::load_all(path, quiet = TRUE)
  withr::defer(pkgload::unload(path), envir = env)
}

last <- function(x, n = 0) {
  if (length(x) <= n) {
    x[NA_integer_]
  } else {
    x[[length(x) - n]]
  }
}
