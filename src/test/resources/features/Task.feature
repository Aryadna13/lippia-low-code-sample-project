@Regression @Task @TaskSuccess @Success @Taski
Feature: Task success

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = $(env.x_api_key)
    And base url $(env.base_url_clockify)
    And call Workspace.feature@GetWokspaces
    And call Project.feature@GetAllProjects

  Scenario: Get all projects on workspace
    Given endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @PostAddANewTask
  Scenario: Add a new task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body jsons/bodies/Task/AddNewTask.json
    When execute method POST
    Then the status code should be 201

  @GetAllTasks
  Scenario: Get all my Tasks
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 200
    * define taskId = $.[0].id

  @PutUpdateTask
  Scenario: Update task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And body jsons/bodies/Task/Update-deleteTask.json
    When execute method PUT
    Then the status code should be 200

  @DeleteTask
  Scenario: Delete task from project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 200

  @PostAddANewTask
  Scenario: Add a new task on project
    Given endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body jsons/bodies/Task/UpdateNameTaskFail.json
    When execute method POST
    Then the status code should be 201


