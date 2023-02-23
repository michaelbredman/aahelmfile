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
resource "harness_platform_triggers" "aa_schedule" {
  identifier = "Cron_Trigger_Example"
  org_id     = "SE_Sandbox"
  project_id = "Redman_Sandbox"
  name       = "Automation Anywhere Helmfile Sync"
  target_id  = "Automation_Anywhere_Helmfile_Sync"
  yaml       = <<-EOT
    trigger:
      name: "Cron Trigger Example"
      identifier: Cron_Trigger_Example
      orgIdentifier: SE_Sandbox
      projectIdentifier: Redman_Sandbox
      pipelineIdentifier: Automation_Anywhere_Helmfile_Sync
      description: Testing the creation of a Terrafor Trigger
      enabled: true
      source:
        type: Scheduled
        spec:
          type: Cron
          spec:
            expression: "05 00 27 1 *"
      inputYaml: |
        pipeline:
          identifier: Automation_Anywhere_Helmfile_Sync
          properties:
            ci:
              codebase:
                build:
                  type: branch
                  spec:
                    branch: main                  
    EOT
}
# Automation Anywhere Schedule 2
resource "harness_platform_triggers" "aa_schedule_one" {
  identifier = "Cron_Trigger_Example_One"
  org_id     = "SE_Sandbox"
  project_id = "Redman_Sandbox"
  name       = "Automation Anywhere Helmfile Sync"
  target_id  = "Automation_Anywhere_Helmfile_Sync"
  yaml       = <<-EOT
    trigger:
      name: "Cron Trigger Example One"
      identifier: Cron_Trigger_Example_One
      orgIdentifier: SE_Sandbox
      projectIdentifier: Redman_Sandbox
      pipelineIdentifier: Automation_Anywhere_Helmfile_Sync
      description: Testing the creation of a Terrafor Trigger
      enabled: true
      source:
        type: Scheduled
        spec:
          type: Cron
          spec:
            expression: "06 00 27 1 *"
      inputYaml: |
        pipeline:
          identifier: Automation_Anywhere_Helmfile_Sync
          properties:
            ci:
              codebase:
                build:
                  type: branch
                  spec:
                    branch: main
    EOT
}