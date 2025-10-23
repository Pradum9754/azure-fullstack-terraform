variable "nic" {
  type = map(object({
    nic_name                      = string
    location                      = string
    resource_group_name           = string
    tags                         = optional(map(string))
    name                         = string
    subnet_id                    = string
    private_ip_address_allocation = string
    public_ip_address_id          = optional(string)
  }))
}
