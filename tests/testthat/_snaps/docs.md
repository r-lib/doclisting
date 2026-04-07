# methods from multiple packages

    Code
      cat(methods_list("uni"))
    Output
      \itemize{
        \item \code{character}
        \item \code{\link[=uni.data.frame]{data.frame}}
        \item \code{\link[=uni.default]{default}}
        \item \code{\link[testMultiPackage:uni.matrix]{matrix}} (\pkg{testMultiPackage})
      }

# S4 bullets print with no issues

    Code
      cat(methods_list("multi"))
    Output
      \itemize{
        \item \code{ANY,ANY}
        \item \code{character,ANY}
        \item \code{numeric,ANY}
        \item \code{numeric,integer}
      }

# S4 and S7 packages can intermingle

    Code
      cat(methods_list("multi"))
    Output
      \itemize{
        \item \code{\link[=multi-character-integer-method]{character,integer}}
        \item \code{integer,character}
      }

# multiple methods with same rdname

    Code
      cat(methods_list("same_rd_name"))
    Output
      \itemize{
        \item \code{\link[=same_rd_name.default]{data.frame}}
        \item \code{\link[=same_rd_name.default]{default}}
      }

# self-links are suppressed

    Code
      cat(methods_list("self_link"))
    Output
      \itemize{
        \item \code{\link[=self_link.data.frame]{data.frame}}
        \item \code{default}
      }

# methods_inline() produces comma-separated output

    Code
      cat(methods_inline("uni"))
    Output
      \code{character}, \code{\link[=uni.data.frame]{data.frame}},
      \code{\link[=uni.default]{default}},
      \code{\link[testMultiPackage:uni.matrix]{matrix}} (\pkg{testMultiPackage})

