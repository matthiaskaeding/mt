test = 1:1e3
folders = make_hive_folder("", test = test)
tinytest::expect_true(
  length(unique(basename(folders))) == length(folders)
  )
