data "google_compute_image" "my_image" {
  name    = "ubuntu-2004-focal-v20210908"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "meson_instance1" {
  count        = "${var.zone1_vm_count}"
  name         = "meson-zone1-${count.index}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone1}"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
      size = "${var.disk_size}"
      type = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata_startup_script = templatefile("${path.module}/files/init_gcp_meson3.sh", {
    meson_token   = var.meson_token,
    meson_size    = var.meson_size
  })
}

resource "google_compute_instance" "meson_instance2" {
  count        = "${var.zone2_vm_count}"
  name         = "meson-zone2-${count.index}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone2}"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
      size = "${var.disk_size}"
      type = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata_startup_script = templatefile("${path.module}/files/init_gcp_meson3.sh", {
    meson_token   = var.meson_token,
    meson_size    = var.meson_size
  })
}

resource "google_compute_instance" "meson_instance3" {
  count        = "${var.zone3_vm_count}"
  name         = "meson-zone3-${count.index}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone3}"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
      size = "${var.disk_size}"
      type = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata_startup_script = templatefile("${path.module}/files/init_gcp_meson3.sh", {
    meson_token   = var.meson_token,
    meson_size    = var.meson_size
  })
}

resource "google_compute_firewall" "default_meson" {
  name    = "default-allow-nkn"
  network = "default"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["19091","443"]
  }
}
