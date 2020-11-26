# Look up all .R files, omit those starting with dot
R_files <- list.files(
  here::here("R"), pattern = "\\.R$", all.files = TRUE, full.names = TRUE)

lapply(
  R_files[!startsWith(basename(R_files), ".")],
  source)

drake::drake_config(plan)
