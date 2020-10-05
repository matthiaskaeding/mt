#' Prepares project folder structure WITHIN a project
#'
#' Meant to be used after usethis::create_project
#' Sets up files, folders etc
#' @param drake use {drake}?
#' @param git git repo?
#' @param git_author Author in
#' @param ignore Input for gitignore
#' @param github Create github repo?
#' @param ignore Input for gitignore
#' @keywords project, git, github
#' @export
#' @examples
#' prepare_project()

prep_project <- function(
  target_folder,
  drake = TRUE,
  default_folders = c("R", "python", "data", "plots", "lit", "doc"),
  github
  ){

  if(!"R" %in% default_folders) stop("Folder <R> necessary")

  if(!dir.exists(target_folder)) {
    print(paste0("Creating, ", target_folder))
    dir.create(target_folder)
  } else {
    stop("Aborting, folder already exists")
  }

  if(missing(github)) {
    if(!github %in% c("public", "private")) stop('<github> must be either "private" or "public"')
  }

  # Setting .here file
  fn_here = file.path(target_folder, ".here")
  if(!file.exists(fn_here)) writeLines(character(), fn_here)


  # Create folders
  lapply(default_folders, function(x) dir.create(file.path(target_folder, x)))

  # Create files
  path_mtools = find.package("matthiastools")
  folder_templates = file.path(path_mtools, "templates")

  # Copy packages
  file.copy(file.path(folder_templates, "packages.R"),
            file.path(target_folder, "R", "packages.R"))


  if(drake) {

    file.copy(file.path(folder_templates, "_drake.R"),
              file.path(target_folder, "_drake.R"))
    file.copy(file.path(folder_templates, "plan.R"),
              file.path(target_folder, "R", "plan.R"))

  }

  proj_name = basename(target_folder)

  if(github == "private") {
    gh::gh("POST /user/repos", name = proj_name, private = TRUE)
  } else if (github == "public") {
    gh::gh("POST /user/repos", name = proj_name, private = FALSE)
  }

  invisible(target_folder)

}






