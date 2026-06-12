##' @title Statistics function used at FH SWF within statistics course
##' @author Prof. Dr. Stefan Böcker
##' @export
##' @importFrom stats sd
##' @param x 	a numeric vector or an R object but not a factor coercible to numeric by as.double(x).
##' @param na.rm logical. Should missing values be removed?
sd_pop <- function(x, na.rm = FALSE) {
  if (na.rm) x <- x[!is.na(x)]
  n <- length(x)
  if (n <= 1) return(0)
  sd(x) * sqrt((n - 1) / n)
}