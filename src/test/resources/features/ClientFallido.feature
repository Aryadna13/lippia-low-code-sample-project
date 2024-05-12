@Regresion @Client @Fail
Feature: Client

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url https://api.clockify.me/api
    And call Workspace.feature@GetWokspacesExitoso

  @GetFindClients
  Scenario: error de endpoint Find clients on workspace
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And call Workspace.feature@GetWokspacesExitoso
    And endpoint /v1
    When execute method GET
    Then the status code should be 404

  Scenario:metodo errado Find clients on workspace
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method PUT
    Then the status code should be 405

  Scenario:sin api key Find clients on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method GET
    Then the status code should be 401


    #-----------------------------------------
  @PostAddClients
  Scenario: error de endpoint Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 404


  Scenario:metodo errado Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method PUT
    Then the status code should be 405


  Scenario: sin api key Add a new client
    Given endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 401

  Scenario: mismo name de un cliente Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClient.json
    When execute method POST
    Then the status code should be 400

  Scenario: name vacio Add a new client
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body Client/AddClientFail.json
    When execute method POST
    Then the status code should be 400