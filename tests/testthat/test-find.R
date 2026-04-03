test_that("methods_find returns expected columns", {
  local_load_all("testMultiMethod")
  result <- methods_find("multi_method")
  expect_named(result, c("method", "class", "package", "topic", "visible", "source"))
})

test_that("methods_find finds S3 methods", {
  local_load_all("testMultiMethod")
  result <- methods_find("multi_method")
  expect_equal(result$class, c("data.frame", "default"))
  expect_equal(result$package, c("testMultiMethod", "testMultiMethod"))
  expect_equal(result$topic, c("multi-method-3", "multi-method-2"))
})

test_that("methods_find finds S4 methods", {
  local_load_all("testS4Docs")
  result <- methods_find("multi_method")
  expect_equal(result$class, c("ANY,ANY", "numeric,ANY", "numeric,integer"))
  expect_equal(result$package, rep("testS4Docs", 3))
})

test_that("methods_find finds methods across packages", {
  local_load_all("testMultiMethod")
  local_load_all("testMultiPackage")
  result <- methods_find("multi_method")
  expect_contains(result$package, c("testMultiMethod", "testMultiPackage"))
})

test_that("methods_find returns empty result for generic with no methods", {
  result <- methods_find("methods_rd")
  expect_equal(nrow(result), 0)
})

test_that("methods_find handles reexported generics", {
  local_load_all("testGenericsExtension")
  result <- methods_find("tidy")
  ext <- result[result$package == "testGenericsExtension", ]
  expect_equal(ext$class, "special_method")
  expect_equal(ext$topic, "tidy-special")
})

test_that("methods_find groups same rdname methods under same topic", {
  local_load_all("testSameRd")
  result <- methods_find("same_rd_name")
  expect_equal(result$topic, c("same_rd_name-2", "same_rd_name-2"))
  expect_equal(result$class, c("data.frame", "default"))
})

test_that("lookup_package finds S3 method package", {
  local_load_all("testMultiMethod")
  expect_equal(lookup_package("multi_method", "default", FALSE), "testMultiMethod")
  expect_equal(lookup_package("multi_method", "data.frame", FALSE), "testMultiMethod")
})

test_that("lookup_package finds S4 method package", {
  local_load_all("testS4Docs")
  expect_equal(lookup_package("multi_method", "numeric,ANY", TRUE), "testS4Docs")
})

test_that("lookup_package returns NA for nonexistent method", {
  expect_equal(lookup_package("multi_method", "nonexistent_class", FALSE), NA_character_)
})
