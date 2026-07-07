##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c
TF ?= terraform

COMMANDS := render-templates run-repo-ci-prepare-hooks run-repo-ci-precommit-all init fmt validate plan apply

.PHONY: $(COMMANDS)

##[>] Docs [genai-include]
#[what] render *.repo.tpl onto the repo (.env, makefile.agents.md, repo-structure.md, CLAUDE.md, AGENTS.md, README.md)
render-templates:
	@che render-templates --repo
##[<] Docs

##[>] CI [genai-include]
#[what] install lefthook git hooks
run-repo-ci-prepare-hooks:
	@lefthook install --force

#[what] run pre-commit hooks over all files (not just staged)
run-repo-ci-precommit-all: run-repo-ci-prepare-hooks
	@lefthook run pre-commit --all-files --force
##[<] CI

##[>] Terraform [genai-include]
#[what] init the backend and providers
init:
	@ci/tf.zsh version

#[what] format all terraform files in place
fmt:
	$(TF) -chdir=tf fmt -recursive

#[what] check formatting and validate the config
validate:
	$(TF) -chdir=tf fmt -check -recursive
	@ci/tf.zsh validate

#[what] show the plan (writes tf/plan.tfplan for CI)
plan:
	@ci/tf.zsh plan -input=false -out=plan.tfplan

#[what] apply the saved plan (plan.tfplan)
apply:
	@ci/tf.zsh apply -input=false plan.tfplan
##[<] Terraform
##[<] 🤖🤖
