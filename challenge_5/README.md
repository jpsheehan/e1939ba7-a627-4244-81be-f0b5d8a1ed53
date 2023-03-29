# Challenge 5

## Specification

Design/Implement a Terraform plan that would deploy the solution you have described above.

## Solution

For simplicity, let's say that we'll go with the "AWS-RunShellScript" run document.
We'll also assume that the script exists on the machine(s) at `/root/bin/terraform-update.sh`.

The [main.tf](./main.tf) Terraform file can be used to create a run command that will execute the script.
Then running the script across one or more machines is as easy as running this new "UpdateTerraformBinary" Run Document from the web console.
