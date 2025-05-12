# Module: RHEL Bootstrap

Registers RHEL instances with Red Hat Subscription Manager and installs Docker, adhering to operational excellence pillar.

## Usage

```hcl
module "rhel-bootstrap" {
  source              = "./modules/rhel-bootstrap"
  instance_ids        = ["i-0123456789abcdef0"]
  private_ips         = ["10.0.11.12"]
  ssh_private_key_path = "~/.ssh/id_rsa"
  rhsm_username       = var.rhsm_username
  rhsm_password       = var.rhsm_password
}
```
