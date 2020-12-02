#' Creates project folder.
#'
#' Sets up files, folders etc. Inspired by dflow::use_dflow
#' @param target_folder Path of target folder
#' @param drake use drake?
#' @param default_folders List of folders to create
#' @keywords project, drake
#' @export
#' @examples
#' prep_project("awesome_project")

prep_proj <- function(
  target_folder, drake = TRUE,
  default_folders = c("R", "python", "data", "plots", "lit", "docs")
  ){

  if(!"R" %in% default_folders) stop("Folder <R> necessary")

  if(!dir.exists(target_folder)) {
    print(paste0("Creating ", target_folder))
    dir.create(target_folder)
  } else {
    stop("Aborting, folder already exists")
  }

  # Create .here and Rstudio project file
  fn_here = file.path(target_folder, ".here")
  if(!file.exists(fn_here)) writeLines(character(), fn_here)

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

  writeLines(x, file.path(target_folder, paste0(proj_name, ".Rproj")))


  # Create folders
  lapply(default_folders, function(x) dir.create(file.path(target_folder, x)))

  # Create files
  path_mtools = find.package("matthiastools")
  folder_templates = file.path(path_mtools, "templates")

  # Copy packages
  file.copy(file.path(folder_templates, "packages.R"),
            file.path(target_folder, "R", "packages.R"))

  # Copy README.md
  file.copy(file.path(folder_templates, "README.md"),
            file.path(target_folder, "docs", "README.rmd"))

  if(drake) {

    file.copy(file.path(folder_templates, "_drake.R"),
              file.path(target_folder, "_drake.R"))
    file.copy(file.path(folder_templates, "plan.R"),
              file.path(target_folder, "R", "plan.R"))

  }

  proj_name = basename(target_folder)

  invisible(target_folder)

}






