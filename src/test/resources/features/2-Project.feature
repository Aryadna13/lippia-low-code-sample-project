@Regression @Project @ProjectSuccess @Success
Feature: Project success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api
    And call 1-Workspace.feature@GetWokspaces


  @GetAllProjects
  Scenario: Get all projects on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @PostProject
  Scenario: Add a new project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    And body Project/NewProjectBody.json
    When execute method POST
    Then the status code should be 201

  @GetProject
  Scenario: Get a project on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 200

  @FindProjectById
  Scenario: Find project by ID
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body Project/FindById.json
    When execute method GET
    Then the status code should be 200

  @UpdateProject
  Scenario: Update proyecto
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body Project/cambios.json
    When execute method PUT
    Then the status code should be 200
    And response should be name = Cambio1






