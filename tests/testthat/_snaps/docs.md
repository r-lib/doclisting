# methods from multiple packages

    Code
      cat(methods_list("multi_method"))
    Output
      \itemize{
        \item \code{character}
        \item \code{\link[multi-method-3]{data.frame}}
        \item \code{\link[multi-method-2]{default}}
        \item \code{\link[testMultiPackage:multi-method-4]{matrix}} (\pkg{testMultiPackage})
      }

# S4 bullets print with no issues

    Code
      cat(methods_list("multi_method"))
    Output
      \itemize{
        \item \code{\link[multi_method]{ANY,ANY}}
        \item \code{character,ANY}
        \item \code{\link[multi_method]{numeric,ANY}}
        \item \code{\link[multi_method]{numeric,integer}}
      }

# S4 and S3 packages can intermingle

    Code
      cat(methods_list("multi_method"))
    Output
      \itemize{
        \item \code{\link[testS4Docs:multi_method]{ANY,ANY}} (\pkg{testS4Docs})
        \item \code{character,ANY}
        \item \code{\link[testS4Docs:multi_method]{numeric,ANY}} (\pkg{testS4Docs})
        \item \code{\link[testS4Docs:multi_method]{numeric,integer}} (\pkg{testS4Docs})
        \item \code{character}
        \item \code{\link[multi-method-3]{data.frame}}
        \item \code{\link[multi-method-2]{default}}
      }

# multiple methods with same rdname

    Code
      cat(methods_list("same_rd_name"))
    Output
      \itemize{
        \item \code{\link[same_rd_name-2]{data.frame}}
        \item \code{\link[same_rd_name-2]{default}}
      }

