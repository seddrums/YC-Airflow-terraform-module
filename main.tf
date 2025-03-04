data "yandex_client_config" "client" {}

resource "yandex_airflow_cluster" "my_airflow_cluster" {
  folder_id          = var.folder_id
  name               = var.name
  subnet_ids         = var.subnet_ids
  description        = var.description
  service_account_id = var.service_account_id
  admin_password     = var.admin_password
  security_group_ids = var.security_group_ids

  code_sync = {
    s3 = {
      bucket = var.bucket_name
    }
  }

  webserver = {
    count              = var.entity.webserver.count
    resource_preset_id = var.resource_preset_id
  }

  scheduler = {
    count              = var.entity.scheduler.count
    resource_preset_id = var.resource_preset_id
  }

  worker = {
    min_count          = var.entity.worker.min_count
    max_count          = var.entity.worker.max_count
    resource_preset_id = var.resource_preset_id
  }

  airflow_config = var.airflow_config

  pip_packages = var.pip_packages

  deb_packages = var.deb_packages

  lockbox_secrets_backend = {
    enabled = false
  }

  logging = {
    enabled   = var.logging
    folder_id = var.folder_id
    min_level = "INFO"
  }
}