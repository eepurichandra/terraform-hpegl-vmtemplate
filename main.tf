provider "hpegl" {

  vmaas {
    location       = var.location
    space_name     = var.space
  }
}

data "hpegl_vmaas_cloud" "cloud" {
  name = var.cloud
}

data "hpegl_vmaas_cloud_folder" "compute_folder" {
  cloud_id = data.hpegl_vmaas_cloud.cloud.id
  name     = var.compute_folder
}

data "hpegl_vmaas_group" "vmaas_group" {
  name = var.vmaas_group
}

data "hpegl_vmaas_resource_pool" "cl_resource_pool" {
  cloud_id = data.hpegl_vmaas_cloud.cloud.id
  name     = var.cl_resource_pool
}

data "hpegl_vmaas_layout" "vmware" {
  name               = var.vmware_name
  instance_type_code = var.vmware_instance_type_code
}

data "hpegl_vmaas_plan" "vmaas_plan" {
  name = var.vmaas_plan
}

data "hpegl_vmaas_template" "vmaas_template" {
  name = var.vmaas_template
}

data "hpegl_vmaas_environment" "vmaas_environment" {
  name = var.vmaas_environment
}

data "hpegl_vmaas_network" "vmaas_network" {
  name = var.vmaas_network
}

#minimal instance creation
resource "hpegl_vmaas_instance" "tf_instance" {
  name               = var.vmaas_instance_name
  cloud_id           = data.hpegl_vmaas_cloud.cloud.id
  group_id           = data.hpegl_vmaas_group.vmaas_group.id
  layout_id          = data.hpegl_vmaas_layout.vmware.id
  plan_id            = data.hpegl_vmaas_plan.vmaas_plan.id
  instance_type_code = data.hpegl_vmaas_layout.vmware.instance_type_code
   network {
    id = data.hpegl_vmaas_network.vmaas_network.id
  }
  volume {
    name         = "root_vol"
    size         = 5
    datastore_id = "auto"
    root         = true
  }
  labels = ["demo_label"]
  tags = {
    vmType  = "VMAAS"
    vmUsage = "Test"
  }
  config {
    resource_pool_id = data.hpegl_vmaas_resource_pool.cl_resource_pool.id
    no_agent         = true
    template_id      = data.hpegl_vmaas_template.vmaas_template.id
    asset_tag        = "vm_tag"
    folder_code      = data.hpegl_vmaas_cloud_folder.compute_folder.code
  }
  environment_code = data.hpegl_vmaas_environment.vmaas_environment.code
  scale    = 1
}
