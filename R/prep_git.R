#' Prepares git in project folder
#'
#' Mimics default github setup without readme
#' @param target_folder target folder
#' @param ignore Character vector of files to ignore
#' @param github Create github repo?
#' @param github_private Should this be private (logical)?
#' @keywords project, git, github
#' @export

prep_git <- function(
  target_folder = NULL,
  ignore = c(".Rproj.user/", ".Rhistory",".DS_store"),
  github = TRUE,
  github_private = TRUE,
  repo_url = "https://github.com/matthiaskaeding/"){

  stopifnot(fs::dir_exists(target_folder))

  gitinfo <- tryCatch(git_info(target_folder), error = function(x) NULL)
  if(!is.null(gitinfo)) stop("Already a git repo")

  last_char <- substr(repo_url, nchar(repo_url), nchar(repo_url))
  if(!identical(last_char, "/")) stop("repo_url must end with '/'")

  # Here: create .gitignore
  writeLines(ignore, file.path(target_folder, ".gitignore"))
  proj_name = basename(target_folder)

  gert::git_init(target_folder)

  gert::git_add(".gitignore", repo = target_folder)
  gert::git_add(".", repo = target_folder)
  gert::git_commit("first commit", repo = target_folder)

  gert::git_branch_create("main", repo = target_folder)
  gert::git_branch_checkout("main", repo = target_folder)
  gert::git_branch_delete("master", repo = target_folder)

  if(github) {

    ### Create github repo
    gh::gh(
      "POST /user/repos",
      name = proj_name,
      private = ifelse(github_private, "private", ""),
      .api_url = "https://api.github.com"
    )

    url <- paste0(repo_url, proj_name, ".git")

    gert::git_remote_add(url, repo = target_folder)
    gert::git_push(remote = "origin", repo = target_folder)

  }

  target_folder

}
