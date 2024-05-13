@Regression @Client @ClientFailed @Failed
Feature: Client Failed

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url https://api.clockify.me/api
    And call 1-Workspace.feature@GetWokspaces


  @GetFindClients @BadEndpoint
  Scenario: Find clients on workspace
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1
    When execute method GET
    Then the status code should be 404

  @GetFindClients @BadMethod
  Scenario: Find clients on workspace
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method PUT
    Then the status code should be 405

  @GetFindClients @NoApiKey
  Scenario: Find clients on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method GET
    Then the status code should be 401

    #-----------------------------------------

  @PostAddClients @BadEndpoint
  Scenario: Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 404

  @PostAddClients @BadMethod
  Scenario: Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method PUT
    Then the status code should be 405

  @PostAddClients @NoApiKey
  Scenario: Add a new client
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 401

  @PostAddClients @RepeatedClientName
  Scenario: Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 400

  @PostAddClients @EmptyClientName
  Scenario: Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClientFail.json
    When execute method POST
    Then the status code should be 400

