output "airflow_cluster_name" {
  description = "The name of the Airflow cluster"
  value       = yandex_airflow_cluster.my_airflow_cluster.name
}

output "airflow_cluster_id" {
  description = "The ID of the Airflow cluster"
  value       = yandex_airflow_cluster.my_airflow_cluster.id
}

output "airflow_admin_password" {
  description = "The Airflow admin password"
  value       = yandex_airflow_cluster.my_airflow_cluster.admin_password
  sensitive = true
}

output "airflow_cluster_service_account_id" {
  description = "The service account ID for the Airflow cluster"
  value       = yandex_airflow_cluster.my_airflow_cluster.service_account_id
}

output "airflow_cluster_logging_enabled" {
  description = "Whether logging is enabled for the Airflow cluster"
  value       = yandex_airflow_cluster.my_airflow_cluster.logging.enabled
}

output "airflow_cluster_min_worker_count" {
  description = "The minimum number of worker nodes in the Airflow cluster"
  value       = yandex_airflow_cluster.my_airflow_cluster.worker.min_count
}

output "airflow_cluster_max_worker_count" {
  description = "The maximum number of worker nodes in the Airflow cluster"
  value       = yandex_airflow_cluster.my_airflow_cluster.worker.max_count
}

output "airflow_cluster_s3_bucket" {
  description = "The S3 bucket used for Airflow code sync"
  value       = yandex_airflow_cluster.my_airflow_cluster.code_sync.s3.bucket
}