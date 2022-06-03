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


resource "google_container_cluster" "autopilot_cluster" {
  depends_on = [
    google_compute_network.custom_vpc
  ]

  name       = "gke-cluster"
  location   = local.project_default_region
  project    = local.project_id
  network    = google_compute_network.custom_vpc.id
  subnetwork = google_compute_subnetwork.custom-subnet.id

  # Documentation: https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview
  enable_autopilot = true

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/17"
    services_ipv4_cidr_block = "/22"
  }

  release_channel {
    channel = "REGULAR"
  }
}

resource "google_artifact_registry_repository" "repo" {
  provider      = google-beta
  project       = local.project_id
  location      = local.project_default_region
  repository_id = "html-nginx"
  description   = "Docker repository"
  format        = "DOCKER"
}
