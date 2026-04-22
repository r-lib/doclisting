# S7 methods_list output

    Code
      cat(methods_list("uni"))
    Output
      \itemize{
        \item \code{\link[=uni-character-method]{character}}
        \item \code{integer}
        \item \code{\link[=uni-testS7-foo-method]{testS7::foo}}
      }

# S7 multi-dispatch methods_list output

    Code
      cat(methods_list("multi"))
    Output
      \itemize{
        \item \code{\link[=multi-character-integer-method]{character,integer}}
        \item \code{integer,character}
      }

