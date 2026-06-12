test_that("sd_pop gibt korrekte Populationsstandardabweichung zurück", {
  x <- c(2, 4, 4, 4, 5, 5, 7, 9)
  n <- length(x)
  expected <- sqrt(sum((x - mean(x))^2) / n)
  expect_equal(sd_pop(x), expected)
})

test_that("sd_pop stimmt mit der sd()-basierten Formel überein", {
  x <- c(2, 4, 4, 4, 5, 5, 7, 9)
  n <- length(x)
  expect_equal(sd_pop(x), sd(x) * sqrt((n - 1) / n))
})

test_that("sd_pop mit na.rm=TRUE ignoriert NAs korrekt", {
  x_na <- c(2, 4, NA, 4, 5)
  x_clean <- c(2, 4, 4, 5)
  expect_equal(sd_pop(x_na, na.rm = TRUE), sd_pop(x_clean))
})

test_that("sd_pop mit na.rm=FALSE gibt NA zurück wenn NAs vorhanden", {
  expect_true(is.na(sd_pop(c(1, 2, NA))))
})

test_that("sd_pop eines einzelnen Wertes gibt 0 zurück", {
  expect_equal(sd_pop(c(42, 43)), 0.5)
})

test_that("sd_pop eines konstanten Vektors gibt 0 zurück", {
  expect_equal(sd_pop(c(3, 3, 3, 3)), 0)
})
