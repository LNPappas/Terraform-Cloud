resource "github_repository" "repo_b" {
  name = "repo_b"
}

resource "github_repository" "repo_c" {
  name = "repo_c"
}

resource "github_repository_file" "b_tfvars" {
  repository          = "repo_b"
  branch              = "main"
  file                = "repo_b.tfvars"
  content             = "repo_b.tfvars"
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_repository_file" "c_tfvars" {
  repository          = "repo_c"
  branch              = "main"
  file                = "repo_c.tfvars"
  content             = "repo_c.tfvars"
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = false

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

resource "github_branch_protection_v3" "main_b" {
  repository = "repo_b"
  branch     = "main"
}

resource "github_branch_protection_v3" "main_c" {
  repository = "repo_c"
  branch     = "main"
}

resource "github_branch_default" "default_b" {
  repository = "repo_b"
  branch     = "main"
}

resource "github_branch_default" "default_c" {
  repository = "repo_c"
  branch     = "main"
}