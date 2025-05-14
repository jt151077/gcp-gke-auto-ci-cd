/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


# default CloudBuild service account permissions
resource "google_project_iam_member" "clouddeploy_releaser" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/clouddeploy.operator"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "act_as" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}


resource "google_project_iam_member" "cloudbuild_artifactregistry_reader" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_containeranalysis_viewer" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/containeranalysis.occurrences.viewer"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_serviceusage_viewer" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/serviceusage.serviceUsageViewer"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_container_developer" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}


#custom GKE service account
resource "google_service_account" "gke_custom_sa" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project      = local.project_id
  account_id   = "gke-custom-sa"
  display_name = "Service Account for GKE"
}


#permissions for Deploy service account
resource "google_project_iam_member" "compute_logs_writer" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "compute_storage_admin" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}


resource "google_project_iam_member" "clouddeploy_developer" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/clouddeploy.jobRunner"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "container_admin" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}


resource "google_project_iam_member" "compute_artifactregistry_reader" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}


resource "google_project_iam_member" "node_service_account" {
  depends_on = [
    google_project_service.gcp_services
  ]

  project = local.project_id
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}
