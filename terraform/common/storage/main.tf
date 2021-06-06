resource "libvirt_pool" "self" {
  name = var.storage.pool
  type = "dir"
  path = var.storage.directory
}
