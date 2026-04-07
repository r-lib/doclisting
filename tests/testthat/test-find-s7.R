test_that("methods_find finds S7 methods", {
  local_load_all("testS7")
  result <- methods_find("uni")
  expect_equal(result$class, c("character", "integer"))
  expect_equal(result$package, rep("testS7", 2))
  expect_equal(result$topic, c("uni-2", "uni"))
})

test_that("methods_find finds S7 multi-dispatch methods", {
  local_load_all("testS7")
  result <- methods_find("multi")
  expect_equal(result$class, c("character,integer", "integer,character"))
  expect_equal(result$package, rep("testS7", 2))
  expect_equal(result$topic, c("multi-character-integer-method", "multi"))
})

test_that("S7 methods_list output", {
  local_load_all("testS7")
  expect_snapshot(cat(methods_list("uni")))
})

test_that("S7 multi-dispatch methods_list output", {
  local_load_all("testS7")
  expect_snapshot(cat(methods_list("multi")))
})
