resource "google_storage_bucket_object" "archive" {
  name   = "api1/index.zip"
  bucket = google_storage_bucket.gcp_test_archive.name
  source = "./src/api1/index.zip"
}


resource "google_cloudfunctions_function" "function" {
  name        = "gcp-test1"
  description = "GCP test function"
  runtime     = "python37"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.gcp_test_archive.name
  source_archive_object = google_storage_bucket_object.archive.name
  entry_point           = "get_api"

  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource   = google_pubsub_topic.api_test.name
  }
}


resource "google_storage_bucket_object" "archive2" {
  name   = "api2/index.zip"
  bucket = google_storage_bucket.gcp_test_archive.name
  source = "./src/api2/index.zip"
}

resource "google_cloudfunctions_function" "function2" {
  name        = "gcp-test2"
  description = "GCP test function"
  runtime     = "python37"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.gcp_test_archive.name
  source_archive_object = google_storage_bucket_object.archive2.name
  entry_point           = "get_api"

  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource   = google_pubsub_topic.api_test.name
  }
}


resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "user:anandagga@gmail.com"
}