D = make_grids(4010, 4015, 2040, 2060)

area = sf::st_area(D)
units(area) = "m^2"

expect_identical(
  as.numeric(area),
  rep(1e6, nrow(D)),
  info = "Area correct"
)


COORD = data.table::as.data.table(sf::st_coordinates(D))
.idm = COORD[, paste0(X[1L] / 1e3, "_", Y[1L] / 1e3), by = "L1,L2"]$V1


expect_identical(
  .idm,
  D$idm,
  info = "Ids correct"
)

