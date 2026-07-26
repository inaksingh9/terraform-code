variable "rgs" {}
variable "pip" {}
variable "nics" {}
variable "storageaccount" {}
variable "nsg" {}
variable "subnets" {}
variable "vms" {}
variable "vnets" {}
variable "bastions" {}
variable "lbs" {}
variable "appgws" {
  default = {}
}
variable "frontdoors" {
  default = {}
}