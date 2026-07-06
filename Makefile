##[>] 🤖🤖
#[what] Project's Makefile
SHELL := zsh
.SHELLFLAGS := -c
TF ?= terraform

COMMANDS := render-templates init fmt validate plan apply

.PHONY: $(COMMANDS)

##[>] Docs [genai-include]
#[what] render *.repo.tpl onto the repo (.env, makefile.agents.md, CLAUDE.md, AGENTS.md)
render-templates:
	@che render-templates --repo
##[<] Docs

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
