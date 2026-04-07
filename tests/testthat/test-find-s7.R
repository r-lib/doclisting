test_that("methods_find finds S7 methods", {
  local_load_all("testS7Docs")
  result <- methods_find("s7_method")
  expect_equal(result$class, c("character", "integer"))
  expect_equal(result$package, rep("testS7Docs", 2))
  expect_equal(result$topic, c("s7-method-2", "s7_method"))
})

test_that("methods_find finds S7 multi-dispatch methods", {
  local_load_all("testS7Docs")
  result <- methods_find("s7_multi")
  expect_equal(result$class, c("character,integer", "integer,character"))
  expect_equal(result$package, rep("testS7Docs", 2))
  expect_equal(result$topic, c("s7-multi-2", "s7_multi"))
})

test_that("S7 methods_list output", {
  local_load_all("testS7Docs")
  expect_snapshot(cat(methods_list("s7_method")))
})

test_that("S7 multi-dispatch methods_list output", {
  local_load_all("testS7Docs")
  expect_snapshot(cat(methods_list("s7_multi")))
})
