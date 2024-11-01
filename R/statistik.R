##' @title Statistics function used at FH SWF within statistics course
##' @author Prof. Dr. Stefan Böcker
##' @export
##' @importFrom stats sd
##' @param x 	a numeric vector or an R object but not a factor coercible to numeric by as.double(x).
##' @param na.rm logical. Should missing values be removed?
sd_pop <- function(x, na.rm = FALSE) {
  n <- length(x)
  return (sd(x, na.rm = na.rm) / n * (n-1) )
}
