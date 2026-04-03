# generics methods can be reexported and extended

    Code
      cat(methods_rd("tidy"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testGenericsExtension}
      \itemize{
      \item \code{\link[testGenericsExtension]{tidy-special}}: \code{special_method}
      }

# multiple packages have multiple headers

    Code
      cat(methods_rd("multi_method"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testMultiMethod}
      \itemize{
      \item \code{\link[testMultiMethod]{multi-method-2}}: \code{default}
      \item \code{\link[testMultiMethod]{multi-method-3}}: \code{data.frame}
      }
      \code{testMultiPackage}
      \itemize{
      \item \code{\link[testMultiPackage]{multi-method-4}}: \code{matrix}
      }

# S4 bullets print with no issues

    Code
      cat(methods_rd("multi_method"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testS4Docs}
      \itemize{
      \item \code{\link[testS4Docs]{multi_method}}: \code{ANY,ANY}, \code{numeric,ANY}, \code{numeric,integer}
      }

# S4 and S3 packages can intermingle

    Code
      cat(methods_rd("multi_method"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testMultiMethod}
      \itemize{
      \item \code{\link[testMultiMethod]{multi-method-2}}: \code{default}
      \item \code{\link[testMultiMethod]{multi-method-3}}: \code{data.frame}
      }
      \code{testS4Docs}
      \itemize{
      \item \code{\link[testS4Docs]{multi_method}}: \code{ANY,ANY}, \code{numeric,ANY}, \code{numeric,integer}
      }

# multiple methods but same rdname are comma separated

    Code
      cat(methods_rd("same_rd_name"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testSameRd}
      \itemize{
      \item \code{\link[testSameRd]{same_rd_name-2}}: \code{data.frame}, \code{default}
      }

# single method is correctly itemized

    Code
      cat(methods_rd("single_method"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testSingleMethod}
      \itemize{
      \item \code{\link[testSingleMethod]{single-method-2}}: \code{default}
      }

# multiple methods are correctly itemized

    Code
      cat(methods_rd("multi_method"))
    Output
      See the following help topics for more details about individual methods:
      
      \code{testMultiMethod}
      \itemize{
      \item \code{\link[testMultiMethod]{multi-method-2}}: \code{default}
      \item \code{\link[testMultiMethod]{multi-method-3}}: \code{data.frame}
      }

