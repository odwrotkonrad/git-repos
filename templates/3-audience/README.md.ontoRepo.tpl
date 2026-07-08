# git-repos

Manages the GitLab groups, projects as code with Terraform

{{ renderMarkdown "assets/docs-agents/purpose.md" "normalize-headings" }}

## Adding a group or project

Edit the `tree` in `tf/terraform.tfvars`, then `make plan && make apply`.

Nesting is capped at 4 levels (`l0`-`l3` in `tf/levels.tf`); add an `l4` module
call to go deeper.

## License

[MIT](LICENSE)
