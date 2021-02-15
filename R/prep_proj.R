#' Creates project folder.
#'
#' Sets up files, folders etc. Inspired by dflow::use_dflow
#' @param target_folder Path of target folder. Use .... or <target_folder>
#' @param targets use targets packages?
#' @param default_folders List of folders to create
#' @keywords project, drake
#' @export
#' @examples
#' prep_project("awesome_project")

prep_proj <- function(
  target_folder = NULL, targets = TRUE,
  default_folders = c("R", "python", "data", "plots", "lit", "docs")
  ){

  if(!"R" %in% default_folders) stop("Folder <R> necessary")
  if(is.null(target_folder)) stop("Specify target_folder")
  if(fs::dir_exists(target_folder)) stop("target_folder must not exists")

  if(!fs::dir_exists(target_folder)) {
    print(paste0("Creating ", target_folder))
    fs::dir_create(target_folder)
  } else {
    stop("Aborting, folder already exists")
  }

  # Create .here and Rstudio project file
  fn_here = fs::path(target_folder, ".here")
  if(!fs::file_exists(fn_here)) writeLines(character(), fn_here)

  proj_name = basename(target_folder)

  x <- c("Version: 1.0",
         "",
         "RestoreWorkspace: No",
         "SaveWorkspace: No",
         "AlwaysSaveHistory: No",
         "",
         "EnableCodeIndexing: Yes",
         "UseSpacesForTab: Yes",
         "NumSpacesForTab: 4",
         "Encoding: UTF-8",
         "",
         "RnwWeave: knitr",
         "LaTeX: pdfLaTeX")

  writeLines(x, fs::path(target_folder, paste0(proj_name, ".Rproj")))

  # Create folders
  lapply(default_folders, function(x) fs::dir_create(fs::path(target_folder, x)))

  # Create files
  path_mtools = find.package("matthiastools")
  folder_templates = fs::path(path_mtools, "templates")

  # Copy README.md
  fs::file_copy(
    fs::path(folder_templates, "README.rmd"),
    fs::path(target_folder, "docs", "README.rmd")
  )

  if(isTRUE(targets)) {

    fs::file_copy(
      fs::path(folder_templates, "_targets.R"),
      fs::path(target_folder, "_targets.R")
    )

  }

  proj_name <- basename(target_folder)

  invisible(target_folder)

}






