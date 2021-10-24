resource "google_bigquery_dataset" "gcp_test" {
  dataset_id                  = "gcp_test"
  friendly_name               = "gcp_test"
  description                 = "Dataset for GCP test"
  location                    = "EUROPE-WEST2"
  default_table_expiration_ms = 3600000
}


resource "google_bigquery_table" "table1" {
  dataset_id = google_bigquery_dataset.gcp_test.dataset_id
  table_id   = "api_table1"

  external_data_configuration {
    autodetect    = true
    source_format = "NEWLINE_DELIMITED_JSON"

    source_uris = [
      "https://storage.cloud.google.com/gcp-test-aa/api1/api1.json",
    ]
  }
}

resource "google_bigquery_table" "table2" {
  dataset_id = google_bigquery_dataset.gcp_test.dataset_id
  table_id   = "api_table2"

  external_data_configuration {
    autodetect    = true
    source_format = "NEWLINE_DELIMITED_JSON"

    source_uris = [
      "https://storage.cloud.google.com/gcp-test-aa/api2/api2.json",
    ]
  }
}