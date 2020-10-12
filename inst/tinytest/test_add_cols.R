TARGET = data.table::data.table(id = 1:10)
SOURCE_not_unique = data.table::data.table(id = c(1,1, 2))[, x := rnorm(.N)][, y := rnorm(.N)]
cols = c("x", "y")
on = "id"
expect_error(add_cols(TARGET, SOURCE_not_unique, on = "id", cols = cols))


TARGET = data.table::data.table(id = 1:10)
SOURCE = data.table::data.table(id = 1:5)[, x := rnorm(.N)][, y := rnorm(.N)]
add_cols(TARGET, SOURCE, on = "id", cols = c("x", "y"))

expect_true("x" %in% names(TARGET) && "y" %in% names(TARGET))
expect_true(TARGET[id > 5, all(is.na(x))])
expect_true(TARGET[id > 5, all(is.na(y))])
expect_true(TARGET[id <= 5, all(!is.na(x))])
expect_true(TARGET[id <= 5, all(!is.na(y))])

TARGET = data.table::data.table(id = 1:10)
SOURCE = data.table::data.table(id = c(5:15))[, x := rnorm(.N)][, y := rnorm(.N)]

X = SOURCE[TARGET, on = on]

add_cols(TARGET, SOURCE, "id", c("x", "y"))

expect_identical(X$x, TARGET$x)
expect_identical(X$y, TARGET$y)


TARGET = data.table::data.table(id = 1:10)
SOURCE = data.table::data.table(id = c(11:15))[, x := rnorm(.N)][, y := rnorm(.N)]

add_cols(TARGET, SOURCE, "id", c("x", "y"))
expect_true(all(is.na(TARGET$x)))

