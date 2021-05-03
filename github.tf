// resource "time_sleep" "wait_30_seconds" {
//   depends_on = [github_repository.repo_b]

//   create_duration = "30s"
// }

// # This resource will create (at least) 30 seconds after null_resource.previous
// resource "null_resource" "next" {
//   depends_on = [time_sleep.wait_30_seconds]
// }

resource "github_repository" "repo_b" {
  name                 = "repo_b"
  auto_init            = true
  vulnerability_alerts = true
}

// resource "github_repository" "repo_c" {
//   name = "repo_c"
//   auto_init = true
//   vulnerability_alerts = true
// }

resource "github_repository_file" "b_tfvars" {
  //   depends_on          = [time_sleep.wait_30_seconds]
  repository          = github_repository.repo_b.name
  branch              = "main"
  file                = "terraform.auto.tfvars"
  content             = file("terraform.auto.tfvars")
  commit_message      = "initial commit"
  commit_author       = "Lauren Pappas"
  commit_email        = "LPappas@gmail.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      commit_email,
      commit_author,
      branch
    ]
  }
}

// resource "github_repository_file" "c_tfvars" {
//   repository          = github_repository.repo_c.name
//   branch              = "main"
//   file                = "terraform.auto.tfvars"
//   content             = file("terraform.auto.tfvars")
//   commit_message      = "initial commit"
//   commit_author       = "Lauren Pappas"
//   commit_email        = "LPappas@gmail.com"
//   overwrite_on_create = true

//   lifecycle {
//     ignore_changes = [
//       commit_email,
//       commit_author,
//       branch
//     ]
//   }
// }