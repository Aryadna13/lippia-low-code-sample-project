@Regression @Project @ProjectSuccess @Success
Feature: Project success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = $(env.x_api_key)
    And base url $(env.base_url_clockify)
    And call 1-Workspace.feature@GetWokspaces


  @GetAllProjects
  Scenario: Get all projects on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id
    And print response

  @PostProject
  Scenario: Add a new project
    Given endpoint /v1/workspaces/662ae2461babe83b2117faba/projects
    And body jsons/bodies/Project/NewProjectBody.json
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
    And body jsons/bodies/Project/FindById.json
    When execute method GET
    Then the status code should be 200

  @UpdateProject
  Scenario: Update proyecto
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body jsons/bodies/Project/UpdateProject.json
    When execute method PUT
    Then the status code should be 200
    And response should be name = CambioExitoso






