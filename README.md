# terraform-gke-scripts
Mucking around with terraform scripts to orchestrate different components on GCP, namely an application workload running across a cluster backed by several GKE nodepools. Eventually I'll add an AlloyDB database, external routing, build & deployment automation and some monitoring.

I gave ChatGPT the challenge to give me an interactive / modular learning exercise to get more hands on familiar with both terraform, gcp networking and the details of GKE cluster setup. I also want to see how a mixed GKE cluster with preemptible and non-preemptible nodes works out as a curiousity.

** Dependencies

Google Cloud account obviously with the appropriate IAM permissions to create projects and resources (I use a personal account), gcloud cli for auth login etc.
I'm running this on a basic setup:
* homebrew 
* terraform v1.5.7 on darwin_arm64
* provider `registry.terraform.io/hashicorp/google v5.29.1`

** Usage

Update variables in root level `variables.tf` file, execute `terraform init` and then
```
terraform (plan|apply) var="billing_account=[[billing-account-id]]" -var="project_id=[[your chosen project-id]]"
```

** Cleanup 

`terraform destroy` will uninstall all deployed artifacts *including the GCP project*.
