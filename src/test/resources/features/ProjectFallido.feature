@Regresion @project
Feature: Projects

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url https://api.clockify.me/api
    And call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@GetAllProjectsExitoso


  @GetAllProjectsExitoso


  Scenario: endpoint errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method GET
    Then the status code should be 404


  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method PUT
    Then the status code should be 405


  Scenario: sin api key
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 401

    #-----------------------------------


    #--------------------------------
  @PostProject

  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    And body Project/NewprojectBody.json
    When execute method POST
    Then the status code should be 404


  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body Project/NewprojectBody.json
    When execute method PUT
    Then the status code should be 405


  Scenario: no apikey
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    And body Project/NewprojectBody.json
    When execute method POST
    Then the status code should be 401


  Scenario: name repetido
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body Project/NewprojectBody.json
    When execute method POST
    Then the status code should be 400


  Scenario: name vacio
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body Project/NewProyectBodyFail.json
    When execute method POST
    Then the status code should be 400


#----------------------------

  @FindProjectById
  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1
    And body Project/FindById.json
    When execute method GET
    Then the status code should be 404

  Scenario: metodo errado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body Project/FindById.json
    When execute method POST
    Then the status code should be 405


  Scenario: no api key
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body Project/FindById.json
    When execute method GET
    Then the status code should be 401




  #------------------------------

  @DeleteProject @fail
  Scenario: error de endpoint
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/
    When execute method DELETE
    Then the status code should be 404

  @fail
  Scenario: borrar proyecto a Archivado
    Given header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method POST
    Then the status code should be 405

  @fail
  Scenario: no apikey
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method DELETE
    Then the status code should be 401