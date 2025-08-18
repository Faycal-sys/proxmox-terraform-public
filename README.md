Proxmox VM Automation with Terraform and GitHub Actions
📋 Table of Contents
Proxmox API Token Setup
Getting Started
Detailed Contribution Guide
Troubleshooting
🔑 Proxmox API Token Setup
Step-by-Step Token Creation:
Log in to Proxmox VE
Access your PVE web interface (https://<your-pve-ip>:8006)

Create Dedicated User (Recommended)

pveum user add terraform-ci@pve --password Create API Token

pveum token add terraform-ci@pve terraform-token
--privsep=0
--expire=0
--privileges="VM.Allocate,VM.Clone,VM.Config.Disk,VM.Config.Network"

Note Credentials

PM_API_TOKEN_ID = "terraform-ci@pve!terraform-token" PM_API_TOKEN_SECRET = "xxxx-xxxx-xxxx" 🚀 Getting Started

Clone with SSH
git clone git@github.com:Faycal-sys/proxmox-terraform.git

Initialize Terraform
terraform init -backend-config=envs/dev.backend.hcl https://./docs/terminal-demo.gif (Initialization demo placeholder)

👥 Detailed Contribution Guide Branch Structure Branch Purpose main Production-ready code only dev Integration testing feat/* New features fix/* Bug fixes Commit Convention bash git commit -m "feat: add load balancer module" git commit -m "fix(vm): correct network tag parsing" Prefixes: feat:, fix:, docs:, chore:, refactor:

PR Process Run pre-commit hooks:

pre-commit install pre-commit run --all-files Open PR with:

Terraform plan output

Screenshot of Proxmox resource changes

Affected module documentation

🛠 Troubleshooting Common Errors Error Solution Debug Command 403 Invalid permission Verify token privileges pveum role show TerraformCI Connection timeout Check firewall rules telnet 8006 Cloud-init failed Validate template qm cloudinit dump config Log Collection bash

Enable debug logs
export TF_LOG=DEBUG terraform apply 2> debug.log 📜 License MIT License - See LICENSE for details.

New Files to Create:
Screenshot Placeholders:

mkdir -p docs/ touch docs/{workflow.png,pve-token.png,terminal-demo.gif}

Pre-commit Hook Config (.pre-commit-config.yaml):

yaml repos:

repo: https://github.com/antonbabenko/pre-commit-terraform rev: v1.81.0 hooks:
id: terraform_fmt
id: terraform_tflint Issue Templates (.github/ISSUE_TEMPLATE/bug_report.md):
markdown

Expected Behavior
VMs should deploy with correct network config

Actual Behavior
Getting error 500 QEMU agent not available

Proxmox Logs
journalctl -u pvedaemon --no-pager -n 50
