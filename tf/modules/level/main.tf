##[>] 🤖🤖
resource "gitlab_group" "this" {
  for_each = var.groups

  name             = each.value.name
  path             = each.value.leaf_path
  parent_id        = each.value.parent == null ? null : var.parent_ids[each.value.parent]
  description      = each.value.description
  visibility_level = "public"
}

resource "gitlab_project" "this" {
  for_each = var.projects

  namespace_id     = gitlab_group.this[each.value.group].id
  name             = each.value.name
  path             = each.value.path
  description      = each.value.description
  topics           = each.value.topics
  default_branch   = "main"
  visibility_level = "public"
}

resource "gitlab_branch_protection" "this" {
  for_each = var.projects

  project            = gitlab_project.this[each.key].id
  branch             = "main"
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
  allow_force_push   = each.value.allow_force_push
}
##[<] 🤖🤖
