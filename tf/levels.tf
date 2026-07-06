##[>] 🤖🤖
locals {
  l0_raw = {
    (var.tree.path) = {
      name        = var.tree.name
      leaf_path   = var.tree.path
      path        = var.tree.path
      description = var.tree.description
      parent      = null
      projects    = var.tree.projects
      raw         = var.tree
    }
  }

  l1_raw = merge([
    for pk, pg in local.l0_raw : {
      for ck, cg in var.tree.groups :
      "${pg.path}/${cg.path}" => {
        name        = cg.name
        leaf_path   = cg.path
        path        = "${pg.path}/${cg.path}"
        description = cg.description
        parent      = pg.path
        projects    = try(cg.projects, {})
        raw         = cg
      }
    }
  ]...)

  l2_raw = merge([
    for pk, pg in local.l1_raw : {
      for ck, cg in try(pg.raw.groups, {}) :
      "${pg.path}/${cg.path}" => {
        name        = cg.name
        leaf_path   = cg.path
        path        = "${pg.path}/${cg.path}"
        description = cg.description
        parent      = pg.path
        projects    = try(cg.projects, {})
        raw         = cg
      }
    }
  ]...)

  l3_raw = merge([
    for pk, pg in local.l2_raw : {
      for ck, cg in try(pg.raw.groups, {}) :
      "${pg.path}/${cg.path}" => {
        name        = cg.name
        leaf_path   = cg.path
        path        = "${pg.path}/${cg.path}"
        description = cg.description
        parent      = pg.path
        projects    = try(cg.projects, {})
        raw         = cg
      }
    }
  ]...)

  levels = [
    for lvl in [local.l0_raw, local.l1_raw, local.l2_raw, local.l3_raw] : {
      groups = {
        for k, v in lvl : k => {
          name        = v.name
          leaf_path   = v.leaf_path
          description = v.description
          parent      = v.parent
        }
      }
      projects = merge([
        for gk, g in lvl : {
          for pk, p in g.projects :
          "${g.path}/${p.path}" => {
            name             = p.name
            path             = p.path
            group            = g.path
            description      = p.description
            allow_force_push = try(p.allow_force_push, false)
            topics           = try(p.topics, [])
          }
        }
      ]...)
    }
  ]

  github_repos = merge([
    for lvl in local.levels : {
      for k, p in lvl.projects : p.path => p.description
    }
  ]...)
}

resource "github_repository" "this" {
  for_each = local.github_repos

  name        = each.key
  description = each.value
  visibility  = "public"
}

module "l0" {
  source = "./modules/level"

  groups       = local.levels[0].groups
  projects     = local.levels[0].projects
  github_owner = var.github_owner
  github_token = var.github_token

  depends_on = [github_repository.this]
}

module "l1" {
  source = "./modules/level"

  groups       = local.levels[1].groups
  projects     = local.levels[1].projects
  parent_ids   = module.l0.group_ids
  github_owner = var.github_owner
  github_token = var.github_token

  depends_on = [github_repository.this]
}

module "l2" {
  source = "./modules/level"

  groups       = local.levels[2].groups
  projects     = local.levels[2].projects
  parent_ids   = module.l1.group_ids
  github_owner = var.github_owner
  github_token = var.github_token

  depends_on = [github_repository.this]
}

module "l3" {
  source = "./modules/level"

  groups       = local.levels[3].groups
  projects     = local.levels[3].projects
  parent_ids   = module.l2.group_ids
  github_owner = var.github_owner
  github_token = var.github_token

  depends_on = [github_repository.this]
}
##[<] 🤖🤖
