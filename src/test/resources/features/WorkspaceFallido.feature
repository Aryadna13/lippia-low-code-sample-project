Feature: Workspace fallido

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url https://api.clockify.me/api


  @GetWokspacesFallido
  Scenario: Falla por mal endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api
    And endpoint /v1/
    When execute method GET
    Then the status code should be 404

  @GetWokspacesFallido
  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces
    When execute method PATCH
    Then the status code should be 405

  @GetWokspacesFallido
  Scenario: no apikey
    Given endpoint /v1/workspaces
    When execute method PATCH
    Then the status code should be 401

#-------------------------------------------

  @AddWorkspaceFallido
  Scenario: mal endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method POST
    Then the status code should be 404

  @AddWorkspaceFallido
  Scenario: Post un nuevo workspace sin apikey
    Given endpoint /v1/workspaces
    When execute method POST
    Then the status code should be 401

  @AddWorkspaceFallido
  Scenario: Post un nuevo workspace sin nombre
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces
    When execute method POST
    Then the status code should be 400

  @AddWorkspaceFallido
  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces
    When execute method PUT
    Then the status code should be 405



