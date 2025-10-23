variable "subnsga" {
  type = map(object({
    subnet_id                 = string
    network_security_group_id = string
  }))
}




# sub_nsga = {
#   sub_nsga_frontend = {
#     subnet_id                 = module.sub_reusable.subnet_ids["sub_frontend"]        
#     network_security_group_id = module.nsg_reusable.nsg_ids["nsg_frontend"]
#   },
#     sub_nsga_backend = {
#     subnet_id                 = module.sub_reusable.subnet_ids["sub_backend"]
#     network_security_group_id = module.nsg_reusable.nsg_ids["nsg_backend"]
#   }
# }

# ^
# module.sub_reusable.subnet_ids["sub_frontend"] ka matlab kya hai?

# module.sub_reusable:
# Yeh tera ek Terraform module hai, jo tu apne code me use kar raha hai.
# Jaise tu module "sub_reusable" define karta hai, to uske andar ke output values bhi mil sakti hain.

# subnet_ids:
# Yeh us module ke andar define kiya hua output hai, jo shayad ek map (dictionary) hai.
# Map ke andar keys hote hain, jese "sub_frontend", "sub_backend" etc.

# ["sub_frontend"]:
# Yeh us map ka ek key hai, jiska matlab hai ki tu "sub_frontend" ka value nikal raha hai, jo subnet ka ID (string) ho sakta hai.