##[>] 🤖🤖
moved {
  from = gitlab_project.this["konradodwrot/configs"]
  to   = module.l0.gitlab_project.this["konradodwrot/configs"]
}

moved {
  from = gitlab_branch_protection.this["konradodwrot/configs"]
  to   = module.l0.gitlab_branch_protection.this["konradodwrot/configs"]
}

moved {
  from = gitlab_project.this["konradodwrot/go/che"]
  to   = module.l1.gitlab_project.this["konradodwrot/go/che"]
}

moved {
  from = gitlab_branch_protection.this["konradodwrot/go/che"]
  to   = module.l1.gitlab_branch_protection.this["konradodwrot/go/che"]
}

moved {
  from = gitlab_project.this["konradodwrot/go/render-files"]
  to   = module.l1.gitlab_project.this["konradodwrot/go/render-files"]
}

moved {
  from = gitlab_branch_protection.this["konradodwrot/go/render-files"]
  to   = module.l1.gitlab_branch_protection.this["konradodwrot/go/render-files"]
}

moved {
  from = gitlab_project.this["konradodwrot/infra/git-repos"]
  to   = module.l1.gitlab_project.this["konradodwrot/infra/git-repos"]
}

moved {
  from = gitlab_branch_protection.this["konradodwrot/infra/git-repos"]
  to   = module.l1.gitlab_branch_protection.this["konradodwrot/infra/git-repos"]
}

moved {
  from = gitlab_project.this["konradodwrot/go/cruft/get-os-open-files-with"]
  to   = module.l2.gitlab_project.this["konradodwrot/go/cruft/get-os-open-files-with"]
}

moved {
  from = gitlab_branch_protection.this["konradodwrot/go/cruft/get-os-open-files-with"]
  to   = module.l2.gitlab_branch_protection.this["konradodwrot/go/cruft/get-os-open-files-with"]
}

moved {
  from = gitlab_project.this["konradodwrot/go/cruft/get-term-open-files-with"]
  to   = module.l2.gitlab_project.this["konradodwrot/go/cruft/get-term-open-files-with"]
}

moved {
  from = gitlab_branch_protection.this["konradodwrot/go/cruft/get-term-open-files-with"]
  to   = module.l2.gitlab_branch_protection.this["konradodwrot/go/cruft/get-term-open-files-with"]
}
##[<] 🤖🤖
