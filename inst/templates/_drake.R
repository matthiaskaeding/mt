# Source all files in R, omitting files starting with dot.
R_files <- list.files(
  here::here("R"), pattern = "\\.R$", all.files = FALSE, full.names = TRUE
  )

lapply(R_files, source)

drake::drake_config(plan)
