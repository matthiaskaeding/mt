#' Prepares git in project folder
#'
#' Mimics default github setup without readme
#' @param target_folder Path of target folder
#' @param ignore Character vector of files to ignore
#' @keywords project, git, github
#' @export
#' @examples
#' prep_project("awesome_project")

prep_git_with_github <- function(target_folder, ignore = c(".Rproj.user", ".Rhistory", ".DS_store")){

  print("Preparing git with github")

  # Here: create .gitignore
  writeLines(ignore, file.path(target_folder, ".gitignore"))

  proj_name = basename(target_folder)

  git_rep = git2r::init(target_folder)
  git2r::add(git_rep, ".gitignore")
  git2r::add(git_rep, ".")
  git2r::commit(git_rep, "first commit")
  git2r::branch_rename(git2r::branches(git_rep)$master, "main")

  url = sprintf("https://github.com/matthiaskaeding/%s.git", proj_name)
  git2r::remote_add(git_rep, proj_name, url)

  git2r::push(git_rep, proj_name, "refs/heads/main", set_upstream = TRUE,
              credentials = git2r::cred_token())

  invisible(target_folder)

}






