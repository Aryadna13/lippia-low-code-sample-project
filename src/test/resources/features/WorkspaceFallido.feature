@Regression @Workspace @WorkspaceFailed @Failed
Feature: Workspace Failed

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url $(env.base_url_clockify)

  @GetWokspacesFallido @BadEndpoint
  Scenario: Falla por mal endpoint
    Given header x-api-key = $(env.x_api_key)
    And base url https://api.clockify.me/api
    And endpoint /v1/
    When execute method GET
    Then the status code should be 404

  @GetWokspacesFallido @BadMethod
  Scenario: metodo errado
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces
    When execute method PATCH
    Then the status code should be 405

  @GetWokspacesFallido @NoApiKey
  Scenario: no apikey
    Given endpoint /v1/workspaces
    When execute method PATCH
    Then the status code should be 401

#-------------------------------------------

  @AddWorkspace @BadEndpoint
  Scenario: Add Workspace
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/
    When execute method POST
    Then the status code should be 404

  @AddWorkspace @BadMethod
  Scenario: metodo errado
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces
    When execute method PUT
    Then the status code should be 405

  @AddWorkspace @NoApiKey
  Scenario: Post un nuevo workspace sin apikey
    Given endpoint /v1/workspaces
    When execute method POST
    Then the status code should be 401

  @AddWorkspace  @EmptyWorkspaceName
  Scenario: Post un nuevo workspace sin nombre
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces
    When execute method POST
    Then the status code should be 400





