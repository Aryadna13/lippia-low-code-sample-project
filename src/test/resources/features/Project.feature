@Regresion @project
Feature: Projects

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MTc1YTM3NzMtMmM4YS00NmY1LTg4NGQtZWFiYzE1YjE5ZDUx
    And base url https://api.clockify.me/api


  @GetAllProjectsExitoso
  Scenario: llamar a todos los proyectos
    Given call Workspace.feature@GetWokspacesExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @GetProjectExitoso
  Scenario: consultar un proyecto
    Given call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@GetAllProjectsExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 200

  @PostProject
  Scenario: Añadir un nuevo proyecto
    Given call Workspace.feature@GetWokspacesExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body Project/NewprojectBody.json
    When execute method POST
    Then the status code should be 201


  @FindProjectByIdExitoso
  Scenario: Update project to Archivado
    Given call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@GetProjectExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body Project/FindById.json
    When execute method GET
    Then the status code should be 200

  @PatchProject
  Scenario: Update proyecto a Archivado
    Given call Workspace.feature@GetWokspacesExitoso
    And call Project.feature@FindProjectByIdExitoso
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body Project/ActualizarProject.json
    When execute method PUT
    Then the status code should be 200






