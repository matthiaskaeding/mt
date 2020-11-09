D = make_grids(4010, 4015, 2040, 2060)

area = st_area(D)
units(area) = "m^2"

expect_identical(
  as.numeric(area),
  rep(1e6, nrow(D)),
  info = "Area correct"
)


COORD = as.data.table(st_coordinates(D))
.idm = COORD[, paste0(first(X) / 1e3, "_", first(Y) / 1e3), by = "L1,L2"]$V1


expect_identical(
  .idm,
  D$idm,
  info = "Ids correct"
)

