resource "github_repository" "repo_b" {
  name = "repo_b"

  template {
    owner      = "LNPappas"
    repository = "repo_b"
  }

  auto_init              = true
  delete_branch_on_merge = true
}

resource "github_repository" "repo_c" {
  name = "repo_c"

  template {
    owner      = "LNPappas"
    repository = "repo_c"
  }

  auto_init              = true
  delete_branch_on_merge = true
}

resource "github_repository_file" "b_tfvars" {
  repository          = github_repository.repo_b.name
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
  repository          = github_repository.repo_c.name
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
  repository = github_repository.repo_b.name
  branch     = "main"
}

resource "github_branch_protection_v3" "main_c" {
  repository = github_repository.repo_c.name
  branch     = "main"
}

resource "github_branch_default" "default_b" {
  repository = github_repository.repo_b.name
  branch     = "main"
}

resource "github_branch_default" "default_c" {
  repository = github_repository.repo_c.name
  branch     = "main"
}