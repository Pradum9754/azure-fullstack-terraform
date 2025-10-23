Error: creating Linux Virtual Machine (Subscription: "f"
Resource Group Name: "rg-new"
Virtual Machine Name: "<frontend_vm_new/backend_vm_new>"): performing CreateOrUpdate: unexpected status 404 (404 Not Found) with error: PlatformImageNotFound: The platform image 'Canonical:UbuntuServer:22.04-LTS:latest' is not available. Verify that all fields in the storage profile are correct. For more details about storage profile information, please refer to https://aka.ms/storageprofile
Root Cause:

The specified platform image Canonical:UbuntuServer:22.04-LTS:latest is not available in the selected Azure region or subscription.

This leads to a 404 Not Found error when Terraform attempts to create the VM.

Resolution Steps:

Verify that the image SKU, publisher, offer, and version are correct and supported in the targeted Azure region.

Check if the image version latest is available or try specifying a particular version.

Alternatively, use a different image SKU such as 18.04-LTS which is known to be available.

Confirm that the subscription and resource group are correctly set and have the necessary permissions.

