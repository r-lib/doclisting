
<!-- README.md is generated from README.Rmd. Please edit that file -->

# doclisting

<!-- badges: start -->

<!-- badges: end -->

doclisting automatically generates itemized lists of methods for a
generic function, suitable for inclusion in roxygen2 documentation. Each
method links to its help topic, and methods from other packages are
clearly labeled.

## Installation

You can install the development version of doclisting from GitHub:

``` r
pak::pak("hadley/doclisting")
```

## Usage

`methods_list()` and `methods_inline()` generate Rd markup listing all
methods for a generic:

``` r
cat(doclisting::methods_list("mean"))
#> \itemize{
#>   \item \code{\link[=Dates]{Date}}
#>   \item \code{default}
#>   \item \code{\link[=difftime]{difftime}}
#>   \item \code{\link[=DateTimeClasses]{POSIXct}}
#>   \item \code{\link[=DateTimeClasses]{POSIXlt}}
#>   \item \code{quosure} (\pkg{rlang})
#> }
cat(doclisting::methods_inline("mean"))
#> \code{\link[=Dates]{Date}}, \code{default}, \code{\link[=difftime]{difftime}}, \code{\link[=DateTimeClasses]{POSIXct}}, \code{\link[=DateTimeClasses]{POSIXlt}}, \code{quosure} (\pkg{rlang})
```

You can use it in roxygen2 documentation in two ways:

- Compute methods when the package is documented (i.e. at
  `devtools::document()` time), use inline R code in your roxygen
  comment:

      #' @description
      #' `r doclisting::methods_list("my_generic")`

  You’ll need to add `doclisting` to `Suggests`.

- Compute methods when documentation is rendered (i.e. at `?` time), use
  an Rd code block:

      #' @description
      #' `Rd doclisting::methods_list("my_generic")`

  You’ll need to add `doclisting` to `Imports` and add dummy call to
  `methods_list()` to eliminate the R CMD check note:

  ``` r
  ignore_unused_imports <- function() {
      doclisting::methods_list
  }
  ```
