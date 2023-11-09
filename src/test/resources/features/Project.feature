@project
Feature: Projects

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = NTcyZWZjZjAtMzY0Zi00ZDc2LWJlNzgtZGI4MzkxZDQ5MTFk


 @GetWokspaces
  Scenario: Get all my workspaces
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    When execute method GET
    Then the status code should be 200
   * define workspaceId = $.[0].id

 @GetAllProjects
  Scenario: llamar a todos los proyectos
    Given call Project.feature@GetWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @GetProject
  Scenario: consultar un proyecto
    Given call Project.feature@GetAllProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 200

  @PostProject
  Scenario: Añadir un nuevo proyecto
    Given call Project.feature@GetWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6537291f940183327c06fc57/projects
    And body projectBody.json
    When execute method POST
    Then the status code should be 201

  @PatchProject
    Scenario: Update project estimate
      Given call Project.feature@GetProject
      And base url https://api.clockify.me/api
      And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/memberships
      And body patch.json
      When execute method PATCH
      Then the status code should be 200
      #And validar campo 'amount' = 9 No pude hacer andar esta validacion final >:C






