# S7 methods_list output

    Code
      cat(methods_list("uni"))
    Output
      \itemize{
        \item \code{\link[=uni-character-method]{character}}
        \item \code{integer}
      }

# S7 multi-dispatch methods_list output

    Code
      cat(methods_list("multi"))
    Output
      \itemize{
        \item \code{\link[=multi-character-integer-method]{character,integer}}
        \item \code{integer,character}
      }

