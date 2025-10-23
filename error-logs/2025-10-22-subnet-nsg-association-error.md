# 🛠️ Terraform Error Log: Subnet + NSG Association

**📅 Date**: 2025-10-22  
**👨‍💻 Engineer**: [Your Name]  
**💻 Environment**: `dev`  
**🌐 Module Affected**: `azurerm_subnet_network_security_group_association`

---

## ❌ Error Summary

Error: Reference to undeclared resource

on ../../modules/azurerm_subnet_network_security_group_association/output.tf line 17, in output "sub_nsga_names":  
│ 17: for k, subnsga in azurerm_subnet_network_security_group_association.subnsga_reusable : k => subnsga.name  
│ This object does not have an attribute named "name".

---

## 🎯 Root Cause

The resource `azurerm_subnet_network_security_group_association` **does not** have a `.name` attribute because it's not a named Azure resource.  
Terraform was trying to access `.name` which doesn't exist, leading to the validation error.

---

## ✅ Solution

- ✔ Removed the `.name` reference from the output.  
- ✔ Replaced it with the **keys** of the map (logical identifiers):

```hcl
output "sub_nsga_names" {
  value = [
    for k in keys(azurerm_subnet_network_security_group_association.subnsga_reusable) : k
  ]
}
➡️ This outputs logical names like sub_nsga_frontend, sub_nsga_backend.

✍️ Notes

This module uses for_each to dynamically associate subnets with NSGs.

Since the resource doesn't support naming in Azure, we use the map keys as identifiers.

This is a good example of:

Terraform logical identifiers vs

Azure physical resource names.

🔗 Related Files

modules/azurerm_subnet_network_security_group_association/output.tf

environments/dev/main.tf

🚀 Status

✅ Fixed

🕒 Time Taken: ~1.5 hours (includes debugging and Terraform validation)

📚 Learnings

Always verify in Terraform Docs whether a resource supports .name, .id, or other attributes before using them in outputs.