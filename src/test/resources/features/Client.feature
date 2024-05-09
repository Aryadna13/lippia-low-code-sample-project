@Regresion @Client
Feature: Projects

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api


  @GetFindClients
  Scenario: Get mis clientess
    Given call Workspace.feature@GetWokspacesExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method GET
    Then the status code should be 200


  @PostAddClients
  Scenario: Get mis clientes
    Given call Workspace.feature@GetWokspacesExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 201