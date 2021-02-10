target_folder0 <- tempdir()
target_folder <- file.path(target_folder0, uuid::UUIDgenerate())

fs::dir_create(target_folder)

prep_git(target_folder = target_folder, github = F)
gi <- gert::git_info(target_folder)

expect_true(is.list(gi))
expect_identical(gi$shorthand, "main")

