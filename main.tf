resource "hcloud_network" "automation_net" {
  name     = "Automation_NET"
  ip_range = "10.10.0.0/24"
}
resource "hcloud_network_subnet" "create_subnet" {
  network_id   = hcloud_network.automation_net.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.10.0.0/24"
}

resource "hcloud_server" "elastic_master" {
  count       = 3
  name        = "master-vm-${count.index + 1}"
  image       = var.image
  server_type = var.server_type
  location    = var.location
  ssh_keys    = ["${data.hcloud_ssh_key.ssh_key.id}"]
}

resource "hcloud_server_network" "attach_to_network" {
  count       = 3
  server_id   = hcloud_server.elastic_master[count.index].id
  network_id  = hcloud_network.automation_net.id
  ip          = "10.10.0.${110 + count.index + 1}"
}
