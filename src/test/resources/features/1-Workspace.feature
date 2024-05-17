@Regression @Workspace @WorkspaceSuccess @Success
Feature: Workspace success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = $(env.x_api_key)
    And base url $(env.base_url_clockify)

  @GetWokspaces
  Scenario: Get all my Workspaces
    Given endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define workspaceId = $.[1].id
