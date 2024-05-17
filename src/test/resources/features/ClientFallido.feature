@Regression @Client @ClientFailed @Failed
Feature: Client Failed

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url $(env.base_url_clockify)
    And call Workspace.feature@GetWokspaces


  @GetFindClients @BadEndpoint
  Scenario: Find clients on workspace
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1
    When execute method GET
    Then the status code should be 404

  @GetFindClients @BadMethod
  Scenario: Find clients on workspace
    Given header x-api-key = $(env.x_api_key)
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
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/
    And body jsons/bodies/Client/AddClient.json
    When execute method POST
    Then the status code should be 404

  @PostAddClients @BadMethod
  Scenario: Add a new client
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body jsons/bodies/Client/AddClient.json
    When execute method PUT
    Then the status code should be 405

  @PostAddClients @NoApiKey
  Scenario: Add a new client
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    And body jsons/bodies/Client/AddClient.json
    When execute method POST
    Then the status code should be 401

  @PostAddClients @RepeatedClientName
  Scenario: Add a new client
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body jsons/bodies/Client/AddClient.json
    When execute method POST
    Then the status code should be 400

  @PostAddClients @EmptyClientName
  Scenario: Add a new client
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body jsons/bodies/Client/AddClientFail.json
    When execute method POST
    Then the status code should be 400

