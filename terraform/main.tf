
resource "azurerm_resource_group" "rg" {
  name     = "webapp-rg"
  location = "UK West"
}



module "network" {
  source              = "./modules/network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name           = "webappvnet"
  vnet_address_space  = ["10.0.0.0/16"]
  subnet_name         = "internal"
  subnet_prefixes     = ["10.0.2.0/24"]
  public_ip_name      = "webapp_public_ip"
  nic_name            = "webapp_nic"
  nsg_name            = "webapp_nsg"
}


module "vm" {
  source              = "./modules/vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  vm_name             = "webappvm"
  vm_size             = "Standard_DS1_v2"
  nic_id              = module.network.nic_id
  admin_username      = "azureuser"
  ssh_key_bath        = "~/.ssh/id_rsa.pub"
  os_disk_name        = "webapp_os_disk"

}




