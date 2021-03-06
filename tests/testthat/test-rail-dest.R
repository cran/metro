test_that("destination for one origin and destination", {
  skip_if_no_key()
  Sys.sleep(0.11)
  d <- rail_destination("A01", "C04")
  expect_equal(nrow(d), 1)
})

test_that("destination for one origin and all destinations", {
  skip_if_no_key()
  Sys.sleep(0.11)
  d <- rail_destination(FromStationCode = "A01")
  expect_gt(nrow(d), 1)
  expect_equal(unique(d$SourceStation), "A01")
})

test_that("destination for all origin and one destination", {
  skip_if_no_key()
  Sys.sleep(0.11)
  d <- rail_destination(ToStationCode = "A01")
  expect_gt(nrow(d), 1)
  expect_equal(unique(d$DestinationStation), "A01")
})

test_that("all destination and origin combos", {
  skip_if_no_key()
  Sys.sleep(0.11)
  d <- rail_destination()
  expect_length(d, 7)
  expect_s3_class(d, "data.frame")
  expect_type(d$CompositeMiles, "double")
  expect_type(d$RailTime, "integer")
  expect_gt(nrow(d), 1000)
})
