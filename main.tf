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

    versioning {
        enabled=true
    }

    labels = {
        environment = "student-lab"
        managed_by= "terraform"
    }
}


resource  "google_storage_bucket_iam_binding""example_binding"{
    bucket = google_storage_bucket.mybucket.name
    role ="roles/storage.objectUser"

    members= [
    "user:xuantuan0406@gmail.com"
    ]
}

output "bucket_name" { 
    value = google_storage_bucket.mybucket.name
}