test_that("methods_find returns expected columns", {
  local_load_all("testMultiMethod")
  result <- methods_find("uni")
  expect_named(
    result,
    c("method", "class", "package", "topic", "visible", "source")
  )
})

test_that("methods_find finds S3 methods", {
  local_load_all("testMultiMethod")
  result <- methods_find("uni")
  expect_equal(result$class, c("character", "data.frame", "default"))
  expect_equal(result$package, rep("testMultiMethod", 3))
  expect_equal(result$topic, c(NA, "uni-3", "uni-2"))
})

test_that("methods_find finds S4 methods", {
  local_load_all("testS4Docs")
  result <- methods_find("multi")
  expect_equal(
    result$class,
    c("ANY,ANY", "character,ANY", "numeric,ANY", "numeric,integer")
  )
  expect_equal(result$package, rep("testS4Docs", 4))
})

test_that("methods_find finds methods across packages", {
  local_load_all("testMultiMethod")
  local_load_all("testMultiPackage")
  result <- methods_find("uni")
  expect_contains(result$package, c("testMultiMethod", "testMultiPackage"))
})

test_that("methods_find returns empty result for generic with no methods", {
  result <- methods_find("methods_list")
  expect_equal(nrow(result), 0)
})

test_that("methods_find groups same rdname methods under same topic", {
  local_load_all("testSameRd")
  result <- methods_find("same_rd_name")
  expect_equal(result$topic, c("same_rd_name-2", "same_rd_name-2"))
  expect_equal(result$class, c("data.frame", "default"))
})

test_that("lookup_package finds S3 method package", {
  local_load_all("testMultiMethod")
  expect_equal(
    lookup_package("uni", "default", FALSE),
    "testMultiMethod"
  )
  expect_equal(
    lookup_package("uni", "data.frame", FALSE),
    "testMultiMethod"
  )
})

test_that("lookup_package finds S4 method package", {
  local_load_all("testS4Docs")
  expect_equal(
    lookup_package("multi", "numeric,ANY", TRUE),
    "testS4Docs"
  )
})

test_that("lookup_package returns NA for nonexistent method", {
  expect_equal(
    lookup_package("uni", "nonexistent_class", FALSE),
    NA_character_
  )
})
