variable "location" {
  type        = string # Should be set as Environment varaible. TF_VAR_location
  description = "Location of GL VMaaS Service"
}

variable "space" {
  type        = string # Should be set as Environment varaible. TF_VAR_space
  description = "IAM Space name of the GL VMaaS Service"
}

variable "vmaas_instance_name" {
  type        = string
  description = "Name of the instance to be provisioned."
  default     = "DEMO_TF_Instance"
}

variable "cloud" {
  type        = string
  description = "Name of the cloud as it appears on GLPC Portal. If there is no cloud with this name, a 'NOT FOUND' error will returned."
  default     = "HPE GreenLake VMaaS Cloud"
}

variable "compute_folder" {
  type        = string
  description = "Name of the cloud folder as it appears on GLPC Portal. If there is no cloud folder with this name, a 'NOT FOUND' error will returned."
  default     = "ComputeFolder"
}

variable "vmaas_group" {
  type        = string
  description = "Name of the group as it appears on GLPC Portal. If there is no group with this name, a 'NOT FOUND' error will returned."
  default     = "Default"
}

variable "cl_resource_pool" {
  type        = string
  description = "Name of the Resource pool of a cluster as it appears on GLPC Portal. If there is no Resource pool with this name, a 'NOT FOUND' error will returned."
  default     = "ComputeResourcePool"
}

variable "vmware_name" {
  type        = string
  description = "Name of the layout as it appears on GLPC Portal. If there is no layout with this name, a 'NOT FOUND' error will returned."
  default     = "Vmware VM"
}

variable "vmware_instance_type_code" {
  type        = string
  description = "Unique code used to identify the instance type. instance_type_code can be used in resource hpegl_vmaas_instance"
  default     = "vmware"
}

variable "vmaas_plan" {
  type        = string
  description = "Name of the Plan as it appears on GLPC Portal. If there is no Plan with this name, a 'NOT FOUND' error will returned."
  default     = "G1-Small"
}

variable "vmaas_template" {
  type        = string
  description = "Name of the Template as it appears on GLPC Portal. If there is no Template with this name, a 'NOT FOUND' error will returned."
  default     = "vanilla-centos7-x86_64-09072020"
}

variable "vmaas_environment" {
  type        = string
  description = "Name of the Environment as it appears on GLPC Portal. If there is no Environment with this name, a 'NOT FOUND' error will returned."
  default     = "Staging"
}

variable "vmaas_network" {
  type        = string
  description = "Name of the network as it appears on GLPC Portal. If there is no network with this name, a 'NOT FOUND' error will returned."
  default     = "DHCP_Network"
}
