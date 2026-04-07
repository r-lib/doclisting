test_that("methods_find returns expected columns", {
  local_load_all("testS3")
  result <- methods_find("uni")
  expect_named(
    result,
    c("method", "class", "package", "topic", "visible", "source")
  )
})

test_that("methods_find finds S3 methods", {
  local_load_all("testS3")
  result <- methods_find("uni")
  expect_equal(result$class, c("character", "data.frame", "default"))
  expect_equal(result$package, rep("testS3", 3))
  expect_equal(result$topic, c(NA, "uni.data.frame", "uni.default"))
})

test_that("methods_find finds S4 methods", {
  local_load_all("testS4")
  result <- methods_find("multi")
  expect_equal(
    result$class,
    c("ANY,ANY", "character,ANY", "numeric,ANY", "numeric,integer")
  )
  expect_equal(result$package, rep("testS4", 4))
})

test_that("methods_find finds methods across packages", {
  local_load_all("testS3")
  local_load_all("testExtendsS3")
  result <- methods_find("uni")
  expect_contains(result$package, c("testS3", "testExtendsS3"))
})

test_that("methods_find returns empty result for generic with no methods", {
  result <- methods_find("methods_list")
  expect_equal(nrow(result), 0)
})

test_that("methods_find groups same rdname methods under same topic", {
  local_load_all("testS3")
  result <- methods_find("same_rd_name")
  expect_equal(result$topic, c("same_rd_name.default", "same_rd_name.default"))
  expect_equal(result$class, c("data.frame", "default"))
})

test_that("lookup_package finds S3 method package", {
  local_load_all("testS3")
  expect_equal(
    lookup_package("uni", "default", FALSE),
    "testS3"
  )
  expect_equal(
    lookup_package("uni", "data.frame", FALSE),
    "testS3"
  )
})

test_that("lookup_package finds S4 method package", {
  local_load_all("testS4")
  expect_equal(
    lookup_package("multi", "numeric,ANY", TRUE),
    "testS4"
  )
})

test_that("lookup_package returns NA for nonexistent method", {
  expect_equal(
    lookup_package("uni", "nonexistent_class", FALSE),
    NA_character_
  )
})
