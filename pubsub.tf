resource "google_pubsub_topic" "api_test" {
  name = "api_test"
}

resource "google_cloud_scheduler_job" "api_test" {
  name        = "api_test"
  description = "api_test"
  schedule    = "0 8 * * *"

  pubsub_target {
    topic_name = google_pubsub_topic.api_test.id
    data       = base64encode("test")
  }
}