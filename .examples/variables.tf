variable "folder_id" {
  description = "Yandex Cloud Folder ID where the Airflow cluster resides"
  type        = string
  nullable    = true
}

variable "service_account_id" {
  description = "Yandex Cloud SA ID for Airflow"
  type        = string
  nullable    = true
}

variable "admin_password" {
  description = "The password for the Airflow"
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.admin_password) >= 8
    error_message = "Password must be at least 8 characters long."
  }
}

variable "bucket_name" {
  description = "Bucket name for DAG-file storage"
  type        = string
  nullable    = true
}

variable "subnet_ids" {
  description = "List of network subnets to which the Airflow cluster belongs"
  type        = list(string)
  default     = []
  nullable    = true
}