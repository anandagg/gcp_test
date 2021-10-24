
resource "google_storage_bucket" "tf_state" {
  name          = "gcp-test-aa-tf-state"
  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true
}


resource "google_storage_bucket" "gcp_test" {
  name          = "gcp-test-aa"
  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "gcp_test_archive" {
  name          = "gcp-test-aa-archive"
  location      = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true
}

