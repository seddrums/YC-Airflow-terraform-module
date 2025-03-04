module "db" {
  source = "../"
  folder_id = var.folder_id
  service_account_id = var.service_account_id
  admin_password = var.admin_password
  bucket_name    = var.bucket_name
  pip_packages = ["dbt"]
  subnet_ids = var.subnet_ids
}