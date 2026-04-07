test_that("methods from multiple packages", {
  local_load_all("testMultiMethod")
  local_load_all("testMultiPackage")
  expect_snapshot(cat(methods_list("uni")))
})

test_that("S4 bullets print with no issues", {
  local_load_all("testS4Docs")

  expect_snapshot(cat(methods_list("multi")))
})

test_that("S4 and S7 packages can intermingle", {
  local_load_all("testS4Docs")
  local_load_all("testS7Docs")

  expect_snapshot(cat(methods_list("multi")))
})

test_that("multiple methods with same rdname", {
  local_load_all("testSameRd")
  expect_snapshot(cat(methods_list("same_rd_name")))
})

test_that("self-links are suppressed", {
  local_load_all("testSelfLink")
  expect_snapshot(cat(methods_list("self_link")))
})

test_that("methods_inline() produces comma-separated output", {
  local_load_all("testMultiMethod")
  local_load_all("testMultiPackage")
  expect_snapshot(cat(methods_inline("uni")))
})

test_that("no methods returns empty string", {
  expect_equal(methods_list("methods_list"), "")
  expect_equal(methods_inline("methods_list"), "")
})

test_that("nonexistant generic returns empty string", {
  expect_equal(methods_list("xyz"), "")
  expect_equal(methods_inline("xyz"), "")
})
