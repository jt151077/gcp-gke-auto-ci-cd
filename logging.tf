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

resource "google_logging_project_sink" "vpc_flow_logs" {
  name                   = "vpc_flow_logs"
  project                = local.project_id
  destination            = "bigquery.googleapis.com/projects/jeremy-xxh5u54r/datasets/vpc_flow_logs"
  disabled               = false
  unique_writer_identity = true

  filter = <<-EOT
            resource.type="gce_subnetwork"
            logName="projects/jeremy-xxh5u54r/logs/compute.googleapis.com%2Fvpc_flows"
        EOT
  bigquery_options {
    use_partitioned_tables = true
  }
}