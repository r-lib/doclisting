# for internal use only
document_test_packages <- function() {
  pkgs <- list.dirs("tests/testthat", recursive = FALSE, full.names = TRUE)
  pkgs <- pkgs[file.exists(file.path(pkgs, "DESCRIPTION"))]
  for (pkg in pkgs) {
    getNamespace("roxygen2")$roxygenise(pkg)
  }
}

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
  fn_package(fn)
}

fn_package <- function(fn) {
  pkg <- utils::packageName(environment(fn))
  if (is.null(pkg)) NA_character_ else pkg
}

last <- function(x, n = 0) {
  if (length(x) <= n) {
    x[NA_integer_]
  } else {
    x[[length(x) - n]]
  }
}
