resource "aws_ssm_document" "my_cool_run_document" {
  name          = "UpdateTerraformBinary"
  document_type = "Command"

  content = <<DOC
  {
    "schemaVersion": "1.2",
    "description": "Update the Terraform binary to the latest version.",
    "parameters": {},
    "runtimeConfig": {
      "aws:runShellScript": {
        "properties": [
          {
            "id": "0.aws:runShellScript",
            "runCommand": ["/root/bin/terraform-update.sh"]
          }
        ]
      }
    }
  }
DOC
}
