test_that("generics methods can be reexported and extended", {
  local_load_all("testGenericsExtension")
  expect_snapshot(cat(methods_rd("tidy")))
})

test_that("methods from multiple packages", {
  local_load_all("testMultiMethod")
  local_load_all("testMultiPackage")
  expect_snapshot(cat(methods_rd("multi_method")))
})

test_that("S4 bullets print with no issues", {
  local_load_all("testS4Docs")

  expect_snapshot(cat(methods_rd("multi_method")))
})

test_that("S4 and S3 packages can intermingle", {
  local_load_all("testS4Docs")
  local_load_all("testMultiMethod")

  expect_snapshot(cat(methods_rd("multi_method")))
})

test_that("multiple methods with same rdname", {
  local_load_all("testSameRd")
  expect_snapshot(cat(methods_rd("same_rd_name")))
})

test_that("no methods case returns default output", {
  expect_equal(
    methods_rd("methods_rd"),
    "No methods found in currently loaded packages."
  )
})

test_that("nonexistant generic is an error", {
  expect_error(methods_rd("xyz"))
})
