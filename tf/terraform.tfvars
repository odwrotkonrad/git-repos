##[>] 🤖🤖
github_owner = "odwrotkonrad"

tree = {
  name        = "konradodwrot"
  path        = "konradodwrot"
  description = "Root group."

  projects = {
    conventions = {
      name        = "conventions"
      path        = "conventions"
      description = "Canonical repo conventions: purpose docs, commenting, Makefile style."
      topics      = ["conventions", "documentation", "standards"]
    }
    configs = {
      name             = "configs"
      path             = "configs"
      allow_force_push = true
      description      = "Dotfiles extended into root OS space, loaded onto the host from one root/ tree by che: symlinked, copied (.host.cp), or rendered (*.host.tpl)."
      topics           = ["dotfiles", "configuration", "macos", "zsh", "che"]
    }
    notes = {
      name        = "notes"
      path        = "notes"
      description = "Shared space for user-agent cross-session collaboration: versioned markdown notes carrying context, decisions, plans, open threads across sessions and repos."
      visibility  = "public"
      topics      = ["notes", "collaboration", "agents"]
    }
    workspace = {
      name        = "workspace"
      path        = "workspace"
      description = "Clones the konradodwrot group into $WORKSPACE_DIR and generates a recursive per-subgroup repo index (each subgroup's direct repos with purpose, child subgroups linked) as generated AGENTS.md/CLAUDE.md."
      topics      = ["workspace", "codegen", "documentation", "gitlab", "che"]
    }
  }

  groups = {
    go = {
      name        = "go"
      path        = "go"
      description = "Go projects."

      projects = {
        che = {
          name        = "che"
          path        = "che"
          description = "Spec-driven dotfile loader: detects OS+arch+virt, resolves a profile from che.yml, then loads only that profile's files, dirs, installs, and services. Renders *.host.tpl onto the host and *.repo.tpl onto the repo, resolving op:// (1Password) secret refs at render time."
          topics      = ["go", "cli", "dotfiles", "configuration", "1password"]
        }
        render_files = {
          name        = "render-files"
          path        = "render-files"
          description = "CLIs that generate repo documentation (Makefile docs, directory trees)."
          topics      = ["go", "cli", "documentation", "codegen", "makefile"]
        }
      }

      groups = {
        cruft = {
          name        = "cruft"
          path        = "cruft"
          description = "Small Go throwaways."

          projects = {
            get_os_open_files_with = {
              name        = "get-os-open-files-with"
              path        = "get-os-open-files-with"
              description = "CLI printing '<bundle> <uti> <role>' file-handler association lines from os-open-files-with.yml (system + user, deep-merged), in config order. Feeds duti on macOS."
              topics      = ["go", "cli", "macos", "duti", "file-associations"]
            }
            get_term_open_files_with = {
              name        = "get-term-open-files-with"
              path        = "get-term-open-files-with"
              description = "CLI printing '<ext>=<opener>' zsh suffix-alias lines from term-open-files-with.yml (system + user, deep-merged), expanded against cached GitHub-linguist data. Targets any|vscode|kitty."
              topics      = ["go", "cli", "zsh", "terminal", "linguist"]
            }
          }
        }
      }
    }

    infra = {
      name        = "infra"
      path        = "infra"
      description = "Infrastructure as code."

      projects = {
        git_repos = {
          name        = "git-repos"
          path        = "git-repos"
          description = "Manages the GitLab groups, projects as code with Terraform"
          topics      = ["terraform", "infrastructure", "gitlab", "iac"]
        }
        ci_images = {
          name        = "ci-images"
          path        = "ci-images"
          description = "Shared CI container images: linux base bundling go, che, render-tpl, lefthook, yq, zig, goreleaser, terraform, glab."
          topics      = ["ci", "docker", "container", "gitlab", "toolchain"]
        }
      }
    }
  }
}
##[<] 🤖🤖
