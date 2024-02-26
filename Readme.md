# 1. Choose backend option ###

If you want to use the backend remote option of Terraform, the Storage account must exists before launching platform's tenant creation


## 1.1. Backend remote option

### 1.1.1. First export mandatory environment variables

This values can be found on the Azure portal.

```bash
export TF_VAR_tf_resource_group_name="changeme"
export TF_VAR_tf_storage_account_name="changeme"
export TF_VAR_tf_container_name="changeme"
export TF_VAR_tf_blob_name="changeme"
export TF_VAR_tf_access_key="changeme"
```


### 1.1.2. We can now initiate terraform repo with previously created vars
```bash
terraform init \
    -backend-config "resource_group_name=$TF_VAR_tf_resource_group_name" \
    -backend-config "storage_account_name=$TF_VAR_tf_storage_account_name" \
    -backend-config "container_name=$TF_VAR_tf_container_name" \
    -backend-config "key=$TF_VAR_tf_blob_name" \
    -backend-config "access_key=$TF_VAR_tf_access_key"
```


## 1.2. I don't want to use the Terraform backend remote option

Change the backend_remote option in providers (providers.tf) definition file from 'azurerm' to 'local' value:

```tf
backend "local" {
}
```

Add backend_remote to terraform.tfvars file and set it to false:

```tf
backend_remote = false
```

Next, initialize Terraform configuration:

```bash
terraform init
```


# 2. Create resources ###


## 2.1. Add mandatory variables

The module needs at least these values:
```tf
subscription_id = ""
tenant_id       = ""
dns_record      = ""
owner_list      = [""]
project_name    = ""
```

Fill the terraform.tfvars file with your values. For explanations, see [below](#4.).

There is a lot of parameters you can add. For a complete list, see the *variables.tf* config files of the current repository.

## 2.2. Create plan
```bash
terraform plan -out tfplan
```

## 2.3. Apply plan
```bash
terraform apply tfplan
```

## 2.4. Grant authorizations to user / app
- Add users / group in service principal associated to this app registration
- Add permission to the Platform's tenant app registration on herself ('Platform.Admin') and grant admin consent

Enjoy !


# 3. Destroy resources ###


```bash
terraform destroy
```

# 4. What are the mandatory values ? ###


```tf
subscription_id = ""
tenant_id       = ""
dns_record      = ""
owner_list      = [""]
project_name    = "" # The name of your project
```
