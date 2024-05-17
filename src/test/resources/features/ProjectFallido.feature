@Regression @Project @ProjectFailed @Failed
Feature: Project Failed

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And base url $(env.base_url_clockify)
    And call Workspace.feature@GetWokspaces
    And call Project.feature@GetAllProjects


  @GetAllProjects @BadEndpoint
  Scenario: Get all projects on workspace
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/
    When execute method GET
    Then the status code should be 404

  @GetAllProjects @BadMethod
  Scenario: Get all projects on workspace
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method PUT
    Then the status code should be 405

  @GetAllProjects @NoApiKey
  Scenario: Get all projects on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 401

    #-----------------------------------3

  @PostProject @BadEndpoint
  Scenario: Add a new project
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/
    And body jsons/bodies/Project/NewprojectBody.json
    When execute method POST
    Then the status code should be 404

  @PostProject @BadMethod
  Scenario: Add a new project
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method PUT
    Then the status code should be 405

  @PostProject @NoApiKey
  Scenario: Add a new project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method POST
    Then the status code should be 401

  @PostProject @RepeatedProjectName
  Scenario: Add a new project
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body jsons/bodies/Project/NewProjectBody.json
    When execute method POST
    Then the status code should be 400

  @PostProject @EmptyProjecttName
  Scenario: Add a new project
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body jsons/bodies/Project/NewProyectBodyFail.json
    When execute method POST
    Then the status code should be 400

#----------------------------

  @FindProjectById @BadEndpoint
  Scenario: Find project by ID
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1
    And body jsons/bodies/Project/FindById.json
    When execute method GET
    Then the status code should be 404

  @FindProjectById @BadMethod
  Scenario: Find project by ID
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body jsons/bodies/Project/FindById.json
    When execute method POST
    Then the status code should be 405

  @FindProjectById @NoApiKey
  Scenario: Find project by ID
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body jsons/bodies/Project/FindById.json
    When execute method GET
    Then the status code should be 401

  #------------------------------

  @DeleteProject @BadEndpoint
  Scenario: Delete project from workspace
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/
    When execute method DELETE
    Then the status code should be 404

  @DeleteProject @BadMethod
  Scenario: Delete project from workspace
    Given header x-api-key = $(env.x_api_key)
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method POST
    Then the status code should be 405

  @DeleteProject @NoApiKey
  Scenario: Delete project from workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method DELETE
    Then the status code should be 401