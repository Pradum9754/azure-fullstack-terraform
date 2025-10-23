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
    network_interface_ids = optional(list(string))  
    public_key            = optional(string)        
    tags                  = map(string)
  }))
}
