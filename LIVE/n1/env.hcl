locals {
  shutdown = false

  env = "n1"

  network = {
    name    = local.env
    domain  = "ubuntu.lh"
    macaddr = "52:54:02:00:50:%02x"
    subnet  = "10.2.50.0/24"
  }

  storage = {
    pool      = "vm_pool_${local.env}"
    directory = "/stor/libvirt/vm_pool_${local.env}"
  }

  nodes1 = {
    count   = 1
    prefix  = "${local.env}a"
    offset  = 10
    vcpu    = 2
    memory  = "2048"
    image   = "${get_parent_terragrunt_dir()}/../../packer/nebula/.cache/output/packer-nebula.qcow2"
    storage = "94489280512"  # 88GiB
    keys    = file("~/.ssh/id_rsa.pub")
    mounts = [{
      target = "datastores"
      source = "/stor/9p/${local.env}/_var_lib_one_datastores/"
      path   = "/var/lib/one/datastores/"
      ro     = false
    },{
      target = "fireedge"
      source = "/stor/9p/${local.env}/_var_lib_one_fireedge/"
      path   = "/var/lib/one/fireedge/"
      ro     = false
    }]
  }

  nodes2 = {
    count   = 2
    prefix  = "${local.env}b"
    offset  = 20
    vcpu    = 4
    memory  = "8192"
    image   = "${get_parent_terragrunt_dir()}/../../packer/nebula/.cache/output/packer-nebula.qcow2"
    storage = "94489280512"  # 88GiB
    keys    = file("~/.ssh/id_rsa.pub")
    mounts = [{
      target = "datastores"
      source = "/stor/9p/${local.env}/_var_lib_one_datastores/"
      path   = "/var/lib/one/datastores/"
      ro     = false
    }]
  }
}
