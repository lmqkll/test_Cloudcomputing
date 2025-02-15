terraform{
    required_providers{
        google={
            source = "hashicorp/google"
            version="~>5.0"
        }
    }
}

provider "google" {
    project="annular-garage-450913-q8"
    region="us-west1"
}

resource "google_compute_instance" "vm_instance"{
    name="student-vm"
    machine_type = "e2-medium"
    zone="europe-west1-b"

 boot_disk{
    initialize_params {   
      image ="debian-cloud/debian-11"
    }
 }

 network_interface {
    network="default"
    access_config {}
 }

}
output "vm_external_ip" { 
    value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}