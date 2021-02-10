#' Prepares git in project folder
#'
#' Mimics default github setup without readme
#' @param target_folder Path of target folder
#' @param ignore Character vector of files to ignore
#' @keywords project, git, github
#' @export

prep_git <- function(
  path = NULL,
  ignore = c(".Rproj.user", ".Rhistory",".DS_store"),
  github = TRUE,
  github_private = TRUE,
  repo_url = "https://github.com/matthiaskaeding/"){

  print(paste0(
    "Preparing git with github in folder ", here::here()
    )
  )

  # Here: create .gitignore
  writeLines(ignore, ".gitignore")
  proj_name = basename(target_folder)

  gert::git_init(path)

  gert::git_branch_create("main", repo = path)
  gert::git_branch_checkout("main", repo = path)
  gert::git_branch_delete("master", repo = path)

  gert::git_add(".gitignore", repo = path)
  gert::git_add(".", repo = path)
  gert::git_commit("first commit", repo = path)

  ### Create github repo
  gh::gh(
    "POST /user/repos",
    name = proj_name,
    private = ifelse(github_private, "private", ""),
    .api_url = "https://api.github.com"
  )

  url <- paste0(repo_url, basename(target_folder), ".git")

  gert::git_remote_add(url, refspec = "refs/heads/main", repo = path)
  gert::git_push()



}






