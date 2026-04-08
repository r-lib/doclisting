# List methods for a generic

Generate `Rd` markup to list methods for a generic function.
`methods_list()` generates a bulleted list and `methods_inline()`
produces a comma-separated list, suitable for inline use.

You can use them in roxygen2 documentation in two ways:

- Compute methods when package is documented:
  `` `r doclisting::methods_list("generic")` `` You'll need to include
  `doclisting` in Suggests.

- Compute methods when documentation is rendered:
  `` `Rd doclisting::methods_list("generic")` `` You'll need to include
  `doclisting` in Imports.

Methods from the same package as the generic are linked without a
package qualifier; methods from other packages include the package name.

## Usage

``` r
methods_list(x, package = NULL)

methods_inline(x, package = NULL)
```

## Arguments

- x:

  Name of the generic function (a string).

- package:

  Package that defines the generic. Should only be needed in unusual
  cases as the default will attempt to determine it automatically.

## Value

A string containing Rd markup, or `""` if no methods are found.

## Examples

``` r
cat(methods_list("mean"))
#> \itemize{
#>   \item \code{\link[=Dates]{Date}}
#>   \item \code{\link[=DateTimeClasses]{POSIXct}}
#>   \item \code{\link[=DateTimeClasses]{POSIXlt}}
#>   \item \code{default}
#>   \item \code{\link[=difftime]{difftime}}
#>   \item \code{quosure} (\pkg{rlang})
#>   \item \code{vctrs_vctr} (\pkg{vctrs})
#> }
cat(methods_inline("mean"))
#> \code{\link[=Dates]{Date}}, \code{\link[=DateTimeClasses]{POSIXct}},
#> \code{\link[=DateTimeClasses]{POSIXlt}}, \code{default},
#> \code{\link[=difftime]{difftime}}, \code{quosure} (\pkg{rlang}),
#> \code{vctrs_vctr} (\pkg{vctrs})
```
