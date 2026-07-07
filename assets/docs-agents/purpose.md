# Purpose

## What It Is

GitLab groups and projects as code: Terraform IaC declaring the `konradodwrot` root group tree, nested groups, project settings, descriptions, topics, GitHub tokens, CI plan/apply pipeline.

## Why It Exists

Hand-managed repo and group sprawl drifts. One `tfvars` tree declares every group and project, reviewed and applied like any other code.

## Goals

- Single source of truth for the GitLab group and project tree.
- Reviewable repo lifecycle: plan on MR, apply on main.
- Consistent settings (paths, descriptions, topics) across the tree.

