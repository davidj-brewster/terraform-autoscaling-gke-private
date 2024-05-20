# terraform-gke-scripts
Mucking around with terraform scripts to orchestrate different components on GCP, namely an application workload running across a cluster backed by several GKE nodepools. Eventually I'll add an AlloyDB database, external routing, build & deployment automation and some monitoring.

I gave ChatGPT the challenge to give me an interactive / modular learning exercise to get more hands on familiar with both terraform, gcp networking and the details of GKE cluster setup. I also want to see how a mixed GKE cluster with preemptible and non-preemptible nodes works out as a curiousity.

Some special things about this setup 
- Fully managed by Terraform apply/destroy
- Uses only private networking including for GKE and control plane nodes and quite restrictive firewall rules in my default setup for security reasons - you would set up an external load balancer if you wanted to expose an application externally
- Pretty quick to take up and down depending on the GCP region and when you do it
- Uses a combination of the smallest GCE nodes as workers but with a pretty flexible scaling policy for the 2 preemptible node pools.
- Is flexible enough to setup a much larger setup in any hybrid preemptible/spot/dedicated/CUD node permutations but also small enough that you can play around with a larger "cluster" without it costing too much at all.
  
** Dependencies

Google Cloud account obviously with the appropriate IAM permissions to create projects and resources (I use a personal account), gcloud cli for auth login etc.
I'm running this on a basic setup:
* homebrew 
* terraform v1.5.7 on darwin_arm64
* connect "locally" with kubectl via cloud shell, or using gke-gcloud-auth-plugin
* provider `registry.terraform.io/hashicorp/google v5.29.1` is the only terraform dependency

** Usage

Authenticate as normal with the gcloud client i.e., gcloud auth login.

Verify/update "default" variables within the root level `variables.tf` file, execute `terraform init` and then run:
```
terraform (plan|apply) -var="billing_account=[[billing-account-id]]" -var="project_id=[[your chosen project-id]]"
```
This will create the GCP project as well as all of all of the modules.


** Cleanup 

`terraform destroy` will uninstall all deployed artifacts *including the GCP project*. If you do accidentally delete a project you can usually recover it for a while on GCP through the console.
