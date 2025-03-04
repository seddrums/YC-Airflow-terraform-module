# Variables
variable "folder_id" {
  description = "Yandex Cloud Folder ID where the Airflow cluster resides"
  type        = string
  nullable    = true
}

variable "description" {
  description = "Airflow cluster description"
  type        = string
  default     = "Managed Airflow cluster: terraform"
}

variable "name" {
  description = "Airflow cluster name"
  type        = string
  default     = "airflow-cluster"
}

variable "service_account_id" {
  description = "Yandex Cloud SA ID for Airflow"
  type        = string
  nullable    = true
}

variable "subnet_ids" {
  description = "List of network subnets to which the Airflow cluster belongs"
  type        = list(string)
  default     = []
  nullable    = true
}

variable "security_group_ids" {
  description = "List of sg for Airflow cluster"
  type        = list(string)
  default = []
}

variable "bucket_name" {
  description = "Bucket name for DAG-file storage"
  type        = string
  nullable    = true
}

variable "resource_preset_id" {
  description = "Preset for hosts"
  type        = string
  default     = "c1-m4"
}

variable "entity" {
  description = "Airflow entities as webserver, scheduler, worker"
  type = object({
    webserver = object({
      count = number
    })
    scheduler = object({
      count = number
    })
    worker = object({
      min_count = number
      max_count = number
    })
  })

  default = {
    webserver = {
      count = 1
    }
    scheduler = {
      count = 1
    }
    worker = {
      min_count = 1
      max_count = 2
    }
  }
}

variable "airflow_config" {
  description = "Optional Map of Map of String for Airflow configuration"
  type        = map(map(string))
  default     = {}  # Optional by default
}

variable "pip_packages" {
  description = "Optional List of pip packages"
  type        = list(string)
  default     = []
}

variable "deb_packages" {
  description = "Optional List of deb packages"
  type        = list(string)
  default     = []
}

variable "logging" {
  description = "A boolean variable for enable logging"
  type        = bool
  default     = false
}

variable "lockbox_secrets_backend" {
  description = "A boolean variable for enable lockbox secrets backend"
  type        = bool
  default     = false
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