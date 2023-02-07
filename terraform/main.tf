terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}
#Configure the Harness provider for Next Gen resources
provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = "6_vVHzo9Qeu9fXvj-AcbCQ"
  platform_api_key = "pat.6_vVHzo9Qeu9fXvj-AcbCQ.63ce3497b4c691598d33502c.J0cwA1KIyTwteoHasvS8"
}
# Automation Anywhere Schedule
resource "harness_platform_triggers" "example" {
  identifier = "identifier"
  org_id     = "SE_Sandbox"
  project_id = "Redman_Sandbox"
  name       = "ron Trigger One"
  target_id  = "Automation_Anywhere_Helmfile_Sync"
  yaml       = <<-EOT
    trigger:
      name: Cron Trigger One
      identifier: "identifier"
      enabled: false
      tags: {}
      orgIdentifier: SE_Sandbox
      projectIdentifier: Redman_Sandbox
      pipelineIdentifier: Automation_Anywhere_Helmfile_Sync
      source:
        type: Scheduled
        spec:
          type: Cron
          spec:
            expression: 0/5 * * * *
      inputYaml: |
        pipeline: {}
    EOT
}
