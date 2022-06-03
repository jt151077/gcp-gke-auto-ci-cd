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



resource "google_project_iam_member" "clouddeploy_releaser" {
  project = local.project_id
  role    = "roles/clouddeploy.operator"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "act_as" {
  project = local.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${local.project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "compute_sa_logs_writer" {
  project = local.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "compute_sa_storage_admin" {
  project = local.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "compute_sa_artifactregistry_reader" {
  project = local.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "compute_sa_container_clusteradmin" {
  project = local.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${local.project_number}-compute@developer.gserviceaccount.com"
}