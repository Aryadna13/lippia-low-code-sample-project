@Regression @Workspace @WorkspaceSuccess @Success
Feature: Workspace success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api


  @AddWorkspace
  Scenario: Add Workspace
    Given endpoint /v1/workspaces
    And body Workspace/bodyWorkspace.json
    When execute method POST
    Then the status code should be 201

  @GetWokspaces
  Scenario: Get all my Workspaces
    Given endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define workspaceId = $.[0].id

