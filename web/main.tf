# This sets the domain we're building the servers for.
variable "domain" {
    default = "boochtek.com"
}

# This sets the base image. We pretty much assume a Debian-based Linux server, but could probably use a version of Ubuntu.
# List available images with `curl -X GET -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/images?type=distribution" | jq '{distribution: .images[].distribution, name: .images[].name, slug: .images[].slug}'``.
variable "base_image" {
    default = "debian-8-x64"
}

# This sets a list of SSH keys that the server will be built with, giving them root SSH access.
# These must be set in Digital Ocean, then referenced here by ID or fingerprint.
# Unfortunately, we can't use the names that we defined in Digital Ocean for the SSH keys. :(
# List available SSH keys with `curl -X GET -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/account/keys" | jq`.
variable "ssh_keys" {
  default = "249442,1582093" # ["booch@hope", "booch@colbert"]
}


provider "digitalocean" {
}

provider "dnsimple" {
}


resource "digitalocean_droplet" "main" {
    name = "ocean1"
    size = "1gb"
    image = "${var.base_image}"
    region = "nyc3"
    backups = true
    ipv6 = false
    private_networking = true
    ssh_keys = [ "${split(",",var.ssh_keys)}" ]

    connection {
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    # We do this as a work-around to ensure the box is up and SSH is up. See https://github.com/hashicorp/terraform/issues/2811.
    provisioner "remote-exec" {
      inline = ":"
    }

    provisioner "local-exec" {
      command = "ANSIBLE_SSH_ARGS='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null' ansible-playbook -u root --skip-tags 'remove_root_access' -i '${self.ipv4_address},' web/main.yml"
    }

    provisioner "remote-exec" {
      inline = [
          # Don't allow SSH access directly to root.
          "rm /root/.ssh/authorized_keys",
      ]
    }

}


resource "dnsimple_record" "main" {
    domain = "${var.domain}"
    name = "${digitalocean_droplet.main.name}"
    value = "${digitalocean_droplet.main.ipv4_address}"
    type = "A"
    ttl = 600
}
