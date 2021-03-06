target_folder0 <- tempdir()
target_folder <- file.path(target_folder0, uuid::UUIDgenerate())
prep_proj(target_folder = target_folder)

expect_true(
  dir.exists(target_folder)
)

subfolders <- basename(list.dirs(target_folder, recursive = F))
expect_true(
  all(c("data", "docs", "lit", "plots", "python", "R") %in% subfolders)
)
