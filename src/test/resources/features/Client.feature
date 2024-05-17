@Regression @Client @ClientSuccess @Success
Feature: Client success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = $(env.x_api_key)
    And base url $(env.base_url_clockify)
    And call Workspace.feature@GetWokspaces


  @GetFindClients
  Scenario: Find clients on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method GET
    Then the status code should be 200

  @PostAddClients
  Scenario: Add a new client
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    And body jsons/bodies/Client/AddClient.json
    When execute method POST
    Then the status code should be 201