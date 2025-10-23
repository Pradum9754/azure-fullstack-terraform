variable "rg" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "vnet" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
  }))
}

variable "sub" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))

    security_rule = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

# variable "subnsga" {
#   type = map(object({
#     subnet_id                 = string
#     network_security_group_id = string
#   }))
# }

variable "pip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
    tags                = optional(map(string))
  }))
}

variable "nic" {
  type = map(object({
    nic_name                      = string
    location                      = string
    resource_group_name           = string
    tags                          = optional(map(string))
    name                          = string
    subnet_id                     = optional(string) # Make optional, because in tfvars it is not set
    private_ip_address_allocation = string
    public_ip_address_id          = optional(string)
  }))
}

variable "vm" {
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    size                  = string
    admin_username        = string
    caching               = string
    storage_account_type  = string
    publisher             = string
    offer                 = string
    sku                   = string
    version               = string
    network_interface_ids = optional(list(string)) # <-- depend on project
    public_key            = optional(string)       # <-- depend on project
    tags                  = map(string)
  }))
}


