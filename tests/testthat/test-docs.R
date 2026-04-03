test_that("generics methods can be reexported and extended", {
  local_load_all("testGenericsExtension")
  expect_snapshot(cat(methods_list("tidy")))
})

test_that("methods from multiple packages", {
  local_load_all("testMultiMethod")
  local_load_all("testMultiPackage")
  expect_snapshot(cat(methods_list("multi_method")))
})

test_that("S4 bullets print with no issues", {
  local_load_all("testS4Docs")

  expect_snapshot(cat(methods_list("multi_method")))
})

test_that("S4 and S3 packages can intermingle", {
  local_load_all("testS4Docs")
  local_load_all("testMultiMethod")

  expect_snapshot(cat(methods_list("multi_method")))
})

test_that("multiple methods with same rdname", {
  local_load_all("testSameRd")
  expect_snapshot(cat(methods_list("same_rd_name")))
})

test_that("no methods returns empty string", {
  expect_equal(methods_list("methods_list"), "")
})

test_that("nonexistant generic is an error", {
  expect_error(methods_list("xyz"))
})
