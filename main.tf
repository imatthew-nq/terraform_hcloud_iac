# Create a server
resource "hcloud_server" "ubuntu-1" {
  name        = "trf-ubuntu-1"
  image       = var.image
  server_type = var.server_type
  location    = var.location
  ssh_keys    = ["${data.hcloud_ssh_key.ssh_key.id}"]
}

resource "hcloud_server" "trf-ubuntu-2" {
  name        = "trf-test-z"
  image       = "ubuntu-22.04"
  server_type = var.server_type
}

resource "hcloud_server" "ubuntu-2gb-1" {
  name        = "trf-new-added"
  image       = var.image
  server_type = var.server_type
}
