# Yandex Cloud Managed Airflow Cluster

## Features

- Create a managed Airflow cluster
- Easy to use in other resources via outputs

# Airflow cluster definition

First, you need to create a VPC network with three subnets, bucket for DAG-files, and service account with role "managed-airflow.integrationProvider".

Airflow module requires the following input variables:
  - Folder ID.
  - VPC network subnet IDs.
  - Service Account ID.
  - Bucket Name.
  - Admin Password.
  
### Example

See [examples section](./.examples/)

### How to configure Terraform for Yandex Cloud

- Install [YC CLI](https://cloud.yandex.com/docs/cli/quickstart)
- Add environment variables for terraform auth in Yandex.Cloud

```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | > 3.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | > 0.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | > 3.3 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | > 0.89 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="folder_id"></a> [folder\_id](#input\_folder\_id) | Folder id where Airflow cluster resides. | <pre>string</pre> | no | yes |
| <a name="description"></a> [description](#input\_description) | Airflow cluster description. | <pre>string</pre> | "Managed Airflow cluster: terraform" | no |
|  <a name="name"></a> [name](#input\_name) | Airflow cluster name. | <pre>string</pre> | "airflow-cluster" | no |
|  <a name="service_account_id"></a> [service_account_id](#input\_service\_account\_id) | Yandex Cloud SA ID for Airflow | <pre>string</pre> | no | yes |
|  <a name="security_group_ids"></a> [security_group_ids](#input\_security\group\_ids) | List of sg for Airflow cluster | <pre>list(string)</pre> | [ ] | no |
|  <a name="bucket_name"></a> [bucket_name](#input\_bucket\_name) | Bucket name for DAG-file storage | <pre>string</pre> | no | yes |
|  <a name="resource_preset_id"></a> [resource_preset_id](#input\_resource\_preset\_id) | Preset for entities | <pre>string</pre> | "c1-m4" | no |
|  <a name="entity"></a> [entity](#input\_entity) | Airflow entities as webserver, scheduler, worker | <pre>object()</pre> | {    webserver = {      count = 1    }    scheduler = {      count = 1    }    worker = {      min_count = 1    max_count = 2    }  } | no |
|  <a name="airflow_config"></a> [airflow_config](#input\_airflow\_config) | Optional Map of Map of String for Airflow configuration | <pre>map(map(string))</pre> | { } | no |
|  <a name="pip_packages"></a> [pip_packages](#input\_pip\_packages) | Optional List of pip packages | <pre>list(string)</pre> | [ ] | no |
|  <a name="deb_packages"></a> [pip_packages](#input\_deb\_packages) | Optional List of deb packages | <pre>list(string)</pre> | [ ] | no |
|  <a name="logging"></a> [logging](#input\_logging) | A boolean variable for enable logging | <pre>bool</pre> | false | no |
|  <a name="lockbox_secrets_backend"></a> [lockbox_secrets_backend](#input\_lockbox\_secrets\_backend) | A boolean variable for enable lockbox secrets backend | <pre>bool</pre> | false | no |
|  <a name="admin_password"></a> [admin_password](#input\_admin\_password) |The password for the Airflow with validation | <pre>string</pre> | no | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="airflow_cluster_name"></a> [airflow_cluster_name](#output\_cluster\_name) | Airflow cluster name |
| <a name="airflow_cluster_id"></a> [airflow_cluster_id](#output\_cluster\_id) | Airflow cluster id |
| <a name="airflow_admin_password"></a> [airflow_admin_password](#output\_admin\_pass) | Airflow admin password (sensitive) |
| <a name="airflow_cluster_service_account_id"></a> [airflow_cluster_service_account_id](#output\_cluster\_sa\_id) | Service account ID for the Airflow cluster |
| <a name="airflow_cluster_logging_enabled"></a> [airflow_cluster_logging_enabled](#output\_logging) | Whether logging is enabled for the Airflow cluster |
| <a name="airflow_cluster_min_worker_count"></a> [airflow_cluster_min_worker_count](#output\_min\_worker\_count) | Minimum number of worker nodes in the Airflow cluster |
| <a name="airflow_cluster_max_worker_count"></a> [airflow_cluster_max_worker_count](#output\_max\_worker\_count) | Maximum number of worker nodes in the Airflow cluster |
| <a name="airflow_cluster_s3_bucket"></a> [airflow_cluster_s3_bucket](#output\_s3\_bucket) | S3 bucket used for Airflow code sync |
<!-- END_TF_DOCS -->
