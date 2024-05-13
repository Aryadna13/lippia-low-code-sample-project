@Regression @Client @ClientSuccess @Success
Feature: Client success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api
    And call 1-Workspace.feature@GetWokspaces


  @GetFindClients
  Scenario: Find clients on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method GET
    Then the status code should be 200

  @PostAddClients
  Scenario: Add a new client
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 201