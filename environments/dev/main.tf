module "rg_reusable" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.rg
}

module "vnet_reusable" {
  depends_on = [module.rg_reusable]
  source     = "../../modules/azurerm_virtual_network"
  vnet       = var.vnet
}

module "sub_reusable" {
  depends_on = [module.vnet_reusable]
  source     = "../../modules/azurerm_subnets"
  sub        = var.sub
}

module "nsg_reusable" {
  depends_on = [module.sub_reusable]
  source     = "../../modules/azurerm_network_security_group"
  nsg        = var.nsg
}

# this will create only in main.tf, module
module "subnsga_reusable" {
  depends_on = [module.sub_reusable, module.nsg_reusable]
  source     = "../../modules/azurerm_subnet_network_security_group_association"

  subnsga = {
    sub_nsga_frontend = {
      subnet_id                 = module.sub_reusable.sub_ids["sub_frontend"]
      network_security_group_id = module.nsg_reusable.nsg_ids["nsg_frontend"]
    },
    sub_nsga_backend = {
      subnet_id                 = module.sub_reusable.sub_ids["sub_backend"]
      network_security_group_id = module.nsg_reusable.nsg_ids["nsg_backend"]
    }
  }
}

module "pip_reusable" {
  depends_on = [module.rg_reusable]
  source     = "../../modules/azurerm_public_ip"
  pip        = var.pip
}

# module "nic_reusable" {
#   depends_on = [module.rg_reusable, module.sub_reusable, module.pip_reusable]
#   source     = "../../modules/azurerm_network_interface"
#   nic        = var.nic
# }

locals {
  nic = {
    frontend_nic = merge(
      var.nic["frontend_nic"],
      {
        subnet_id            = module.sub_reusable.sub_ids["sub_frontend"]
        public_ip_address_id = module.pip_reusable.pip_ids["frontend_pip"]
      }
    )
    backend_nic = merge(
      var.nic["backend_nic"],
      {
        subnet_id            = module.sub_reusable.sub_ids["sub_backend"]
        public_ip_address_id = module.pip_reusable.pip_ids["backend_pip"]
      }
    )
  }
}
module "nic_reusable" {
  depends_on = [module.rg_reusable, module.sub_reusable, module.pip_reusable]
  source     = "../../modules/azurerm_network_interface"
  nic        = local.nic
}

# module "vm_reusable" {
#   source = "../../modules/azurerm_linux_virtual_machine"
#   vm     = var.vm
# }

locals {
  vm = {
    frontend_vm = merge(
      var.vm["frontend_vm"],
      {
        network_interface_ids = [module.nic_reusable.nic_ids["frontend_nic"]]
        public_key            = file("~/.ssh/id_rsa.pub")
      }
    )

    backend_vm = merge(
      var.vm["backend_vm"],
      {
        network_interface_ids = [module.nic_reusable.nic_ids["backend_nic"]]
        public_key            = file("~/.ssh/id_rsa.pub")
      }
    )
  }
}
module "vm_reusable" {
  depends_on = [module.nic_reusable]
  source     = "../../modules/azurerm_linux_virtual_machine"
  vm         = local.vm
}
