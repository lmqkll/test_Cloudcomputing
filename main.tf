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

resource "google_storage_bucket" "mybucket"{
    name="my-terraform-bucket-lmq645547966785"
    location="us-west1"
}

output "bucket_name" { 
    value = google_storage_bucket.mybucket.name
}